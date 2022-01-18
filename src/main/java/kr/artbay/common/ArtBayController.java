package kr.artbay.common;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.artbay.mybatis.FaqService;
import kr.artbay.mybatis.MemberService;
import kr.artbay.mybatis.NoticeService;


@RestController
public class ArtBayController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	NoticeService noticeService;
	
	AES aes = new AES();
	Page page = new Page();
	ArtBayVo vo = null;
	ArtBaySessionVo sv = null;
	boolean b = false;
	String c = "";
	
	/*gitSpring 컨트롤러 내용
	String msg="";
	int serial;
	int grp = 0;
	String pwd = "";
	PrintWriter out;
	*/
	
	//회원가입
	@RequestMapping(value="/insertMemberSave", method= {RequestMethod.POST})
	public void insertMemberSave(ArtBayVo vo) {
		//System.out.println("ArtBayController : " + vo.getMemberJoinEmail());
		this.b = memberService.insertMember(vo);
	}
	
	//아이디중복체크
	@RequestMapping(value="/checkId", method= {RequestMethod.POST})
	public boolean checkId(ArtBayVo vo) {
		this.c = vo.getMid();
		this.b = memberService.checkId(c);
		return b;
	}
	
	//이메일인증
	@RequestMapping(value="/emailCertification", method= {RequestMethod.POST})
	public void emailCertification(ArtBayVo vo) {
        //this.b = memberService.insertMember(vo);
	}
	
	//회원 로그인
	@RequestMapping(value="/memberLogin", method= {RequestMethod.POST})
	public String memberLogin(ArtBaySessionVo sv, HttpServletRequest req) {
		HttpSession session = req.getSession();
		this.c = memberService.memberLogin(sv);
		if(c == "failMid" || c == "failPwd") {
			session.invalidate();
		}else {
			session.setAttribute("sv", sv);
		}
		return c;
	}
	
	//회원 로그아웃
	@RequestMapping(value="/memberLogout")
	public void memberLogout(HttpServletRequest req) { 
		HttpSession session = req.getSession();
		session.invalidate();		
	}
	
	//회원정보수정화면 비밀번호체크 후 정보조회 출력
	@RequestMapping(value="/pwdChkForModi")
	public void pwdChkForModi(ArtBayVo vo, HttpServletRequest req) { 
		HttpSession session = req.getSession();
		vo = (ArtBayVo)session.getAttribute("vo");
		String mid = vo.getMid();
		String pwd = vo.getPwd();
		System.out.println(mid);
		System.out.println(pwd);
	}
	

	 

	/*
	@RequestMapping(value="/")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping(value="/list", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView search(Page page) {
		ModelAndView mv = new ModelAndView();
		List<BoardVO> list = service.search(page);
		page = service.getPage();
		
		mv.addObject("page", page);
		mv.addObject("list", list);
		mv.setViewName("board/list");
		
		return mv;
	}
	
	@RequestMapping(value="/view", method= {RequestMethod.POST})
	public ModelAndView view(int serial, Page page) {
		ModelAndView mv = new ModelAndView();
		vo = service.view(serial, 'v');
		mv.addObject("vo", vo);
		mv.addObject("page", page);
		mv.setViewName("board/view");
		return mv;
	}
	
	@RequestMapping(value="/insert", method= {RequestMethod.POST}) //서블렛의 case : insert일 때
	public ModelAndView insert(Page page) {
		ModelAndView mv = new ModelAndView();
		//b = service.insert(vo);
		//mv.addObject("vo", vo);
		mv.addObject("page", page);
		mv.setViewName("board/insert");
		return mv;
	}
	
	//아래에서 resp가 필요한 이유 : js에서 처리 결과를 data가 받음. 이건 json 타입으로 처리하였으므로 모두 문자열 타입.
	//자바에서는 js에게 object가 아닌 String으로 넘길 수 있도록 response를 사용.
	//resp를 사용하여 out = resp.getWriter()를 사용 가능.
	@RequestMapping(value="/insertSave", method= {RequestMethod.POST})
	public void insertSave(BoardVO vo, HttpServletResponse resp) {
		try {
			out = resp.getWriter();
			this.b = service.insert(vo);
			this.grp = service.getGrp();
			String temp = "{'flag':'%s', 'grp':'%s'}";
			String flag = "";
			if(b) {
				flag = "OK";
			}else {
				flag = "fail";
			}
			String json = String.format(temp, flag, grp);
			json = json.replaceAll("'", "\""); //작은 따옴표를 큰 따옴표로 바꿔야 json 사용 가능. 예) {"flag" : "OK", "grp":"100"}으로 출력 됨.
			out.print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/modify", method= {RequestMethod.POST})
	public ModelAndView modify(int serial, Page page) {
		ModelAndView mv = new ModelAndView();
		vo = service.view(serial, 'm');
		mv.addObject("vo", vo);
		mv.addObject("page", page);
		mv.setViewName("board/modify");
		
		return mv;
	}
	
	@RequestMapping(value="/modifySave", method= {RequestMethod.POST})
	public void modifySave(BoardVO vo, Page page, HttpServletResponse resp) {
		try {
			out = resp.getWriter();
			vo.setPwd(aes.encrypt(vo.getPwd()));
			if(vo.getDelFile()!=null) vo.setDelList(Arrays.asList(vo.getDelFile()));
			b = service.modifySave(vo, vo.getPwd());
			String temp="{'flag':'%s', 'grp':'%s'}";
			String flag = "";
			if(b) {
				flag = "OK";
			}else {
				flag = "fail";
			}
			String json = String.format(temp, flag, grp);
			json = json.replaceAll("'", "\"");
			out.print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/delete", method= {RequestMethod.POST})
	public ModelAndView delete(HttpServletRequest req, Page page) {
		ModelAndView mv = new ModelAndView();
		serial = Integer.parseInt(req.getParameter("serial"));
		pwd = req.getParameter("pwd");
		b = service.delete(serial, pwd);
		if(b) msg = "자료가 삭제 되었습니다.";
		else msg = "자료 삭제 중 오류 발생";
		
		mv.addObject("msg", msg);
		mv.addObject("page", page);
		mv.setViewName("board/result");
		return mv;
	}
	
	@RequestMapping(value="/repl", method= {RequestMethod.POST})
	public ModelAndView repl(BoardVO vo, Page page) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.addObject("page", page);
		mv.setViewName("board/repl");
		return mv;
	}
	
	@RequestMapping(value="/replSave", method= {RequestMethod.POST})
	public void replSave(BoardVO vo, Page page, HttpServletResponse resp) {
		try {
			out = resp.getWriter();
			vo.setPwd(aes.encrypt(vo.getPwd()));
			if(vo.getDelFile()!=null) vo.setDelList(Arrays.asList(vo.getDelFile()));
			b = service.repl(vo);
			grp = service.getGrp();
			String temp="{'flag':'%s', 'grp':'%s'}";
			String flag = "";
			if(b) {
				flag = "OK";
			}else {
				flag = "fail";
			}
			String json = String.format(temp, flag, grp);
			json = json.replaceAll("'", "\"");
			out.print(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	*/

}
