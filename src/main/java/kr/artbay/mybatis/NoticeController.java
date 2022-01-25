package kr.artbay.mybatis;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.artbay.common.ArtBayAtt;
import kr.artbay.common.ArtBayVo;
import kr.artbay.common.Page;

@RestController
public class NoticeController {
	@Autowired
	NoticeService service;
	boolean b = false;
	ArtBayVo vo = null;
	PrintWriter out;
	int grp = 0;
	String msg;
	String serial = "";
	Page page = new Page();
	List<String> delNoticeList;
	
	@RequestMapping(value="/noticeView", method= {RequestMethod.POST, RequestMethod.GET}) 
	public ModelAndView view(int serial, Page page) {
		ModelAndView mv = new ModelAndView();
		vo = service.noticeView(serial);
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
		public void noticeSave(ArtBayVo vo, HttpServletResponse resp) {
			try {
				out = resp.getWriter();
				this.b = service.insertNtc(vo);
				this.grp = service.getGrp();
				String temp = "{'flag':'%s', 'grp' : '%s'}";
				String flag = "";
				if(b) {
					flag="OK";
				}else {
					flag="Fail";
				}
				String json = String.format(temp, flag, grp);
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
		//선택된 공지 삭제
		@RequestMapping(value="/deleteNotice", method= {RequestMethod.POST, RequestMethod.GET})
		public ModelAndView deleteNotice(HttpServletRequest req, Page page){
			ModelAndView mv = new ModelAndView();
			String[] chk_Value = req.getParameterValues("hiddenChk"); 
			delNoticeList = new ArrayList<String>(Arrays.asList(chk_Value));
			b = service.deleteNotice(delNoticeList);
			if(b) {
				msg="공지가 삭제되었습니다.";
			}else {
				msg="공지 삭제 중 오류 발생.";
			}
			List<ArtBayVo> list = service.noticeSearch(page);
			page = service.getPage();
			mv.addObject("msg", msg);
			mv.addObject("Page", page);
			mv.addObject("list", list);
			mv.setViewName("customer.noticeList");
			return mv;
			
			
		}
	
}