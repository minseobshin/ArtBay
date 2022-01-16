package kr.artbay.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;

import kr.artbay.common.AES;
import kr.artbay.common.ArtBayVo;




@Service
@Transactional
public class FaqService {

	@Autowired 
	ArtBayMapper mapper;
	
	@Autowired
	PlatformTransactionManager manager;	

	@Autowired
	AES aes;
	
	TransactionStatus status;
	
	
	public List<ArtBayVo> faqList(String ctgr) {
		
		List<ArtBayVo> list = null;
		list = mapper.faqList(ctgr);
		return list;
	} 
	
}