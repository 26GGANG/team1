package com.team2.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.team2.common.Mybatis;
import com.team2.mapper.SingInfoMapper;
import com.team2.vo.SingInfoVO;

public class SingInfoService {
	
	public List<SingInfoVO> getSingInfos(SingInfoVO sing){
		try(SqlSession session=Mybatis.getFactory().openSession()){
			SingInfoMapper siMapper=session.getMapper(SingInfoMapper.class);
			return siMapper.selectSingInfoList(sing);
		}
	}
	public SingInfoVO getSingInfo(int siNum){
		try(SqlSession session=Mybatis.getFactory().openSession()){
			SingInfoMapper siMapper=session.getMapper(SingInfoMapper.class);
			return siMapper.selectSingInfo(siNum);
		}
	}

}
