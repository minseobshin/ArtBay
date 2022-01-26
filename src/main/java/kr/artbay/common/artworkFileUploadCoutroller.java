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

import kr.artbay.mybatis.ApplicationService;

@Controller
public class artworkFileUploadCoutroller {
	public static String uploadPath = "C:\\Artbay\\ArtBay\\src\\main\\resources\\static\\upload\\";
	
	@Autowired 
	ApplicationService applicationService;
	
	@RequestMapping(value="/artworkfileUp") 
	public ModelAndView upload(String job, int lot, 
								@RequestParam("addFile") List<MultipartFile> mul,
								@RequestParam("thumbnailFile") List<MultipartFile> mainimg,
								@ModelAttribute ArtBayAtt attVo,
								@ModelAttribute ArtBayVo vo) { 
		
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
				m.transferTo(targetFile); uuid = UUID.randomUUID(); 
				String temp = "../upload/" + uuid.toString() + "-" + m.getOriginalFilename(); 
				File reName = new File(uploadPath + temp); 
				targetFile.renameTo(reName); 
				ArtBayAtt att = new	ArtBayAtt(); 
				att.setLot(lot); 
				att.setImgFile(temp); 
				att.setThumbnail("N"); 
				attList.add(att); 
				}
			for(MultipartFile m : mainimg) {
				if(m.getOriginalFilename().equals("")) continue;
				File targetFile = new File(uploadPath + m.getOriginalFilename());
				m.transferTo(targetFile); uuid = UUID.randomUUID(); 
				String temp = "../upload/" + uuid.toString() + "-" + m.getOriginalFilename(); 
				File reName = new File(uploadPath + temp); 
				targetFile.renameTo(reName); 
				ArtBayAtt att = new	ArtBayAtt(); 
				att.setLot(lot); 
				att.setImgFile(temp); 
				att.setThumbnail("Y"); 
				attList.add(att);
				}
			
			vo.setAttList(attList);
			b = applicationService.insertAtt(vo, job);  
			if(b) msg = "저료가 정상적으로 입력 되었습니다."; 
			else msg= "자료 입력 중 오류 발생";	  
			mv.addObject("msg", msg); 
			//mv.addObject("page", page);
			mv.setViewName("bid.applicationResult"); 
		} catch (Exception e) { 
			e.printStackTrace(); 
		} 
		
		return mv; 
	}
	 
}
