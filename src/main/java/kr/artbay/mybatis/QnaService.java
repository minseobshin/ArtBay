package kr.artbay.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import kr.artbay.common.ArtBayVo;
import kr.artbay.common.Page;

@Service
@Transactional
public class QnaService {

	@Autowired
	ArtBayMapper mapper;
	
	@Autowired
	PlatformTransactionManager manager;
	
	TransactionStatus status;
	Page page;
	int serial;
	
	//qna 조회
	public List<ArtBayVo> search(Page page) {
		//조건에 맞는 데이터 건수
		int ts = mapper.qnaTotSize(page.getFindStr());
		
		//페이지 초기화
		page.setTotSize(ts);
		page.pageCompute();
		this.page = page;
		
		//페이지 객체에서 계산된 startNo부터 listSize 만큼 조회
		List<ArtBayVo> list = mapper.qnaSearch(page);
		return list;
	}

	
	//qna 작성
	public boolean insert(ArtBayVo vo) {
		boolean result = false;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		int rows = mapper.qnaInsert(vo);
		
		if(rows > 0) {
			manager.commit(status);
			serial = mapper.getQnaSerial();
			result = true;
		}
		else {
			manager.rollback(status);
		}
		return result;
	}
	
	//페이지 반환
	public Page getPage() {
		return page;
	}

	//시리얼키 반환
	public int getSerial() {
		return serial;
	}
}
