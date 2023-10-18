package com.me.quiz.server;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;


@Component
public class StartupPy {
	private static final Logger logger = LoggerFactory.getLogger(StartupPy.class);
	
	private final Runtime rt = Runtime.getRuntime();
	public void initialize() {
		logger.info("python start");
		System.out.println("python start");
		try {
			Process proc = rt.exec("C:\\dev\\anaconda\\envs\\bigdata\\python C:\\dev\\study\\pythonProject\\OCR\\ocrbackup.py");
			
			 // 결과를 읽기 위한 BufferedReader 생성
            BufferedReader stdInput = new BufferedReader(new InputStreamReader(proc.getInputStream()));
            BufferedReader stdError = new BufferedReader(new InputStreamReader(proc.getErrorStream()));

            // 표준 출력 읽기
            String s;
            System.out.println("Here is the standard output of the command:\n");
            while ((s = stdInput.readLine()) != null) {
                System.out.println(s);
			
            }
            
            //프로세스 종료 대기
            int exitCode = proc.waitFor();
            
            if (exitCode==0) {
				logger.info("파이선 스크립트 실행성공");
			}else {
				logger.error("파이선스크립트 실패");
			}
			
			
			
			
		} catch (IOException | InterruptedException e) {
			logger.error(e.toString());
			e.printStackTrace();
		}

		
	}
}
