package kr.artbay.mybatis;


import java.time.LocalDateTime;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.artbay.common.ArtBayAtt;
import kr.artbay.common.ArtBaySessionVo;
import kr.artbay.common.ArtBayVo;
import kr.artbay.common.Page;
import kr.artbay.scheduler.GetTime;


@Repository
@Mapper
public interface ArtBayMapper {
	
	public int insertMember(ArtBayVo vo); //회원가입
	public String checkId(String c); //아이디 중복체크
	public ArtBaySessionVo memberLogin(ArtBaySessionVo sv); //회원 로그인
	public ArtBayVo pwdChkForModi(String mid); //회원정보 수정시 비밀번호 입력 후 내용출력
	public int updateMemberInfo(ArtBayVo vo); //회원정보수정 update
	public int memberOut(ArtBaySessionVo sv); //회원탈퇴
	public ArtBayVo findMyId(ArtBayVo vo); //아이디 찾기
	
	//List, view 화면
	public Integer totSize(String findStr);
	public List<ArtBayVo> search(Page page);
	public ArtBayVo view(int lot);
	public List<ArtBayAtt> viewOthers(int lot);
	public List<ArtBayAtt> attList(int lot);
	public int bidApply(ArtBayVo vo);
	public void hit_up(int lot);   //조회수
	public List<ArtBayVo> viewBids(int lot);
	public int countBids(int lot);
	public List<ArtBayVo> viewBidHistoryAll();
	public int updateCurrentPrice(int lot);
	public int updateBidCnt(int lot);
	public List<ArtBayVo> bidOnGoing();
	public int updateStatus(int lot);
	public int directPurchase(ArtBayVo vo);
	public int updateStatusAll(LocalDateTime time);
	public int directPurchaseInsert(ArtBayVo vo);
	public ArtBayVo getDirectInfo(int lot);

	//메인 list
	public List<ArtBayVo> mainsearch();
	//공지사항 저장
	public int insertNtc(ArtBayVo vo);
	public int insertNtcAtt(ArtBayAtt att);
	public Integer get_grp();
	//공지사항 조회
	public List<ArtBayVo> noticeSearch(Page page);//검색
	public Integer noticeTotSize(String findStr);//페이징처리
	public List<ArtBayAtt> ntcAttList(int serial);//첨파 로딩
	public void notice_hit_up(int serial); //조회수
	public ArtBayVo noticeView(int serial);//본문로딩
	//공지사항 삭제
	public Integer deleteNotice(List<String> delNoticeList);
	public List<ArtBayVo> faqList(String ctgr);
	//응찰내역 조회
	public Integer mypageBidTotSize(); 
	public List<ArtBayVo> mypageBidList(Page page);
	public ArtBayVo bidListView(int serial);
	//낙찰내역 조회
	public Integer mypageSuccessBidTotSize(); 
	public List<ArtBayVo> mypageSuccessBidList(Page page);
	
	//경매결과 조회
	public List<ArtBayVo> bidResult(Page page);
	public Integer bidTotSize();
	//경매종료 update
	public int artwork_status(ArtBayVo vo);
	
	//경매신청
	public ArtBayVo memberview(String mid);  //회원정보
	public int insertArtWork(ArtBayVo vo);			//경매정보 insert
	public int imgInsert(ArtBayAtt att);			//이미지 	 insert
	public Integer get_lot();
	
	//QNA 
	public Integer qnaTotSize(Page page);		//조회건수
	public List<ArtBayVo> qnaSearch(Page page); //조회
	public Integer qnaInsert(ArtBayVo vo);		//등록
	public Integer getQnaSerial();				//시리얼키 조회
	public ArtBayVo qnaView(String qnaNum);		//상세조회
	public int qnaAttSave(ArtBayAtt att);		//첨부파일 정보 저장
	public List<ArtBayAtt> qnaAttList(String qnaNum); //첨부파일 정보 조회
	public int qnaDelete(ArtBayVo vo);			//삭제
	public void qnaAttDelete(String qna_num);	//첨부파일 정보 삭제
	public void qnaSeqUp(ArtBayVo vo);			//seq 증가
	public int reply(ArtBayVo vo);				//댓글 저장
	public int qnaUpdate(ArtBayVo vo);			//수정
	public void qnaChkAttDelete(List<String> delList); //선택한 첨부파일 정보 삭제
	public String getQnaTopMid(Integer grp);	//글의 문의자 mid 조회
	
}