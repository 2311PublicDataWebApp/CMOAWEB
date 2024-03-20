package com.cmoa.boot.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cmoa.boot.notice.domain.NoticeVO;
import com.cmoa.boot.notice.domain.PageInfo;
import com.cmoa.boot.notice.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService nService;
	
//	@RequestMapping(value = "notice/list", method = RequestMethod.GET)
//	@GetMapping("/notice/list.do")
//	public String showListForm() {
//		return "notice/list";
//	}
	
	@GetMapping("/notice/list.do")
	public String selectNoticeList(Model model
			, @RequestParam(value="page", defaultValue = "1", required = false) Integer currentPage) {
		int boardLimit = 5;
		int totalCount = 13;
		PageInfo pi = new PageInfo(currentPage, totalCount, boardLimit);
        List<NoticeVO> nList = nService.selectNoticeList(pi);
        model.addAttribute("nList", nList);
        model.addAttribute("pi", pi);
        return "notice/list";
	}
}
