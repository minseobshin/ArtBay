package kr.artbay.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.artbay.common.AES;
import kr.artbay.common.ArtBayVo;


@Service
@Transactional
public class FaqService {

	@Autowired 
	ArtBayMapper mapper;
	
	@Autowired
	AES aes;
	String ctgr;
	

	public List<ArtBayVo> faqList(String ctgr) {
		
		this.ctgr = ctgr;
		List<ArtBayVo> list = mapper.faqList(ctgr);
		return list;
	} 
	
	public String getCtgr() {return ctgr;}
	public void setCtgr(String ctgr) {this.ctgr = ctgr;}
}