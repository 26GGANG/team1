package com.team2.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.team2.common.Mybatis;
import com.team2.mapper.SoccerInfoMapper;
import com.team2.vo.SoccerInfoVO;

public class SoccerInfoService {

	public List<SoccerInfoVO> selectSoccerInfoList(SoccerInfoVO soccer) {
		try(SqlSession session = Mybatis.getFactory().openSession()) {
			SoccerInfoMapper siMapper = session.getMapper(SoccerInfoMapper.class);
			return siMapper.selectSoccerInfoList(soccer);
		}
	}
	
	public SoccerInfoVO selectSoccerInfo(int siNum) {
		try(SqlSession session = Mybatis.getFactory().openSession()) {
			SoccerInfoMapper siMapper = session.getMapper(SoccerInfoMapper.class);
			return siMapper.selectSoccerInfo(siNum);
		}
	}
	
	public int insertSoccerInfo(SoccerInfoVO soccer) {
		try(SqlSession session = Mybatis.getFactory().openSession()) {
			SoccerInfoMapper siMapper = session.getMapper(SoccerInfoMapper.class);
			return siMapper.insertSoccerInfo(soccer);
		}
	}
	
	public int updateSoccerInfo(SoccerInfoVO soccer) {
		try(SqlSession session = Mybatis.getFactory().openSession()) {
			SoccerInfoMapper siMapper = session.getMapper(SoccerInfoMapper.class);
			return siMapper.insertSoccerInfo(soccer);
		}
	}
	
	public int deleteSoccerInfo(int siNum) {
		try(SqlSession session = Mybatis.getFactory().openSession()) {
			SoccerInfoMapper siMapper = session.getMapper(SoccerInfoMapper.class);
			return siMapper.deleteSoccerInfo(siNum);
		}
	}
	
}
