package kr.artbay.common;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.artbay.mybatis.ApplicationService;
import kr.artbay.mybatis.FaqService;
import kr.artbay.mybatis.MemberService;
import kr.artbay.mybatis.NoticeService;

@RestController
public class ArtBayController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	NoticeService noticeService;
	@Autowired
	ApplicationService applicationService;
	
	AES aes = new AES();
	Page page = new Page();
	ArtBayVo vo = null;
	ArtBayVo voMid = null;
	ArtBaySessionVo sv = null;
	ArtBaySessionVo svMid = null;
	boolean b = false;
	String c = "";
	String d = "";
	String msg = "";
	String midResult = "";
	PrintWriter out;
	int lot = 0;
	
	@RequestMapping(value="/main", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView main() {
		ModelAndView mv = new ModelAndView();
		List<ArtBayVo> list = applicationService.mainsearch();
		mv.addObject("list", list);
		mv.setViewName("main.main");
		return mv;
	}
	
	
	//회원가입
	@RequestMapping(value="/insertMemberSave", method= {RequestMethod.POST})
	public void insertMemberSave(ArtBayVo vo) {
		this.b = memberService.insertMember(vo);
		this.d = "join";
		this.voMid = vo;
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
		session.setMaxInactiveInterval(10*360);
		String injung = "";
		this.d = sv.getMid();
		try {
			this.b = memberService.checkId(this.d);
		}catch(NullPointerException e) {
			this.b = true;
		}
		if(this.b == false) { //id 중복체크를 먼저 돌려서 DB에 존재하는 ID인지 체크한 뒤 중복이면(DB에 있으면) 진행
			this.sv = memberService.memberLogin(sv);
			this.c = this.sv.getOutEu7();
		}else {
			this.c = "failMid";
		}
		
		if(this.c == "failMid" || this.c == "failPwd" || 
			this.c == "stopMember" || this.c == "lostPwdMember" ||
			this.c == "outMember") {
			session.invalidate();
		}else {
			injung = this.sv.getInjung();
			session.setAttribute("sv", this.sv);
			session.setAttribute("mid", d);
			session.setAttribute("injung", injung);
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
	@ResponseBody
	@RequestMapping(value="/pwdChkForModi")
	public ArtBayVo pwdChkForModi(ArtBaySessionVo sv, HttpServletRequest req) { 
		HttpSession session = req.getSession();
		String npwd = sv.getOldPwd(); //사용자가 방금 입력한 pwd
		sv = (ArtBaySessionVo)session.getAttribute("sv"); //세션에 있던 로그인 정보
		String mid = sv.getMid();
		String pwd = sv.getPwd();
		if(mid==null || pwd==null || npwd==null) {
		}else {
		this.vo = memberService.pwdChkForModi(mid, pwd, npwd);		
		}
		if(vo.getOldPwd().equals("passPwd")) {
			c = "passPwd";
		}else {
			c = "failPwd";
		}
		
		return vo;
	}
	
	//회원정보수정 update
	@RequestMapping(value="/updateMemberInfo", method= {RequestMethod.POST})
	public String updateMemberInfo(ArtBayVo vo) {
		boolean b = memberService.updateMemberInfo(vo);
		this.d = "update";
		
		if(b == true) {
			c = "passUpdate";
			this.voMid = vo;
		}else {
			c = "failUpdate";
		}
		System.out.println(vo.getOldPwd());
		
		return c;
	}
	
	//회원 탈퇴
	@RequestMapping(value="/memberOut", method= {RequestMethod.POST})
	public String memberOut(ArtBaySessionVo sv, HttpServletRequest req) {
		HttpSession session = req.getSession();
		this.sv = (ArtBaySessionVo)session.getAttribute("sv"); //세션에 있던 로그인 정보
		String mid = this.sv.getMid();
		String pwd = this.sv.getPwd();
		this.d = "memberOut";
		
		if(sv.getMidOut().equals(mid)) {
			if(sv.getPwdOut().equals(pwd)) {
				this.b = memberService.memberOut(sv);
				if(b == true) {
					this.svMid = sv;
					c = "passOut";
				}else {
					c = "failOut";
				}
			}else {
				c = "failPwd";
			}
		}else {
			c = "failMid";
		}
		
		return c;
	}
	
	//회원가입, 정보수정, 탈퇴 결과 페이지
	@RequestMapping(value="/updateMemberInfoResult")
	public ModelAndView updateMemberInfoResult() {
		ModelAndView mv = new ModelAndView();
		
		//회원가입 결과페이지 출력
		if(this.d == "join") {
			this.midResult = voMid.getMid();
			this.c = "님의 회원가입이 완료되었습니다.";
			this.msg = "ArtBay 가입을 축하합니다! 계속하시려면 확인 버튼을 클릭해주세요.";
		}
		
		//회원정보수정 결과페이지 출력
		if(this.d == "update") {
			this.midResult = voMid.getMid();
			if(this.c == "passUpdate") {
				this.c = "님의 회원정보가 수정되었습니다.";
				this.msg = "계속하시려면 확인 버튼을 클릭해주세요.";
			}else if(this.c == "failUpdate"){
				this.c = "님의 회원정보 수정 중 오류가 발생했습니다.";
				this.msg = "관리자에게 문의해주세요.";
			}
		}
		
		//회원탈퇴 결과페이지 출력
		if(this.d == "memberOut") {
			this.midResult = svMid.getMidOut();
			if(this.c == "passOut") {
				this.c = "님의 회원탈퇴가 정상 처리되었습니다.";
				this.msg = "지금까지 ArtBay를 이용해 주셔서 감사합니다. 더 발전하는 ArtBay가 되겠습니다.";
			}else if(this.c == "failOut") {
				this.c = "님의 탈퇴 처리 중 오류가 발생했습니다.";
				this.msg = "관리자에게 문의해주세요.";
			}
		}
		
		mv.addObject("midResult", midResult);
		mv.addObject("msg", msg);
		mv.addObject("c", c);
		mv.setViewName("mypage.memberResult");
		
		return mv;
	}
	
	//관리자 페이지 이동
	@RequestMapping(value="/memberManage")
	public ModelAndView memberManage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage.memberManage");
		return mv;
	}
	
	//아이디 찾기
	@RequestMapping(value="/findMyId", method= {RequestMethod.POST})
	public ArtBayVo findMyId(ArtBayVo vo) {
		vo = memberService.findMyId(vo);
		return vo;
	}
	
	//비밀번호 찾기
	@RequestMapping(value="/findMyPwd", method= {RequestMethod.POST})
	public ArtBayVo findMyPwd(ArtBayVo vo) {
		vo = memberService.findMyPwd(vo);
		return vo;
	}
	
	//비밀번호 수정
	@RequestMapping(value="/changePassword", method= {RequestMethod.POST})
	public boolean changePassword(ArtBaySessionVo sv) {
		this.b = memberService.changePassword(sv);
		return b;
	}
	
	//경매신청 페이지
	@RequestMapping(value="/bidApplication" , method = {RequestMethod.POST,  RequestMethod.GET})
	public ModelAndView bidApplication( HttpServletRequest req, Page page) {
		HttpSession session = req.getSession();
		sv = (ArtBaySessionVo)session.getAttribute("sv");
		String mid = sv.getMid();
		ModelAndView mv = new ModelAndView();
		vo = applicationService.memberview(mid);
		mv.addObject("vo", vo);
		mv.addObject("page", page);
		mv.setViewName("bid.application");
		return mv;
	}
	
	//경매신청 insert
	@RequestMapping(value="/insertArtWorSave", method= {RequestMethod.POST})
	public void insertArtWorSave(ArtBayVo vo, HttpServletResponse resq,  HttpServletRequest req) {
		try {
			HttpSession session = req.getSession();
			sv = (ArtBaySessionVo)session.getAttribute("sv");
			String mid = sv.getMid();
			out = resq.getWriter();
			vo.setMid(mid);
			vo.setCrnt_status("경매중");
			vo.setArtwork_size(vo.getS_size01()+"x"+ vo.getS_size02() +"x"+ vo.getS_size03() +"/"+ vo.getHo() + "호");
			this.b = applicationService.insertArtwork(vo);
			this.lot = applicationService.getLot();
			System.out.println("lot " + this.lot);
			String temp = "{'flag':'%s', 'lot' : '%s'}";
			String flag ="";
			if(b) {
				flag = "OK";
			}else {
				flag = "Fail";
			}
			String json = String.format(temp, flag, lot);
			json = json.replaceAll("'", "\"");
			out.print(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
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
