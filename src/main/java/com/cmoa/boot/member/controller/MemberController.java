package com.cmoa.boot.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cmoa.boot.member.domain.MemberVO;
import com.cmoa.boot.member.service.MemberService;

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
	public String memberLogin(MemberVO mOne, HttpSession session, Model model) {
		try {
			MemberVO member = mService.memberLogin(mOne);
			if (member != null) {
				session.setAttribute("userId", mOne.getUserId());
				session.setAttribute("userName", mOne.getUserName());
			} else {
				model.addAttribute("msg", "로그인 서비스를 완료하지 못했습니다.");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		return "redirect:/";
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
	public String registerMember(MemberVO member) {
		int result = mService.registerMember(member);
		return "redirect:/member/login.do";
	}

	@GetMapping("/member/findId.do")
	public String showFindIdForm() {
		return "member/findId";
	}
	
	@PostMapping("/member/findId.do")
	public String findId(MemberVO mOne, Model model) {
		try {
			MemberVO member = mService.findOneId(mOne);
			if (member != null) {
				model.addAttribute("userId", member.getUserId());
				return "member/findIdResult";
			} else {
				model.addAttribute("msg", "입력하신 정보로 등록된 아이디가 없습니다.");
				return "common/errorPage";
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
	public String findPw(MemberVO mOne, Model model) {
		try {
			MemberVO member = mService.findOneForPw(mOne);
			if (member != null) {
				model.addAttribute("userId", member.getUserId());
				return "member/resetPw";
			} else {
				model.addAttribute("msg", "입력하신 정보로 등록된 회원이 없습니다.");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@PostMapping("/member/resetPw.do")
	public String updateMemberPW(MemberVO member, Model model) {
		int result = mService.updateMemberPW(member);
		return "redirect:/member/login.do";
	}
	
	@GetMapping("/member/mypage.do")
	public String showMyPage(HttpSession session, Model model) {
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
				model.addAttribute("msg", "회원 정보 조회를 완료하지 못했습니다.");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@GetMapping("/member/update.do")
	public String showUpdateForm(HttpSession session, Model model) {
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
				model.addAttribute("msg", "회원 정보 조회를 완료하지 못했습니다.");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@PostMapping("/member/update.do")
	public String updateMember(MemberVO member, Model model) {
		try {
			int result = mService.updateMember(member);
			if (result > 0) {
				model.addAttribute("member", member);
				return "redirect:/member/mypage.do";
			} else {
				model.addAttribute("msg", "수정을 완료하지 못했습니다.");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@GetMapping("/member/delete.do")
	public String deleteMember(String userId, HttpSession session, Model model) {
		try {
			String sessionId = (String) session.getAttribute("userId");
			int result = 0;
			if (sessionId != null && sessionId.equals(userId)) {				
				result = mService.deleteMember(userId);
			} else {
				model.addAttribute("msg", "로그인을 먼저 진행해주세요.");
				return "common/errorPage";
			}
			if (result > 0) {
				return "redirect:/member/logout.do";
			} else {
				model.addAttribute("msg", "탈퇴가 완료되지 못했습니다.");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
}
