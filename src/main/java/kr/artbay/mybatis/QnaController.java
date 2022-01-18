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
			
			//비공개글 일때만 비밀번호 암호화
			if(vo.getQna_status().equals("N")) {
				vo.setQna_pwd( aes.encrypt(vo.getQna_pwd()) );				
			}
			
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
}
