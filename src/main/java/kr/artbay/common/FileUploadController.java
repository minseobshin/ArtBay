package kr.artbay.common;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.artbay.mybatis.QnaService;

@Controller
public class FileUploadController {

	public static String uploadPath = "C:\\ArtBay\\ArtBay\\src\\main\\resources\\static\\upload\\";


	@Autowired
	QnaService qnaService;
	@RequestMapping(value = "/fileUp")
	public ModelAndView upload(@RequestParam("attFile") List<MultipartFile> mfList,
							   @ModelAttribute ArtBayVo vo,
							   @ModelAttribute Page page) {
		
		ModelAndView mv = new ModelAndView();
		String msg = "";
		UUID uuid = null;
		List<ArtBayAtt> attList = new ArrayList<>();
				
		try {
			for(MultipartFile file : mfList) {
				if(file.getSize() > 0) {
					File targetFile = new File(uploadPath + file.getOriginalFilename());
					file.transferTo(targetFile);
					
					uuid = UUID.randomUUID();
					String fileName = String.format("%s-%s", uuid.getLeastSignificantBits(), file.getOriginalFilename());
					File rename = new File(uploadPath + fileName);
					targetFile.renameTo(rename);
					
					ArtBayAtt att = new ArtBayAtt();
					att.setAttFile(fileName);
					att.setGrp(vo.getSerial()); //***
					attList.add(att);					
				}
			}
			
			vo.setAttList(attList);
			
			boolean result = qnaService.insertAtt(vo);
			
			if(result) {
				msg = "정상적으로 작성되었습니다.";
			} else {
				msg = "작성 중에 오류가 발생하였습니다.";
			}
			
			mv.addObject("msg", msg);
			mv.addObject("page", page);
			mv.setViewName("customer.consultationResult");
		
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return mv;
	}
	
	/*
	@RequestMapping(value="/fileUp")
	public ModelAndView upload(String job, int grp, int seq,
								@RequestParam("attfile") List<MultipartFile> mul,
								@ModelAttribute ArtBayAtt attVo,
								@ModelAttribute ArtBayVo vo,
								@ModelAttribute Page page) {
		ModelAndView mv = new ModelAndView();
		String msg = "";
		UUID uuid = null;
		List<ArtBayAtt> attList = new ArrayList<>();
				
		try {
			for(MultipartFile file : mfList) {
				if(file.getSize() > 0) {
					File targetFile = new File(uploadPath + file.getOriginalFilename());
					file.transferTo(targetFile);
					
					uuid = UUID.randomUUID();
					String fileName = String.format("%s-%s", uuid.getLeastSignificantBits(), file.getOriginalFilename());
					File rename = new File(uploadPath + fileName);
					targetFile.renameTo(rename);
					
					ArtBayAtt att = new ArtBayAtt();
					att.setAttFile(fileName);
					att.setGrp(vo.getSerial()); //***
					attList.add(att);					
				}
			}
			
			vo.setAttList(attList);
			
			boolean result = qnaService.insertAtt(vo);
			
			if(result) {
				msg = "정상적으로 작성되었습니다.";
			} else {
				msg = "작성 중에 오류가 발생하였습니다.";
			}
			
			mv.addObject("msg", msg);
			mv.addObject("page", page);
			mv.setViewName("customer.consultationResult");
		
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return mv;
	}*/
	
}
