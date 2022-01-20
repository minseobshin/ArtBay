package kr.artbay.mybatis;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.artbay.common.AES;
import kr.artbay.common.ArtBayVo;
import kr.artbay.common.Page;


@RestController
public class QnaController {

	@Autowired
	QnaService service;
	
	PrintWriter out;
	AES aes = new AES();
	boolean result = false;
	String msg = "";
	
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
	
	//QNA 문의 상세내역 조회
	@RequestMapping(value = "/qnaView", method = RequestMethod.POST)
	public ModelAndView qnaView(String qnaNum, Page page) {
		ModelAndView mv = new ModelAndView();
		ArtBayVo vo = service.qnaView(qnaNum);
		mv.addObject("vo", vo);
		mv.addObject("page", page);
		mv.setViewName("customer.consultationView");
		return mv;
	}
	
	//QNA 문의 작성폼 이동
	@RequestMapping(value = "/qnaInsertForm", method = RequestMethod.POST)
	public ModelAndView qnaInsertForm(Page page) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("page", page);
		mv.setViewName("customer.consultationInsert");
		return mv;
	}
	
	//QNA 문의 작성(저장)
	@RequestMapping(value = "/qnaInsert", method = RequestMethod.POST)
	public void qnaInsert(ArtBayVo vo, HttpServletResponse resp) {
		try {
			out = resp.getWriter();
			
			//비밀번호 암호화
			vo.setQna_pwd( aes.encrypt(vo.getQna_pwd()) );				
			
			//저장
			result = service.insert(vo);
			
			String format = "{'flag':'%s', 'serial':'%s'}";
			String flag = "";
			
			if(result) {
				flag = "OK";
			} else {
				flag = "FAIL";
			} 
			
			String json = String.format(format, flag, service.getSerial());
			json = json.replaceAll("'", "\"");			
			out.print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "qnaDelete", method = RequestMethod.POST)
	public ModelAndView qnaDelete(ArtBayVo vo, Page page) {
		ModelAndView mv = new ModelAndView();
		
		//입력한 비밀번호 암호화
		vo.setQna_pwd( aes.encrypt(vo.getQna_pwd()) );
		
		result =  service.delete(vo.getQna_num()+"", vo.getQna_pwd());
		
		if(result) {
			msg = "자료가 삭제되었습니다.";
		} 
		else {
			msg = "자료 삭제중 오류가 발생되었습니다.";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("page", page);
		mv.setViewName("customer.consultationResult");
		return mv;
	}
	
}
