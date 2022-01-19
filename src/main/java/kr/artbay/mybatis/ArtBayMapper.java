package kr.artbay.mybatis;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.artbay.common.ArtBayAtt;
import kr.artbay.common.ArtBaySessionVo;
import kr.artbay.common.ArtBayVo;
import kr.artbay.common.Page;


@Repository
@Mapper
public interface ArtBayMapper {
	
	public int insertMember(ArtBayVo vo); //회원가입
	public String checkId(String c); //아이디 중복체크
	public ArtBaySessionVo memberLogin(ArtBaySessionVo sv); //회원 로그인
	
	//List, view 화면
	public Integer totSize(String findStr);
	public List<ArtBayVo> search(Page page);
	public ArtBayVo view(int lot);

	public List<ArtBayAtt> attList(int lot);
	 
	//공지사항 저장
	public int saveNotice(ArtBayVo vo);
	//공지사항 조회
	public Integer noticeTotSize(String findStr);
	public List<ArtBayVo> noticeSearch(Page page);
	public void notice_hit_up(String serial);
	public ArtBayVo noticeView(String serial);
	//공지사항 삭제
	public Integer deleteNotice(List<String> delNoticeList);
	
	public List<ArtBayVo> faqList(String ctgr);
	
	//경매신청
	public int insertArtWork(ArtBayVo vo);
	public int imgInsert(ArtBayAtt att);
	
	//QNA
	public Integer qnaTotSize(String findStr);
	public List<ArtBayVo> qnaSearch(Page page);

}