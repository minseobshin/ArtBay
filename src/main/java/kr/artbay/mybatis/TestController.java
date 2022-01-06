package kr.artbay.mybatis;

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
	
	@RequestMapping(value="/join")
	public ModelAndView join() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("imsi/join");
		
		return mv;
	}
	
	@RequestMapping(value="/memberModify")
	public ModelAndView memberModify() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("imsi/memberModify");
		
		return mv;
	}
	
	@RequestMapping(value="/Bid")
	public ModelAndView Bid() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("imsi/Bid");
		
		return mv;
	}
	
	@RequestMapping(value="/SuccessfulBid")
	public ModelAndView SuccessfulBid() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("imsi/SuccessfulBid");
		
		return mv;
	}
	
	@RequestMapping(value="/Consign")
	public ModelAndView Consign() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("imsi/Consign");
		
		return mv;
	}
	
	@RequestMapping(value="/Result")
	public ModelAndView Result() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("imsi/Result");
		
		return mv;
	}
	
	@RequestMapping(value="/FAQ")
	public ModelAndView FAQ() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("imsi/FAQ");
		
		return mv;
	}
	
}
