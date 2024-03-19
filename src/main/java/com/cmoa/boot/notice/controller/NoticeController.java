package com.cmoa.boot.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.cmoa.boot.notice.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService nService;
	
//	@RequestMapping(value = "notice/list", method = RequestMethod.GET)
	@GetMapping("/notice/list.do")
	public String showListForm() {
		return "notice/list";
	}
}
