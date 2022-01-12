package kr.artbay.mybatis;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class IndexController {

	@Autowired
	TestService service;

	@RequestMapping(value="/main")
	public ModelAndView main() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main.main");
		return mv;
	}
	
	@RequestMapping(value="/bidList")
	public ModelAndView bidList() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("bid.list");
		return mv;
	}
	
	@RequestMapping(value="/bidView")
	public ModelAndView bidView() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("bid.view");
		return mv;
	}
	
	@RequestMapping(value="/bidResult")
	public ModelAndView bidResult() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("bid.Result");
		return mv;
	}
	
	@RequestMapping(value="/bidApplication")
	public ModelAndView bidApplication() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("bid.application");
		return mv;
	}
	
	@RequestMapping(value="/howtoHowto")
	public ModelAndView howTo() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("howto.howto");
		return mv;
	}
	
	@RequestMapping(value="/howtoBidIntro")
	public ModelAndView howtoBidIntro() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("howto.bidIntro");
		return mv;
	}
	
	@RequestMapping(value="/howtoConsignGuide")
	public ModelAndView howtoConsignGuide() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("howto.ConsignGuide");
		return mv;
	}
	
	@RequestMapping(value="/customerFAQ")
	public ModelAndView customerFAQ() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("customer.FAQ");
		return mv;
	}
	
	@RequestMapping(value="/customerConsultationList")
	public ModelAndView customerConsultationList() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("customer.consultationList");
		return mv;
	}
	
	@RequestMapping(value="/customerConsultationView")
	public ModelAndView customerConsultationView() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("customer.consultationView");
		return mv;
	}
	
	@RequestMapping(value="/customerConsultationInsert")
	public ModelAndView customerConsultationInsert() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("customer.consultationInsert");
		return mv;
	}
	
	@RequestMapping(value="/customerNoticeList")
	public ModelAndView customerNoticeList() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("customer.noticeList");
		return mv;
	}
	
	@RequestMapping(value="/customerNoticeView")
	public ModelAndView customerNoticeView() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("customer.noticeView");
		return mv;
	}
	
	@RequestMapping(value="/mypageBid")
	public ModelAndView mypageBid() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage.Bid");
		return mv;
	}
	
	@RequestMapping(value="/mypageSuccessfulBid")
	public ModelAndView mypageSuccessfulBid() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage.SuccessfulBid");
		return mv;
	}
	
	@RequestMapping(value="/mypageConsign")
	public ModelAndView mypageConsign() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage.Consign");
		return mv;
	}
	
	@RequestMapping(value="/mypageMemberModify")
	public ModelAndView mypageMemberModify() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage.memberModify");
		return mv;
	}
	
	@RequestMapping(value="/mypageMemberJoin")
	public ModelAndView mypageMemberJoin() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage.memberJoin");
		return mv;
	}
	
	@RequestMapping(value="/mypageMemberResult")
	public ModelAndView mypageMemberResult() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage.memberResult");
		
		return mv;
	}
	
	@RequestMapping(value="/mypageMemberLogin")
	public ModelAndView memberLoginModal(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage.memberLogin");
		return mv;
	}
	
	@RequestMapping(value="/mypageMemberManage")
	public ModelAndView memberManage(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage.memberManage");
		return mv;
	}
	
	@RequestMapping(value="/customerWriteNotice")
	public ModelAndView WriteNotice() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("customer.WriteNotice");
		return mv;
	}
}