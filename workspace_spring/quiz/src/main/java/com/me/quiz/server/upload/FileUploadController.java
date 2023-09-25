package com.me.quiz.server.upload;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.me.quiz.server.StartupPy;

@Controller
public class FileUploadController {
	private static final String CURR_IMAGE_REPO_PATH = "C:\\dev\\pythonProject\\OCR\\test";
	
	
	@RequestMapping(value = "/form")
	public String form() {
		return "uploadForm";
	}
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public ModelAndView upload(MultipartHttpServletRequest multipartRequest,
								HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("UTF-8");
		Map map = new HashMap(); 
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			map.put(name, value);
		}
		List fileList = fileProcess(multipartRequest);
		map.put("fileList", fileList);
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("result");
		
		//initialize 메서드 호출
	
		return mav;
	}
	


    
    

	private List<String> fileProcess(MultipartHttpServletRequest multipartRequest) throws Exception {
		// TODO Auto-generated method stub
		
		List<String> fileList = new ArrayList<String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();//첨부된 파일이름을 가져옴
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);//파일이름 객체가져옴
			String originalFileName = mFile.getOriginalFilename(); // 실제 파일 이름을 가져옵니다.
			fileList.add(originalFileName); //파일이름 하나씩 저장
			
			File file = new File(CURR_IMAGE_REPO_PATH + "\\" + originalFileName); 
			if (mFile.getSize()!= 0) { //첨부된 파일이 있는지 체크
				if (! file.exists()) {
					if (file.getParentFile().mkdirs()) { //경로에 파일이 없으면 그경로에 해당하는 디렉터리를 만든후 파일을 생성
						file.createNewFile();
					}
				}
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + originalFileName));//임시로 저장된 multipartFile을 실제 파일로 전송
	
			}
		}
		
		
		return fileList; //리스트 반환
		
	}
	


	
}
