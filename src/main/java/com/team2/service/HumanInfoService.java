package com.team2.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.team2.common.Mybatis;
import com.team2.mapper.HumanInfoMapper;
import com.team2.vo.HumanInfoVO;

public class HumanInfoService {

	public List<HumanInfoVO> getHumanInfos(HumanInfoVO human){
		try(SqlSession session = Mybatis.getFactory().openSession()){
			HumanInfoMapper hiMapper = session.getMapper(HumanInfoMapper.class);
			return hiMapper.selectHumanInfoList(human);
		}
	}

	public HumanInfoVO getHumanInfo(int hiNum){
		try(SqlSession session = Mybatis.getFactory().openSession()){
			HumanInfoMapper hiMapper = session.getMapper(HumanInfoMapper.class);
			return hiMapper.selectHumanInfo(hiNum);
		}
	}

	public int insertHumanInfo(HumanInfoVO human){
		try(SqlSession session = Mybatis.getFactory().openSession()){
			HumanInfoMapper hiMapper = session.getMapper(HumanInfoMapper.class);
			return hiMapper.insertHumanInfo(human);
		}
	}
}
