package kr.artbay.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;

import kr.artbay.common.Page;
@Service
@Transactional
public class bidResultService {

		@Autowired 
		ArtBayMapper mapper;
		
		@Autowired
		PlatformTransactionManager manager;	
		TransactionStatus status;
		Page page;
		

		public List<String> bidResult(Page p) {
			List<String> list = null;
			list = mapper.bidResult(p);	
			int totSize = list.size();
			
			p.setTotSize(totSize);
			this.page = p;
			
			return list;
		} 
		
		public Page getPage() {return page;}
		public void setPage(Page page) {this.page = page;}
	
	
}
