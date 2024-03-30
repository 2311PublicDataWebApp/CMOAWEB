package com.cmoa.boot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.cmoa.boot.notice.domain.NoticeVO;
import com.cmoa.boot.notice.service.NoticeService;

@Controller
public class HomeController {
	
	@Autowired
	private NoticeService nService;
	
//	@CrossOrigin(origins = "http://localhost:9191")
	@GetMapping("/")
	public String home(Model model) {
		List<NoticeVO> nList = nService.selectNoticeList();
        model.addAttribute("nList", nList);
		return "main";
	}
}