package kr.artbay.mybatis;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import kr.artbay.common.ArtBayAtt;
import kr.artbay.common.ArtBayVo;

@Service
@Transactional
public class ApplicationService {

	@Autowired
	ArtBayMapper mapper;
	
	@Autowired
	PlatformTransactionManager manager;
	
	TransactionStatus status;
	int lot;
	
	public List<ArtBayVo> mainsearch(){
		List<ArtBayVo> list = null;
		list = mapper.mainsearch();
		return list;
	}
	 
	public boolean insertArtwork(ArtBayVo vo) {
		boolean b = false;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = null;
		int c = mapper.insertArtWork(vo);
		try {
			if(c>0) {
				manager.commit(status);
				this.lot = mapper.get_lot();
				System.out.println("lot" + lot);
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
	public boolean insertAtt(ArtBayVo vo, String job) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		boolean b =false;
		int c = 0;
		Object savePoint = null;
		try {
			savePoint = status.createSavepoint();
			for(ArtBayAtt att: vo.getAttList()) {
				if(job.equals("i") ) {
					c += mapper.imgInsert(att);
				}
			}
				if(c == vo.getAttList().size()) {
					manager.commit(status);
					b=true;
				}else {
					status.rollbackToSavepoint(savePoint);
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return b;
	}
	
	
	
	
	
	public int getLot() {return lot;}
	
}
