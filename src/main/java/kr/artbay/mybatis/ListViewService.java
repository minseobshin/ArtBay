package kr.artbay.mybatis;

import java.time.LocalDateTime;
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
import kr.artbay.scheduler.GetTime;

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
	
	
	public List<ArtBayVo> search(Page page, String findStr){
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
		mapper.hit_up(lot);
		vo = mapper.view(lot);
		list = mapper.attList(lot);
		vo.setAttList(list);
		return vo;
	}
	
	public ArtBayVo viewOthers(int lot) {
		ArtBayVo vo = new ArtBayVo();
		List<ArtBayAtt> list = new ArrayList<ArtBayAtt>();
		list = mapper.viewOthers(lot);
		vo.setAttList(list);
		for(int i=0; i<list.size(); i++) {
			//System.out.println(list.get(i).getImgFile());
			//System.out.println(vo.getAttList().get(i).getImgFile());
			//System.out.println(vo.getAttList().get(i).getLot());
		}
		return vo;
	}
	
	public int bidApply(ArtBayVo vo) {
		int cnt = 0;
		cnt = mapper.bidApply(vo);
		cnt = mapper.updateCurrentPrice(vo.getLot());
		cnt = mapper.updateBidCnt(vo.getLot());
		return cnt;
	}
	
	public List<ArtBayVo> viewBids(int lot) {
		List<ArtBayVo> list = new ArrayList<ArtBayVo>();
		list = mapper.viewBids(lot);
		for(ArtBayVo vo: list) {
			vo.setBid_cnt(mapper.countBids(lot));
		}
		return list;
	}
	
	//상세 조회 화면에서 전체 응찰 내역 조회 기능
	public List<ArtBayVo> viewBidsAll(){
		List<ArtBayVo> list = new ArrayList<ArtBayVo>();
		list = mapper.viewBidHistoryAll();
		for(ArtBayVo vo : list) {
			vo.setMasked_mid(vo.getMid().replaceAll("(?<=.{2}).", "*"));
		}
		return list;
	}
	
	//목록에서 한 작품 상세 조회 클릭 -> 해당 작품의 낙찰 기한이 도래했을 경우 -> 경매종료 상태 업데이트
	//아래 클래스 추가하며 없어도 되는 기능이 됨.
	public int updateStatus(int lot) {
		int cnt = 0;
		cnt = mapper.updateStatus(lot);
		return cnt;
	}
	
	//모든 작품 조회 -> 경매작품의 낙찰 기한 도래 -> 경매종료 상태 업데이트
	public void updateStatusAll(LocalDateTime date) {
		mapper.updateStatusAll(date);
	}
	
	//즉시 구매 신청 전 해당 작품의 direct_price 가져오기
	public ArtBayVo getDirectInfo(int lot) {
		ArtBayVo vo = new ArtBayVo();
		vo = mapper.getDirectInfo(lot);		
		return vo;
	}
	
	//즉시 구매 신청
	public void directPurchase(ArtBayVo vo) {
		mapper.directPurchase(vo);
		mapper.directPurchaseHistory(vo);
		mapper.directPurchaseInsert(vo);
	}

	
	public Page getPage() {return page;}
	public void setPage(Page page) {this.page = page;}
}
