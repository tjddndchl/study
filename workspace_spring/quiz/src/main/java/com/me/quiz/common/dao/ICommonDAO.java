package com.me.quiz.common.dao;

import org.apache.ibatis.annotations.Mapper;

import com.me.quiz.common.vo.CommonVO;

@Mapper
public interface ICommonDAO {
	public int registCommon(CommonVO common);
	public CommonVO loginCommon(CommonVO common);
}
