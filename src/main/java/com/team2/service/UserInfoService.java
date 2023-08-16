package com.team2.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.team2.common.Mybatis;
import com.team2.mapper.UserInfoMapper;
import com.team2.vo.UserInfoVO;

public class UserInfoService {

	public List<UserInfoVO> getUserInfos(UserInfoVO user){
		try(SqlSession session = Mybatis.getFactory().openSession()){
			UserInfoMapper uiMapper = session.getMapper(UserInfoMapper.class);
			return uiMapper.selectUserInfoList(user);
		}
	}
	
	public UserInfoVO getUserInfos(int uiNum){
		try(SqlSession session = Mybatis.getFactory().openSession()){
			UserInfoMapper uiMapper = session.getMapper(UserInfoMapper.class);
			return uiMapper.selectUserInfo(uiNum);
		}
	}
	
}
