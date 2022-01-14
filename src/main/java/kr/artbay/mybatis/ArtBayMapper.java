package kr.artbay.mybatis;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.artbay.common.ArtBayVo;
import kr.artbay.common.Page;


@Repository
@Mapper
public interface ArtBayMapper {
	public int insertMember(ArtBayVo vo);
	
	//List, view 화면
	public Integer totSize(String findStr);
	public List<ArtBayVo> search(Page page);
}
