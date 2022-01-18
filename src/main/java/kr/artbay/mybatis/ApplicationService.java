package kr.artbay.mybatis;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import kr.artbay.common.ArtBayVo;

@Service
@Transactional
public class ApplicationService {

	@Autowired
	ArtBayMapper mapper;
	
	@Autowired
	PlatformTransactionManager manager;
	
	TransactionStatus status;
	
	public boolean insertArtwork(ArtBayVo vo) {
		boolean b = false;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = null;
		int c = mapper.insertArtWork(vo);
		try {
			if(c>0) {
				manager.commit(status);
				b = true;
			}else {
				status.rollbackToSavepoint(savePoint);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}  
	public ArtBayVo  memberview(String mid) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		ArtBayVo vo = null;
		try {
			vo = mapper.memberview(mid);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	
	
}
