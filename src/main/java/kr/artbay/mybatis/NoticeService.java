package kr.artbay.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import kr.artbay.common.AES;
import kr.artbay.common.ArtBayAtt;
import kr.artbay.common.ArtBayVo;
import kr.artbay.common.Page;



@Service
@Transactional
public class NoticeService {
	
	@Autowired
	ArtBayMapper mapper;


	@Autowired
	PlatformTransactionManager manager;
	
	@Autowired
	AES aes;
	
	TransactionStatus status;
	Page page;
	int grp;
	
	//검색어 입력 시 
	public List<ArtBayVo> noticeSearch(Page p) {
		List<ArtBayVo> list = null;
		int totSize = mapper.noticeTotSize(p.getFindStr());
		p.setTotSize(totSize);
		this.page = p;
		list = mapper.noticeSearch(p);
		return list;
	}
	//공지 저장
	public boolean insertNtc(ArtBayVo vo) {
		boolean b = false;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		int c = mapper.insertNtc(vo);
		
		if(c>0) {
			manager.commit(status);
			this.grp = mapper.get_grp();
			b=true;
		}else {
			manager.rollback(status);
		}
		return b;
	} 

	public boolean insertNtcAtt(ArtBayVo vo) {
		boolean b=false;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		int c = 0;
	 	try {
			//첨부 파일 정보 저장
			for(ArtBayAtt att : vo.getAttList()) {
				c += mapper.insertNtcAtt(att);
			}
			if(c == vo.getAttList().size()) {
				manager.commit(status);
				b=true;
			}else {
				manager.rollback(status);
			}		
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return b;
		
	}
	public ArtBayVo noticeView(int serial) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		ArtBayVo vo = null;
		List<ArtBayAtt> ntcAttList = null;
		try {

			mapper.notice_hit_up(serial);
			manager.commit(status);
		
			vo = mapper.noticeView(serial);	
			ntcAttList = mapper.ntcAttList(serial);			
			vo.setAttList(ntcAttList);
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return vo;
	}
	
	public boolean deleteNotice(List<String> delNoticeList) {
		
		boolean b=false;
		int c=0;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		try {
				c = mapper.deleteNotice(delNoticeList);	
			
			if(c>0) {
				manager.commit(status);
				b = true;
			}else {
				manager.rollback(status);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
			return b;
			
	}
	public int getGrp() {return grp;}
	public void setGrp(int grp) {this.grp = grp;}
	public Page getPage() {return page;}
	public void setPage(Page page) {this.page = page;}
}