package kr.artbay.mybatis;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class TestController {

	@Autowired
	TestService service;
		
	public TestController() {
		System.out.println("ArtBayController.........................................");
	}
	
	@RequestMapping(value="/")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		
		return mv;
	}
	@RequestMapping(value = "/home")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index_sby");
		return mv;		
	}
	/*
	@RequestMapping(value = "/login")
	public void memberLogin(HttpServletRequest req) {
		String mid = req.getParameter("mid");
		String pwd = req.getParameter("pwd");
		HttpSession session = req.getSession();
		
		//아이디/비밀번호에 맞는 회원정보 조회(MemberVO)
		//To do
		
		session.setAttribute("mid", mid);	//test용 아이디
	}
	
	@RequestMapping(value = "/logout")
	public void memberLogout(HttpServletRequest req) { 
		HttpSession session = req.getSession();
		session.removeAttribute("mid");		
	}
	*/
	@RequestMapping(value="/Bid")
	public ModelAndView Bid() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("lsy/Bid");
		
		return mv;
	}
	
	@RequestMapping(value="/SuccessfulBid")
	public ModelAndView SuccessfulBid() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("lsy/SuccessfulBid");
		
		return mv;
	}
	@RequestMapping(value="/ConsignGuide")
	public ModelAndView ConsignGuide (HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("lsy/ConsignGuide");
		return mv;
	}  
	@RequestMapping(value="/Consign")
	public ModelAndView Consign() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("lsy/Consign");
		
		return mv;
	}
	
	@RequestMapping(value="/Result")
	public ModelAndView Result() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("lsy/Result");
		
		return mv;
	}
	
	
	
	@RequestMapping(value = "/noticeList")
	public ModelAndView noticeList() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("lsy/noticeList");
		return mv;		
	}	
	
	@RequestMapping(value = "/noticeView")
	public ModelAndView noticeView() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("lsy/noticeView");
		return mv;		
	}	
	
	@RequestMapping(value="/list")
	public ModelAndView artbayMain(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("artbay/list");
		return mv;
	}
	
	@RequestMapping(value="/view")
	public ModelAndView artbayView(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("artbay/view");
		return mv;
	}
	
	
	@RequestMapping(value="/bidIntro")
	public ModelAndView artbayBidIntro(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("artbay/bidIntro");
		return mv;
	}
	
	@RequestMapping(value="/ListView")
	public ModelAndView ListView(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("lsy/ListView");
		return mv;
	}
	@RequestMapping(value="/ListModify")
	public ModelAndView ListModify(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("lsy/ListModify");
		return mv;
	}
}
