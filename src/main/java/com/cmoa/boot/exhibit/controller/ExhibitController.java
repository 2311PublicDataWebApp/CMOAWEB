package com.cmoa.boot.exhibit.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cmoa.boot.exhibit.domain.ExhibitVO;
import com.cmoa.boot.exhibit.domain.ExhibitImgVO;
import com.cmoa.boot.exhibit.domain.ExhibitPageInfo;
import com.cmoa.boot.exhibit.service.ExhibitService;

@Controller
public class ExhibitController {

	@Autowired
	private ExhibitService eService;
	
	/**
	 * 전시 리스트 GetMapping
	 */
	@GetMapping("/exhibit/list.do")
	public String showExhibitList(Model model, @RequestParam(value="page", defaultValue = "1", required = false) Integer currentPage) {
		try {
			int boardLimit = 3;
			int totalCount = eService.getTotalCount();
			ExhibitPageInfo pi = new ExhibitPageInfo(currentPage, totalCount, boardLimit);
			List<ExhibitVO> eList = eService.selectExhibitList(pi);
			model.addAttribute("eList", eList);
			model.addAttribute("pi", pi);
			return "exhibit/list";
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	/**
	 * 전시 상세 GetMapping
	 */
	@GetMapping("/exhibit/detail.do")
	public String showDetailForm(Model model, Integer exhibitNo) {
		ExhibitVO exhibit = eService.findOneByNo(exhibitNo);
		List<ExhibitImgVO> iList = eService.findImgByNo(exhibitNo);
		model.addAttribute("exhibit", exhibit);
		model.addAttribute("iList", iList);
		return "exhibit/detail";
	}
	
	/**
	 * 전시 등록 GetMapping
	 */
	@GetMapping("/exhibit/insert.do")
	public String showInsertForm(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("userId");
		if ("admin".equals(userId)) {
			return "exhibit/insert";
		} else {
			model.addAttribute("msg", "관리자만 이용 가능한 페이지입니다.");
			return "common/errorPage";
		}
	}
	
	/**
	 * 전시 등록 PostMapping
	 */
	@PostMapping("/exhibit/insert.do")
	public String insertExhibit(@RequestParam(value = "titleFile", required = false) MultipartFile titleFile
			, @RequestParam(value = "uploadFile", required = false) List<MultipartFile> uploadFileList
			, HttpServletRequest request
			, ExhibitVO exhibit, Model model) throws IllegalAccessException, IOException {
		try {
			if (titleFile != null && !titleFile.isEmpty()) {
	            Map<String, Object> eMap = this.saveTitleFile(request, titleFile);
				String fileName = ((String)eMap.get("fileName"));
				String fileRename = ((String)eMap.get("fileRename"));
	            String filePath = ((String)eMap.get("savePath"));
	            long fileSize = ((long)eMap.get("fileLength"));
	            
	            exhibit.setFileName(fileName);
	            exhibit.setFileRename(fileRename);
	            exhibit.setFilePath(filePath);
	            exhibit.setFileSize(fileSize);
                }
            int result = eService.insertExhibit(exhibit);
            // uploadFileList
			System.out.println(uploadFileList);
			// uploadFileList
			if (uploadFileList != null && !uploadFileList.isEmpty()) {
	            for (MultipartFile uploadFile : uploadFileList) {
	                if (uploadFile != null && !uploadFile.isEmpty()) {
	                    Map<String, Object> exhMap = this.saveFile(request, uploadFile);
	                    ExhibitImgVO exhImage = new ExhibitImgVO();
	                    exhImage.setExhFileName((String)exhMap.get("fileName"));
	                    exhImage.setExhFileRename((String)exhMap.get("fileRename"));
	                    exhImage.setExhFilePath((String)exhMap.get("savePath"));
	                    exhImage.setExhFileSize((long)exhMap.get("fileLength"));
	                    // 각 이미지 정보 저장
	                    int imgResult = eService.insertExhImages(exhImage);
	                }
	            }
	        }
			if (result > 0) {
				return "redirect:/exhibit/list.do";
			} else {
				model.addAttribute("msg", "서비스가 완료되지 못했습니다.");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	/**
	 * 대표 첨부파일 저장
	 */
	private Map<String, Object> saveTitleFile(HttpServletRequest request, MultipartFile titleFile) throws Exception {
		String fileName = titleFile.getOriginalFilename();
		// 저장 경로
		String projectPath = request.getSession().getServletContext().getRealPath("resources");
		String saveDirectory = projectPath + "/eTitleFiles";
		File sDir = new File(saveDirectory);
		if (!sDir.exists()) {
			sDir.mkdir(); // uploadFile 폴더가 없을 시 자동 생성
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String strResult = sdf.format(new Date(System.currentTimeMillis()));
		String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
		String fileRename = strResult + "." + ext;
		String savePath = saveDirectory + "/" + fileRename;
		File file = new File(savePath);
		titleFile.transferTo(file);
		long fileLength = titleFile.getSize();
		Map<String, Object> eMap = new HashMap<String, Object>();
		eMap.put("fileName", fileName);
		eMap.put("fileRename", fileRename);
		eMap.put("savePath", savePath);
		eMap.put("fileLength", fileLength);
		return eMap;
	}
	
	/**
	 * 첨부파일 저장
	 */
	private Map<String, Object> saveFile(HttpServletRequest request, MultipartFile uploadFile) throws Exception {
		String fileName = uploadFile.getOriginalFilename();
		// 저장 경로
		String projectPath = request.getSession().getServletContext().getRealPath("resources");
		String saveDirectory = projectPath + "/euploadFiles";
		File sDir = new File(saveDirectory);
		if (!sDir.exists()) {
			sDir.mkdir(); // uploadFile 폴더가 없을 시 자동 생성
		}
		Random random = new Random(); // 랜덤 객체 생성
		int rNum = random.nextInt(100);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String strResult = sdf.format(new Date(System.currentTimeMillis())) + rNum;
		String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
		String fileRename = strResult + "." + ext;
		String savePath = saveDirectory + "/" + fileRename;
		File file = new File(savePath);
		uploadFile.transferTo(file);
		long fileLength = uploadFile.getSize();
		Map<String, Object> exhMap = new HashMap<String, Object>();
		exhMap.put("fileName", fileName);
		exhMap.put("fileRename", fileRename);
		exhMap.put("savePath", savePath);
		exhMap.put("fileLength", fileLength);
		return exhMap;
	}

}
