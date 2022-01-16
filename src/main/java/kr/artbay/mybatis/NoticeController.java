package kr.artbay.mybatis;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletResponse;
import kr.artbay.common.ArtBayVo;
import kr.artbay.common.Page;

@RestController
public class NoticeController {
	@Autowired
	NoticeService service;
	boolean b = false;
	ArtBayVo vo = null;
	PrintWriter out;
	String msg;
	
	@RequestMapping(value="/noticeInsert", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView noticeInsert(Page page) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("page", page);
		mv.setViewName("customer.writeNotice");
		return mv;
	}
	
	
	@RequestMapping(value="/noticeSave", method= {RequestMethod.POST})
	public void modifySave(ArtBayVo vo, Page page, HttpServletResponse resp) {
		try {
			out = resp.getWriter();
			b = service.noticeSave(vo);
			String temp = "{'flag':'%s'}";
			String flag = "";
			if(b) {
				flag="OK";
			}else {
				flag="Fail";
			}
			String json = String.format(temp, flag);
			json = json.replaceAll("'", "\"");
			out.print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}