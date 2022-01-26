package kr.artbay.common;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.artbay.mybatis.NoticeService;

@Controller
public class ntcFileUploadController {
		public static String uploadPath= "C:\\Users\\theil\\git\\ArtBay\\src\\main\\resources\\static\\upload\\";
			
		@Autowired NoticeService service;
		
		@RequestMapping (value="/ntcFileUp") //첨팦 저장 관련 컨트롤러
		public ModelAndView ntcUpload(int grp,
									@RequestParam("attFile") List<MultipartFile> mul,
									@ModelAttribute ArtBayVo vo, @ModelAttribute Page page){//attFile은 jsp의 파일태그 name
			
			ModelAndView mv= new ModelAndView();
			String msg = "";
			UUID uuid = null;
			boolean b = true;
			vo = new ArtBayVo();
			List<ArtBayAtt> attList= new ArrayList<ArtBayAtt>();
			try {
				for(MultipartFile m : mul) {
					if(m.getOriginalFilename().equals("")) continue;
			
					File targetFile = new File(uploadPath + m.getOriginalFilename());
					m.transferTo(targetFile); //업로드한 파일을 해당 targetFile 위치에 보내기
					uuid = UUID.randomUUID();
					String temp = uuid.toString() + "-" + m.getOriginalFilename();
					File reName = new File(uploadPath + temp);
					targetFile.renameTo(reName); //중간에 uuid추가해서 이름 재정의
					ArtBayAtt att = new ArtBayAtt();
					att.setGrp(grp);
					att.setAttFile(temp);
					attList.add(att);
				}
				vo.setAttList(attList);
				b = service.insertNtcAtt(vo);
				if(b) {
					msg = "처리 완료. 문제 없음";
				}else {
					msg = "파일 업로드 중 오류발생";
				}
				mv.addObject("msg", msg);
				mv.addObject("page", page);
				mv.setViewName("customer.noticeList");
				
			}catch(Exception ex) {
				ex.printStackTrace();
			}
			return mv;
			
		}
}
