package kr.artbay.mybatis;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import kr.artbay.common.AES;
import kr.artbay.common.ArtBayAtt;
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
	
	
	
	public List<ArtBayVo> search(Page page, @RequestParam(value="findStr", required=false) String findStr){
		List<ArtBayVo> list = null;
		page.setFindStr(findStr);
		int totSize = mapper.totSize(findStr);
		page.setTotSize(totSize);
		this.page = page;
		
		list = mapper.search(page);
		return list;
	}
	
	public ArtBayVo view(int lot) {
		ArtBayVo vo = new ArtBayVo();
		vo.setLot(lot);
		List<ArtBayAtt> list = new ArrayList<ArtBayAtt>();
		vo = mapper.view(lot);
		list = mapper.attList(lot);
		vo.setAttList(list);
		return vo;
	}
	
	public Page getPage() {return page;}
	public void setPage(Page page) {this.page = page;}
}
