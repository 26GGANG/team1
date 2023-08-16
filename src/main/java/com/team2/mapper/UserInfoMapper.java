package com.team2.mapper;

import java.util.List;

import com.team2.vo.UserInfoVO;

public interface UserInfoMapper {
	List<UserInfoVO> selectUserInfoList (UserInfoVO user);
	UserInfoVO selectUserInfo(int uiNum);
	
}
