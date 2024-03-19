package com.cmoa.boot.exhibit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.cmoa.boot.exhibit.service.ExhibitService;

@Controller
public class ExhibitController {

	@Autowired
	private ExhibitService eService;
	
//	@RequestMapping(value = "exhibit/list", method = RequestMethod.GET)
	@GetMapping("/exhibit/list.do")
	public String showListForm() {
		return "exhibit/list";
	}

	@GetMapping("/exhibit/reservation.do")
	public String showReserveForm() {
		return "exhibit/reservation";
	}
	
	@GetMapping("/exhibit/detail.do")
	public String showDetailForm() {
		return "exhibit/detail";
	}

}
