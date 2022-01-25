package kr.artbay.mybatis;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.artbay.common.ArtBayVo;
import kr.artbay.common.Page;

@Controller
@RequestMapping("/")
public class IndexController {

	@Autowired
	TestService service;
	

	
	@RequestMapping(value="/bidResult")
	public ModelAndView bidResult() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("bid.Result");
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
	//test
	@RequestMapping(value="/howtoHowtotest")
	public ModelAndView howTotest() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("howto2.howto2");
		return mv;
	}
	
	@RequestMapping(value="/howtoBidIntrotest")
	public ModelAndView howtoBidIntrotest() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("howto2.bidIntro2");
		return mv;
	}
	
	@RequestMapping(value="/howtoConsignGuidetest")
	public ModelAndView howtoConsignGuidetest() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("howto2.ConsignGuide2");
		return mv;
	}
	
	//test
	
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
	
	@RequestMapping(value = "/location")
	public ModelAndView location() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("customer.location");
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
	
	@RequestMapping(value="/mypageMemberLogin")
	public ModelAndView mypageMemberLogin(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberLogin");
		return mv;
	}
	
	@RequestMapping(value="/mypageMemberResult")
	public ModelAndView mypageMemberResult() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberResult");
		
		return mv;
	}
	@RequestMapping(value="/mypageListView")
	public ModelAndView ListView(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/ListView");
		return mv;
	}
	@RequestMapping(value="/mypageListModify")
	public ModelAndView ListModify(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/ListModify");
		return mv;
	}
	
	
	
}
