package com.team2.common;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.team2.mapper.HumanInfoMapper;
import com.team2.vo.HumanInfoVO;

public class Mybatis {

	private static SqlSessionFactory ssf;
	private static final String CONFIG_PATH = "config/mybatis-config.xml";
	static {
		try {
			InputStream is = Resources.getResourceAsStream(CONFIG_PATH);
			SqlSessionFactoryBuilder ssfb = new SqlSessionFactoryBuilder();
			ssf = ssfb.build(is);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public static SqlSessionFactory getFactory() {
		return ssf;
	}
	public static void main(String[] args) {
		SqlSession session = ssf.openSession();
		HumanInfoMapper hiMapper = session.getMapper(HumanInfoMapper.class);
		HumanInfoVO human = hiMapper.selectHumanInfo(1);
		System.out.println(human);
	}
}
