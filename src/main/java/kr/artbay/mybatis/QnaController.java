package kr.artbay.mybatis;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
	public ModelAndView qnaSearch(Page page, HttpServletRequest req) {		
		ModelAndView mv = new ModelAndView();
		//로그인한 아이디
		String mid = (String) req.getSession().getAttribute("mid");
		page.setMid(mid);
		
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
	
	//QNA 문의 댓글폼 이동
	@RequestMapping(value = "/qnaReplyForm", method = RequestMethod.POST)
	public ModelAndView qnaReplyForm(String qna_num, Page page) {
		ModelAndView mv = new ModelAndView();
		ArtBayVo vo = service.qnaView(qna_num);
		mv.addObject("vo", vo);
		mv.addObject("page", page);
		mv.setViewName("customer.consultationReply");
		return mv;
	}
	
	//QNA 문의 댓글작성
	@RequestMapping(value = "/qnaReply", method = RequestMethod.POST)
	public void qnaReply(ArtBayVo vo, HttpServletResponse resp) {
		try {
			out = resp.getWriter();
			
			//비밀번호 암호화
			if(vo.getQna_pwd() != null) {
				vo.setQna_pwd( aes.encrypt(vo.getQna_pwd()) );				
			}
			
			//댓글 저장
			result = service.reply(vo);
			
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
	
	//QNA 문의 수정폼 이동
	@RequestMapping(value = "/qnaUpdateForm", method = RequestMethod.POST)
	public ModelAndView qnaUpdateForm(String qna_num, Page page) {
		ModelAndView mv = new ModelAndView();
		ArtBayVo vo = service.qnaView(qna_num);
		mv.addObject("vo", vo);
		mv.addObject("page", page);
		mv.setViewName("customer.consultationUpdate");
		return mv;
	}
	
	//QNA 문의 수정
	@RequestMapping(value = "/qnaUpdate", method = RequestMethod.POST)
	public void qnaUpdate(ArtBayVo vo, HttpServletResponse resp) {
		try {
			out = resp.getWriter();
			
			//비밀번호 암호화
			if(!vo.getMid().equals("admin")) {
				vo.setQna_pwd( aes.encrypt(vo.getQna_pwd()) );				
			}
			
			//선택한 삭제할 파일들
			String[] delFile = vo.getDelFile();
			if(delFile != null) {
				vo.setDelList(Arrays.asList(delFile));				
			}
			
			//수정
			result = service.update(vo);
			
			String format = "{'flag':'%s'}";
			String flag = "";
			
			if(result) {
				flag = "OK";
			}
			else {
				flag = "FAIL";
			}
			
			String json = String.format(format, flag);
			json = json.replaceAll("'", "\"");
			out.print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//QNA 문의 삭제
	@RequestMapping(value = "qnaDelete", method = RequestMethod.POST)
	public ModelAndView qnaDelete(ArtBayVo vo, Page page) {
		ModelAndView mv = new ModelAndView();
		
		//입력한 비밀번호 암호화
		if(!vo.getMid().equals("admin")) {
			vo.setQna_pwd( aes.encrypt(vo.getQna_pwd()) );			
		}
		
		result =  service.delete(vo);
		
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
