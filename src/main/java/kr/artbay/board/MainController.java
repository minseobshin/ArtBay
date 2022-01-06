package kr.artbay.board;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class MainController {
	
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping(value="/artbay")
	public ModelAndView artbayMain(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("artbay/list");
		return mv;
	}
	
	@RequestMapping(value="/artbay/view")
	public ModelAndView artbayView(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("artbay/view");
		return mv;
	}
}
