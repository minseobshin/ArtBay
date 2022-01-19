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
	public ArtBayVo pwdChkForModi(String mid); //회원정보 수정시 비밀번호 입력 후 내용출력
	
	//List, view 화면
	public Integer totSize(String findStr);
	public List<ArtBayVo> search(Page page);
	public ArtBayVo view(int lot);
	public ArtBayVo viewOthers(int lot);

	public List<ArtBayAtt> attList(int lot);
	 
	//공지사항 저장
	public int saveNotice(ArtBayVo vo);
	//공지사항 조회
	public Integer noticeTotSize(String findStr);
	public List<ArtBayVo> noticeSearch(Page page);
	public void notice_hit_up(String serial);
	public ArtBayVo noticeView(String serial);
	//faq
	public List<ArtBayVo> faqList(String ctgr);
	
	//경매신청
	public ArtBayVo memberview(String mid);  //회원정보
	public int insertArtWork(ArtBayVo vo);			//경매정보 insert
	public int imgInsert(ArtBayAtt att);			//이미지 	 insert
	
	//QNA 
	public Integer qnaTotSize(Page page);		//조회건수
	public List<ArtBayVo> qnaSearch(Page page); //조회
	public Integer qnaInsert(ArtBayVo vo);		//등록
	public Integer getQnaSerial();				//시리얼키 조회

}