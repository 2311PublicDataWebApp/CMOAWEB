package com.cmoa.boot.booking.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cmoa.boot.booking.domain.BookResultVO;
import com.cmoa.boot.booking.domain.BookingVO;
import com.cmoa.boot.booking.service.BookingService;
import com.cmoa.boot.exhibit.domain.ExhibitVO;
import com.cmoa.boot.exhibit.service.ExhibitService;
import com.cmoa.boot.member.domain.MemberVO;
import com.cmoa.boot.member.service.MemberService;

@Controller
public class BookingController {

	@Autowired
	private ExhibitService eService;
	@Autowired
	private MemberService mService;
	@Autowired
	private BookingService bService;
	
	@GetMapping("/booking/apply.do")
	public String showApplyForm(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model, Integer exhibitNo) {
		try {
			List<ExhibitVO> eList = eService.selectExhibitName();
			String userId = (String) session.getAttribute("userId");
			MemberVO member = null;
			if (userId != null) {
				member = mService.findOneById(userId);
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
			if (member != null) {
				model.addAttribute("eList", eList);
				model.addAttribute("member", member);
				return "booking/apply";
			} else {
				model.addAttribute("msg", "요청하신 서비스를 완료하지 못하였습니다.");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	 
	}
	
	@ResponseBody
	@GetMapping("/booking/date/ajax.do")
	public Map<String, Object> showDateAjax(Integer exhibitNo) {
		ExhibitVO eOne = eService.findOneByNo(exhibitNo);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("startDate", eOne.getStartDate());
		result.put("endDate", eOne.getEndDate());
		return result;
//		json.put("startDate", eOne.getStartDate());
//		json.put("endDate", eOne.getEndDate());
//		return json.toString();
	}
	
	@ResponseBody
	@GetMapping("/booking/pnum/ajax.do")
	public Map<String, Object> showPeopleNoAjax(BookingVO booking, Integer exhibitNo) {
		int totalCount = bService.selectTotalCount(booking);
		ExhibitVO eOne = eService.findOneByNo(exhibitNo);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("totalCount", totalCount);
		result.put("exhibitPeople", eOne.getExhibitPeople());
		return result;
//		json.put("startDate", eOne.getStartDate());
//		json.put("endDate", eOne.getEndDate());
//		return json.toString();
	}
	
	@PostMapping("/booking/apply.do")
	public String insertBooking(BookingVO booking, HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) {
		try {
			int result = bService.insertBooking(booking);
			if (result > 0) {
				int bookingNo = bService.getCurrBookingNo();
				BookResultVO bOne = bService.findOneByNo(bookingNo);
				model.addAttribute("booking", bOne);
				return "booking/applyInvoice";
			} else {
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=utf-8");
				PrintWriter writer = response.getWriter();
				writer.println("<script type='text/javascript'>");
				writer.println("alert('예매가 정상적으로 진행되지 않았습니다.');");
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
