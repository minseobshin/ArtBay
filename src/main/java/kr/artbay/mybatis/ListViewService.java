package kr.artbay.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;

import kr.artbay.common.AES;
import kr.artbay.common.ArtBayVo;
import kr.artbay.common.Page;

@Service
@Transactional
public class ListViewService {
	@Autowired
	ArtBayMapper mapper;
	
	@Autowired
	PlatformTransactionManager manager;
	
	@Autowired AES aes;
	
	TransactionStatus status;
	Page page;
	
	public List<ArtBayVo> search(Page page){
		List<ArtBayVo> list = null;
		int totSize = mapper.totSize(page.getFindStr());
		page.setTotSize(totSize);
		this.page = page;
		
		list = mapper.search(page);
		System.out.println(list.size());
		return list;
	}
	
	public Page getPage() {return page;}
	public void setPage(Page page) {this.page = page;}
}
