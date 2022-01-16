package kr.artbay.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.artbay.common.ArtBayVo;
import kr.artbay.common.Page;

@RestController
public class QnaController {

	@Autowired
	QnaService service;
	
	//QNA 조회
	@RequestMapping(value = "/qnaList", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView qnaSearch(Page page) {
		ModelAndView mv = new ModelAndView();
		List<ArtBayVo> list = service.search(page);
		page = service.getPage();
		
		mv.addObject("page", page);
		mv.addObject("list", list);
		mv.setViewName("customer.consultationList");
		return mv;
	}
}
