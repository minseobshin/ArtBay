package kr.artbay.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import kr.artbay.common.ArtBayVo;
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
		

		public List<ArtBayVo> bidResult(Page p) {
			List<ArtBayVo> list = null;
			int totSize = mapper.bidTotSize();	
			p.setTotSize(totSize);
			this.page = p;
			list = mapper.bidResult(p);	
			System.out.println(p.getEndNo());
			return list;
		} 
		
		public List<ArtBayVo> winSearch(Page page, @RequestParam(value="findStr", required=false) String findStr){
			List<ArtBayVo> list = null;
			page.setFindStr(findStr);
			int totSize = mapper.totSize(findStr);
			page.setTotSize(totSize);
			this.page = page;
			list = mapper.search(page);
			return list;
		} 
		public Page getPage() {return page;}
		public void setPage(Page page) {this.page = page;}
	
	
}
