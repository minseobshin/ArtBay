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
		Page page = new Page();
		
		//월별 낙찰조회
		public List<ArtBayVo> bidResult(Page page) {
			List<ArtBayVo> list = null;
			int totSize = mapper.bidTotSize(page.getFindStr());	
			page.setTotSize(totSize);
		
			this.page = page;
			list = mapper.bidResult(page);	
			return list;
		} 
		//상세조회
		public List<ArtBayVo> bidResultsearch(Page page){
			List<ArtBayVo> list = null;
			int totSize = mapper.resultTotSize(page);
			page.setTotSize(totSize);
			this.page = page;
			list = mapper.bidResultsearch(page);
			return list;
		} 
		public Page getPage() {return page;}
		public void setPage(Page page) {this.page = page;}
	
	
}
