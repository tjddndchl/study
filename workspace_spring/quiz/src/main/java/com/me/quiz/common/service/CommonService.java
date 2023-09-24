package com.me.quiz.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.me.quiz.common.dao.ICommonDAO;
import com.me.quiz.common.vo.CommonVO;

@Service
public class CommonService {
	@Autowired
	ICommonDAO dao;
	
	public void registCommon(CommonVO common) throws Exception {
		int result = dao.registCommon(common);
		
		if(result == 0 ) {
			throw new Exception();
		}
	}
	
	public CommonVO loginCommon(CommonVO common)  {
		
		CommonVO result = dao.loginCommon(common);
		System.out.println(result);
		if (result == null) {
			
			return null;
		}
		
		return result;
	}
}
