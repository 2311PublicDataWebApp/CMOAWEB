package com.cmoa.boot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.cmoa.boot.exhibit.domain.ExhibitVO;
import com.cmoa.boot.exhibit.service.ExhibitService;
import com.cmoa.boot.notice.domain.NoticeVO;
import com.cmoa.boot.notice.service.NoticeService;

@Controller
public class HomeController {
	
	@Autowired
	private NoticeService nService;
	@Autowired
	private ExhibitService eService;
	
	@GetMapping("/")
	public String home(Model model) {
		List<NoticeVO> nList = nService.selectNoticeList();
		List<ExhibitVO> eList = eService.selectExhibitList();
        model.addAttribute("nList", nList);
        model.addAttribute("eList", eList);
		return "main";
	}
	
}