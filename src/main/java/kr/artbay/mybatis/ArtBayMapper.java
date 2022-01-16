package kr.artbay.mybatis;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.artbay.common.ArtBayAtt;
import kr.artbay.common.ArtBayVo;
import kr.artbay.common.Page;


@Repository
@Mapper
public interface ArtBayMapper {
	
	//회원가입
	public int insertMember(ArtBayVo vo);
	
	//List, view 화면
	public Integer totSize(String findStr);
	public List<ArtBayVo> search(Page page);
	public ArtBayVo view(int lot);

	public List<ArtBayAtt> attList(int lot);
	 
	//공지사항
	public int saveNotice(ArtBayVo vo);
	public List<ArtBayVo> faqList(String ctgr);
	
	//경매신청
	public int insertArtWork(ArtBayVo vo);

	public int imgInsert(ArtBayAtt att);

}