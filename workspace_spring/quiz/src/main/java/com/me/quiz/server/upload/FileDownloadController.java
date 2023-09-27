package com.me.quiz.server.upload;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FileDownloadController {
	private static String CURR_IMAGE_REPO_PATH = "C:\\dev\\pythonProject\\OCR\\test"; //파일저장 위치
	
	@RequestMapping("/download")
	public void download(@RequestParam("imageFileName") String imageFileName,//다운할 이미지 파일 이름 전달
							HttpServletResponse response)throws Exception {
	OutputStream out = response.getOutputStream();
	String downFile = CURR_IMAGE_REPO_PATH + "\\" + imageFileName;
	File file = new File(downFile); //다운드로할 파일 객체 생성
	
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Content-disposition", "attachment; fileName=" + imageFileName);//헤더에 파일 이름 설정
	FileInputStream in = new FileInputStream(file);
	byte[] buffer = new byte [1024 * 8];
	while (true) {
		int count = in.read(buffer);      //버퍼를 이용해 한번에 8Kbyte씩 브라우저로 전송
		if (count == -1) break;           //파일의 끝에 도달하는 루프종료 반환
		out.write(buffer, 0, count);
			
	}
	in.close();
	out.close();
	}
}
