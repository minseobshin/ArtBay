package kr.artbay.mybatis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.DefaultTransactionAttribute;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import kr.artbay.common.AES;
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
	
}
