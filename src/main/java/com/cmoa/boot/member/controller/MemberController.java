package com.cmoa.boot.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
				// 로그인 실패, No Data Found!
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

	@GetMapping("/member/findId.do")
	public String showFindIdForm() {
		return "member/findId";
	}

	@GetMapping("/member/findPw.do")
	public String showFindPwForm() {
		return "member/findPw";
	}
}
