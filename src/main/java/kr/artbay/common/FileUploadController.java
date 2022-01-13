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



@Controller
public class FileUploadController {
	public static String uploadPath = "C:/Users/ej/eclipse-workspace/GitSpring/src/main/webapp/upload/";
	
	//@Autowired BoardService service;
	
	@RequestMapping(value="/fileUp")
	public ModelAndView upload(String job, int grp, int seq,
								@RequestParam("attfile") List<MultipartFile> mul,
								@ModelAttribute ArtBayAtt attVo,
								@ModelAttribute ArtBayVo vo,
								@ModelAttribute Page page) {
		ModelAndView mv = new ModelAndView();
		String msg = "";
		UUID uuid = null;
		vo = new ArtBayVo();
		boolean b = true;
		List<ArtBayAtt> attList = new ArrayList<ArtBayAtt>();
		try {
			for(MultipartFile m : mul) {
				if(m.getOriginalFilename().equals("")) continue;
				
				File targetFile = new File(uploadPath + m.getOriginalFilename());
				m.transferTo(targetFile);
				uuid = UUID.randomUUID();
				String temp = uuid.toString() + "-" + m.getOriginalFilename();
				File reName = new File(uploadPath + temp);
				targetFile.renameTo(reName);
				ArtBayAtt att = new ArtBayAtt();
				att.setLot(grp);
				System.out.println(seq);
				att.setImgFile(temp);
				attList.add(att);
			}
			vo.setAttList(attList);
			//b = service.insertAtt(vo, job); //서비스에서 insertAtt만들어야 해요
			if(b) msg = "저료가 정상적으로 입력 되었습니다.";
			else msg= "자료 입력 중 오류 발생";
			
			mv.addObject("msg", msg);
			mv.addObject("page", page);
			mv.setViewName("board/result");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
}
