package kr.artbay.mybatis;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
	String serial = "";
	Page page = new Page();
	
	@RequestMapping(value="/noticeView", method= {RequestMethod.POST, RequestMethod.GET}) 
	public ModelAndView view(String serial, Page page) {
		ModelAndView mv = new ModelAndView();
		vo = service.noticeView(serial, 'n');
		
		mv.addObject("vo", vo);
		mv.addObject("Page", page);
		mv.setViewName("customer.noticeView"); //응답할 view이름. 경로. 뷰페이지 이동. value랑 관계없음
		return mv;
	} 
	//작성버튼 클릭 시 이동
	@RequestMapping(value="/noticeInsert", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView noticeInsert(Page page) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("page", page);
		mv.setViewName("customer.writeNotice");
		return mv;
	}
	
	//공지 저장
		@RequestMapping(value="/noticeSave", method= {RequestMethod.POST, RequestMethod.GET})
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
		
		//검색어 조회
		@RequestMapping(value="/customerNoticeList", method= {RequestMethod.POST, RequestMethod.GET})
		public ModelAndView noticeList(Page page) {
			ModelAndView mv = new ModelAndView();
			List<ArtBayVo> list = service.noticeSearch(page); //service=>dao역할
			page = service.getPage();
			mv.addObject("page", page);
			mv.addObject("list", list);
			mv.setViewName("customer.noticeList");
			
			return mv;
		}
	
		
		
}