package com.team2.mapper;

import java.util.List;

import com.team2.vo.HumanInfoVO;

public interface HumanInfoMapper {
	List<HumanInfoVO> selectHumanInfoList(HumanInfoVO human);
	HumanInfoVO selectHumanInfo(int hiNum);
	int insertHumanInfo(HumanInfoVO human);
	int updateHumanInfo(HumanInfoVO human);
	int deleteHumanInfo(int hiNum);
}
