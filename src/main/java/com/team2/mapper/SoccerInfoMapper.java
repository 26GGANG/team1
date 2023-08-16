package com.team2.mapper;

import java.util.List;

import com.team2.vo.SoccerInfoVO;

public interface SoccerInfoMapper {

	List<SoccerInfoVO> selectSoccerInfoList(SoccerInfoVO soccer);
	SoccerInfoVO selectSoccerInfo(int siNum);
	int insertSoccerInfo(SoccerInfoVO soccer);
	int updateSoccerInfo(SoccerInfoVO soccer);
	int deleteSoccerInfo(int siNum);
}
