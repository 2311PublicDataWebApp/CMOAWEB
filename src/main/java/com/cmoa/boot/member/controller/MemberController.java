package com.cmoa.boot.member.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cmoa.boot.member.domain.MemberPageInfo;
import com.cmoa.boot.member.domain.MemberVO;
import com.cmoa.boot.member.domain.MyBookingVO;
import com.cmoa.boot.member.service.MemberService;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

@Controller
public class MemberController {

	@Autowired
	private MemberService mService;

//	@RequestMapping(value = "member/login", method = RequestMethod.GET)
	@GetMapping("/member/login.do")
	public String showLoginForm() {
		return "member/login";
	}

	@PostMapping("/member/login.do")
	public String memberLogin(MemberVO mOne, HttpSession session, Model model
			, HttpServletRequest request, HttpServletResponse response) {
		try {
			MemberVO member = mService.memberLogin(mOne);
			if (member != null) {
				session.setAttribute("userId", mOne.getUserId());
				session.setAttribute("userName", mOne.getUserName());
				return "redirect:/";
			} else {
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=utf-8");
				PrintWriter writer = response.getWriter();
				writer.println("<script type='text/javascript'>");
				writer.println("alert('로그인 서비스를 완료하지 못했습니다.');");
				writer.println("</script>");
				writer.flush();
				return "member/login";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@GetMapping("/app/login/kakao")
	public String socialNetworkLogin(String code, HttpSession session) throws Exception {
		System.out.println(code);
		String access_Token = this.getAccessToken(code);
	    HashMap<String, Object> userInfo = this.getKakaoInfo(access_Token);
	    System.out.println("login Controller : " + userInfo);
	    //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
	    if (userInfo.get("userNickname") != null) {
	        session.setAttribute("userId", userInfo.get("userNickname"));
	    }	    	
		return "redirect:/";
	}
	
	// 카카오 로그인 access_token 리턴
	public String getAccessToken(String code) throws Exception {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=ac39a81eca86741dbf9dcb320339f366"); // 본인이 발급받은 key
			sb.append("&redirect_uri=http://127.0.0.1:9191/app/login/kakao"); // 본인이 설정해 놓은 경로
			sb.append("&code=" + code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			Gson gson = new Gson();
			JsonElement element = gson.fromJson(result, JsonElement.class);

			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return access_Token;
	}

	// 카카오 사용자 정보 추출
	public HashMap<String, Object> getKakaoInfo(String accessToken) throws Exception {
	    HashMap<String, Object> userInfo = new HashMap<>();
	    String reqURL = "https://kapi.kakao.com/v2/user/me";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Authorization", "Bearer " + accessToken);

	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);

	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        String result = br.lines().collect(Collectors.joining());
	        System.out.println("response body : " + result);

	        Gson gson = new Gson();
	        JsonObject element = gson.fromJson(result, JsonObject.class);

	        JsonObject properties = element.getAsJsonObject("properties");
	        JsonObject kakao_account = element.getAsJsonObject("kakao_account");

	        String userEmail = kakao_account.has("email") ? kakao_account.getAsJsonObject().get("email").getAsString() : null;
	        String userNickname = properties.has("nickname") ? properties.getAsJsonObject().get("nickname").getAsString() : null;

	        if (userEmail != null) {
	            userInfo.put("userEmail", userEmail);
	        }
	        if (userNickname != null) {
	            userInfo.put("userNickname", userNickname);
	        }

	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    return userInfo;
	}

	@GetMapping("/member/logout.do")
	public String memberLogout(HttpSession session, Model model) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/member/register.do")
	public String showRegisterForm() {
		return "member/register";
	}
	
	@PostMapping("/member/register.do")
	public String registerMember(MemberVO member, Model model
			, HttpServletRequest request, HttpServletResponse response) {
		try {
			int result = mService.registerMember(member);
			if (result > 0) {
				return "redirect:/member/login.do";				
			} else {
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=utf-8");
				PrintWriter writer = response.getWriter();
				writer.println("<script type='text/javascript'>");
				writer.println("alert('로그인 서비스를 완료하지 못했습니다.');");
				writer.println("</script>");
				writer.flush();
				return "member/login";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	@GetMapping("/member/findId.do")
	public String showFindIdForm() {
		return "member/findId";
	}
	
	@PostMapping("/member/findId.do")
	public String findId(MemberVO mOne, Model model
			, HttpServletRequest request, HttpServletResponse response) {
		try {
			MemberVO member = mService.findOneId(mOne);
			if (member != null) {
				model.addAttribute("userId", member.getUserId());
				return "member/findIdResult";
			} else {
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=utf-8");
				PrintWriter writer = response.getWriter();
				writer.println("<script type='text/javascript'>");
				writer.println("alert('입력하신 정보로 등록된 아이디가 없습니다.');");
				writer.println("</script>");
				writer.flush();
				return "member/login";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	@GetMapping("/member/findPw.do")
	public String showFindPwForm() {
		return "member/findPw";
	}
	
	@PostMapping("/member/findPw.do")
	public String findPw(MemberVO mOne, Model model
			, HttpServletRequest request, HttpServletResponse response) {
		try {
			MemberVO member = mService.findOneForPw(mOne);
			if (member != null) {
				model.addAttribute("userId", member.getUserId());
				return "member/resetPw";
			} else {
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=utf-8");
				PrintWriter writer = response.getWriter();
				writer.println("<script type='text/javascript'>");
				writer.println("alert('입력하신 정보로 등록된 회원이 없습니다.');");
				writer.println("</script>");
				writer.flush();
				return "member/login";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@PostMapping("/member/resetPw.do")
	public String updateMemberPW(MemberVO member, Model model
			, HttpServletRequest request, HttpServletResponse response) {
		try {
			int result = mService.updateMemberPW(member);
			if (result > 0) {
				return "redirect:/member/login.do";		
			} else {
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=utf-8");
				PrintWriter writer = response.getWriter();
				writer.println("<script type='text/javascript'>");
				writer.println("alert('요청하신 서비스를 완료하지 못했습니다.');");
				writer.println("</script>");
				writer.flush();
				return "member/login";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}

	}
	
	@GetMapping("/member/myPage.do")
	public String showMyPage(HttpSession session, Model model
			, HttpServletRequest request, HttpServletResponse response) {
		try {
			String userId = (String) session.getAttribute("userId");
			MemberVO member = null;
			if (userId != null) {
				member = mService.findOneById(userId);
			} else {
				
			}
			if (member != null) {
				model.addAttribute("member", member);
				return "member/myPage";
			} else {
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=utf-8");
				PrintWriter writer = response.getWriter();
				writer.println("<script type='text/javascript'>");
				writer.println("alert('요청하신 서비스를 완료하지 못했습니다.');");
				writer.println("</script>");
				writer.flush();
				return "redirect:/";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@GetMapping("/member/myBooking.do")
	public String showMyBookingPage(HttpSession session, Model model, @RequestParam(value="page", defaultValue = "1", required = false) Integer currentPage ) {
		try {
			String userId = (String) session.getAttribute("userId");
			int boardLimit = 3;
			int totalCount = mService.getTotalCount(userId);
			MemberPageInfo pi = new MemberPageInfo(currentPage, totalCount, boardLimit);
			List<MyBookingVO> bList = mService.selectBookingList(pi, userId);
			model.addAttribute("bList", bList);
			model.addAttribute("pi", pi);
			return "member/myBooking";
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@GetMapping("/member/update.do")
	public String showUpdateForm(HttpSession session, Model model
			, HttpServletRequest request, HttpServletResponse response) {
		try {
			String userId = (String) session.getAttribute("userId");
			MemberVO member = null;
			if (userId != null) {
				member = mService.findOneById(userId);
			} else {
				
			}
			if (member != null) {
				model.addAttribute("member", member);
				return "member/update";
			} else {
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=utf-8");
				PrintWriter writer = response.getWriter();
				writer.println("<script type='text/javascript'>");
				writer.println("alert('요청하신 서비스를 완료하지 못했습니다.');");
				writer.println("</script>");
				writer.flush();
				return "member/myPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@PostMapping("/member/update.do")
	public String updateMember(MemberVO member, Model model
			, HttpServletRequest request, HttpServletResponse response) {
		try {
			int result = mService.updateMember(member);
			if (result > 0) {
				model.addAttribute("member", member);
				return "redirect:/member/myPage.do";
			} else {
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=utf-8");
				PrintWriter writer = response.getWriter();
				writer.println("<script type='text/javascript'>");
				writer.println("alert('요청하신 서비스를 완료하지 못했습니다.');");
				writer.println("</script>");
				writer.flush();
				return "member/myPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@GetMapping("/member/delete.do")
	public String deleteMember(String userId, HttpSession session, Model model
			, HttpServletRequest request, HttpServletResponse response) {
		try {
			String sessionId = (String) session.getAttribute("userId");
			int result = 0;
			if (sessionId != null && sessionId.equals(userId)) {				
				result = mService.deleteMember(userId);
			} else {
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=utf-8");
				PrintWriter writer = response.getWriter();
				writer.println("<script type='text/javascript'>");
				writer.println("alert('로그인이 필요합니다.');");
				writer.println("</script>");
				writer.flush();
				return "member/login";
			}
			if (result > 0) {
				return "redirect:/member/logout.do";
			} else {
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=utf-8");
				PrintWriter writer = response.getWriter();
				writer.println("<script type='text/javascript'>");
				writer.println("alert('요청하신 서비스를 완료하지 못했습니다.');");
				writer.println("</script>");
				writer.flush();
				return "member/myPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
}
