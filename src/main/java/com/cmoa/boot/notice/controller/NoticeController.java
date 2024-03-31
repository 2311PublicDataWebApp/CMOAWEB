package com.cmoa.boot.notice.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cmoa.boot.notice.domain.NoticeVO;
import com.cmoa.boot.notice.domain.NoticePageInfo;
import com.cmoa.boot.notice.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService nService;
	
	/**
	 * 공지 목록 GetMapping
	 */
	@GetMapping("/notice/list.do")
	public String selectNoticeList(Model model
			, @RequestParam(value="page", defaultValue = "1", required = false) Integer currentPage) {
		int boardLimit = 5;
		int totalCount = nService.getTotalCount();
		NoticePageInfo pi = new NoticePageInfo(currentPage, totalCount, boardLimit);
        List<NoticeVO> nList = nService.selectNoticeList(pi);
        model.addAttribute("nList", nList);
        model.addAttribute("pi", pi);
        return "notice/list";
	}
	
	/**
	 * 공지 상세 GetMapping
	 */
	@GetMapping("/notice/detail.do")
	public String showDetailForm(Model model, Integer noticeNo) {
		NoticeVO notice = nService.selectOneByNo(noticeNo);
		model.addAttribute("notice", notice);
		return "notice/detail";
	}
	
	/**
	 * 공지 등록 GetMapping
	 * @throws IOException 
	 */
	@GetMapping("/notice/insert.do")
	public String showInsertForm(HttpSession session, Model model
			, HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			String userId = (String) session.getAttribute("userId");
			if ("admin".equals(userId)) {
				return "notice/insert";
			} else {
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=utf-8");
				PrintWriter writer = response.getWriter();
				writer.println("<script type='text/javascript'>");
				writer.println("alert('관리자만 이용 가능한 페이지입니다.');");
				writer.println("</script>");
				writer.flush();
				return "member/login";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	/**
	 * 공지 등록 PostMapping
	 */
	@PostMapping("/notice/insert.do")
	public String insertNotice(NoticeVO notice, Model model
			, HttpServletRequest request, HttpServletResponse response) {
		try {
			int result = nService.inserNotice(notice);
			if (result > 0) {
				return "redirect:/notice/list.do";
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
	
}
