package kr.artbay.mybatis;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.artbay.common.ArtBayVo;
import kr.artbay.common.Page;


@Repository
@Mapper
public interface ArtBayMapper {
	
	//회원가입
	public int insertMember(ArtBayVo vo);
	public int insertArtWork(ArtBayVo vo);
	//List, view 화면
	public Integer totSize(String findStr);
	public List<ArtBayVo> search(Page page);
	
	
	//공지사항
	public int saveNotice(ArtBayVo vo);  
}
