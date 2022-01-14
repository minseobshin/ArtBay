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
	
	@Autowired
	AES aes;	
	public Page getPage() {return page;}
	public void setPage(Page page) {this.page = page;}
	
	TransactionStatus status;
	Page page;
	
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
	}
	public List<ArtBayVo> mypageSearch(Page p){
		List<ArtBayVo> list = null;
		int totSize = mapper.totSize("");
		p.setTotSize(totSize);
		this.page = p;
		list = mapper.search(p);		
		return list;
	}
	
	
}
