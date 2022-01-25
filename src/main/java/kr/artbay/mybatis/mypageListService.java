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
public class mypageListService {
	@Autowired 
	ArtBayMapper mapper;
	
	@Autowired
	PlatformTransactionManager manager;	
	TransactionStatus status;
	Page page;
	/*
	public ArtBayVo listView(int lot) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		ArtBayVo vo = null;
		//List<ArtBayAtt> attList = null;
		try {
			vo = mapper.view(lot);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return vo; 
	}*/
	public List<ArtBayVo> mypageBidList(Page p){
		List<ArtBayVo> list = null;
		int totSize = mapper.mypageBidTotSize(p);
		p.setTotSize(totSize);
		this.page = p;
		list = mapper.mypageBidList(p);		
		return list;
	
	}
	
	public ArtBayVo bidListView(int serial, int lot) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		ArtBayVo vo = null;
		List<ArtBayAtt> attList = null;
		try {			
			vo = mapper.bidListView(serial);
			attList = mapper.attList(lot);
			vo.setAttList(attList);
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return vo;
	}
	public List<ArtBayVo> mypageSuccessBidList(Page p){
		List<ArtBayVo> list = null;
		int totSize = mapper.mypageSuccessBidTotSize(p);
		p.setTotSize(totSize);
		this.page = p;
		list = mapper.mypageSuccessBidList(p);		
		return list;
		
	}
	public Page getPage() {return page;}
	public void setPage(Page page) {this.page = page;}
}
