package com.team2.mapper;

import java.util.List;

import com.team2.vo.SingInfoVO;

public interface SingInfoMapper {

	List<SingInfoVO> selectSingInfoList (SingInfoVO sing);
	SingInfoVO selectSingInfo(int siNum);
	
	
}
