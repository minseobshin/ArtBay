package kr.artbay.mybatis;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import kr.artbay.common.ArtBayAtt;
import kr.artbay.common.ArtBayVo;
import kr.artbay.common.FileUploadController;
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
		int ts = mapper.qnaTotSize(page);
		
		//페이지 초기화
		page.setTotSize(ts);
		page.pageCompute();
		this.page = page;
		
		//페이지 객체에서 계산된 startNo부터 listSize 만큼 조회
		List<ArtBayVo> list = mapper.qnaSearch(page);
		return list;
	}

	//qna 상세조회
	public ArtBayVo qnaView(String qnaNum) {
		ArtBayVo vo = mapper.qnaView(qnaNum);
		List<ArtBayAtt> attList = mapper.qnaAttList(qnaNum);
		vo.setAttList(attList);	
		String qna_top_mid = mapper.getQnaTopMid(vo.getGrp());
		vo.setQna_top_mid(qna_top_mid);
		return vo;
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
	
	//첨부파일 정보 저장
	public boolean insertAtt(ArtBayVo vo) {
		boolean result = false;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		int attRows = 0;
		
		for(ArtBayAtt att : vo.getAttList()) {
			attRows += mapper.qnaAttSave(att);			
		}
		
		if(attRows == vo.getAttList().size()) {
			manager.commit(status);
			result = true;
		}
		else {
			manager.rollback(status);
		}
		return result;
	}
	
	//댓글 저장
	public boolean reply(ArtBayVo vo) {
		boolean result = false;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		
		//같은 grp인 글중에 seq가 본문글보다 큰 seq 값 증가
		mapper.qnaSeqUp(vo);
		
		int iRows = mapper.reply(vo);
		
		if(iRows > 0) {
			manager.commit(status);
			serial = mapper.getQnaSerial();
			result = true;
		}
		else {
			manager.rollback(status);
		}
		return result;
	}
	
	//qna 수정
	public boolean update(ArtBayVo vo) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		boolean result = false;
		Object savePoint = status.createSavepoint();
		
		//문의내역 정보 수정
		int rows = mapper.qnaUpdate(vo);
		
		if(rows > 0) {
			//첨부파일 정보 삭제
			if(vo.getDelList().size() > 0) {
				mapper.qnaChkAttDelete(vo.getDelList());
			}
			manager.commit(status);
			result = true;
			
			//첨부파일 삭제
			for(String delFile : vo.getDelList()) {
				File file = new File(FileUploadController.uploadPath + delFile);
				if(file.exists()) {
					file.delete();
				}
			}
		}
		else {
			status.rollbackToSavepoint(savePoint);
		}
		return result;
	}	
	
	//qna 삭제
	//1) 게시글, 첨부파일 정보 삭제
	//2) 실제 첨부파일 삭제
	public boolean delete(ArtBayVo vo) {
		boolean result = false;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();
		
		String qna_pwd = vo.getQna_pwd();
		String qna_num = vo.getQna_num() + "";
		String mid = vo.getMid();
		
		vo = qnaView(qna_num);
		vo.setQna_pwd(qna_pwd);
		vo.setMid(mid);
		
		//1) 게시글, 첨부파일 정보 삭제
		//게시글 정보 삭제
		int dRows = mapper.qnaDelete(vo);
				
		if(dRows > 0) {			
			//첨부파일 정보 삭제
			if(vo.getAttList().size() > 0) {
				mapper.qnaAttDelete(qna_num);
			}
			manager.commit(status);
			result = true;
			
			//2) 실제 첨부파일 삭제
			for(ArtBayAtt att : vo.getAttList()) {
				File delFile = new File(FileUploadController.uploadPath + att.getAttFile());
				if(delFile.exists()) {
					delFile.delete();
				}
			}
		}
		else {
			status.rollbackToSavepoint(savePoint);
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
