package kr.artbay.mybatis;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.artbay.common.ArtBayVo;


@Repository
@Mapper
public interface ArtBayMapper {
	public Integer totSize(String findStr);
	public int insertMember(ArtBayVo vo);
	
}
