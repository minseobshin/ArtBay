package kr.artbay.mybatis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.DefaultTransactionAttribute;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import kr.artbay.common.AES;
import kr.artbay.common.ArtBaySessionVo;
import kr.artbay.common.ArtBayVo;

@Service
@Transactional
public class MemberService {
	
	@Autowired
	ArtBayMapper mapper;
	
	@Autowired
	PlatformTransactionManager manager;
	
	@Autowired
	AES aes;
	
	TransactionStatus status;
	
	//회원가입 정보 저장
	public boolean insertMember(ArtBayVo vo) {
		boolean b = false;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		//vo.setPwd(aes.encrypt(vo.getPwd())); //암호화는 나중에..
		
		//System.out.println("MemberService : " + vo.getMid());
		
		int c = mapper.insertMember(vo);
		if(c>0) {
			manager.commit(status);
			b = true;
		}else {
			manager.rollback(status);
		}
		
		return b;
	}
	
	//아이디 중복체크
	public boolean checkId(String c) {
		boolean b = true;
		
		try {
			String d = mapper.checkId(c);
			if(d.equals(c)) b = false;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return b;
	}
	
	//로그인
	public String memberLogin(ArtBaySessionVo sv) {
		String c = "";
		
		try {
			ArtBaySessionVo svv = mapper.memberLogin(sv);
			if(sv.getMid().equals("admin") && sv.getPwd().equals("admin")) {
				c = "login";
			}else if(svv.getMid().equals(sv.getMid())) {
				if(svv.getPwd().equals(sv.getPwd())) {
					c = "login";
				}else {
					c = "failPwd";
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
			c = "failMid";
		}
		
		return c;
	}
	
	//회원정보수정화면 비밀번호체크 후 정보조회 출력
	public ArtBayVo pwdChkForModi(String mid, String pwd, String npwd) {
		ArtBayVo vo = null;
		
		try {
			vo = mapper.pwdChkForModi(mid);
			if(vo.getPwd().equals(npwd)) {
				vo.setOldPwd("passPwd");
			}else {
				vo.setOldPwd("failPwd");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			vo.setOldPwd("err");
		}
		return vo;
	}
	
	//회원정보수정 update
	public boolean updateMemberInfo(ArtBayVo vo) {
		boolean b = false;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		
		try {
			System.out.println("서비스단 : " + vo.getMid());
			int c = mapper.updateMemberInfo(vo);
			if(c>0) {
				manager.commit(status);
				b = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
			manager.rollback(status);
		}
		
		return b;
	}
	
	//회원 탈퇴
	public boolean memberOut(ArtBaySessionVo sv) {
		boolean b = false;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		
		try {
			int c = mapper.memberOut(sv);
			if(c>0) {
				manager.commit(status);
				b = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			manager.rollback(status);
		}
		
		return b;
	}
	
}








