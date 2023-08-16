package com.team2.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.team2.service.SoccerInfoService;
import com.team2.vo.SoccerInfoVO;

@WebServlet("/soccer-info/*")
public class SoccerInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Gson gson = new Gson();
    private SoccerInfoService siService = new SoccerInfoService();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String json = "";
		String uri = request.getRequestURI();
		int idx = uri.lastIndexOf("/")+1;
		uri = uri.substring(idx);
		if("list".equals(uri)) {
			List<SoccerInfoVO> soccerList = siService.selectSoccerInfoList(null);
			json = gson.toJson(soccerList);
		}else if("view".equals(uri)) {
			int siNum = Integer.parseInt(request.getParameter("siNum"));
			SoccerInfoVO soccer = siService.selectSoccerInfo(siNum);
			json = gson.toJson(soccer);
		}
		doProcess(response,json);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		BufferedReader br = request.getReader();
		StringBuffer sb = new StringBuffer();
		String str = null;
		while((str=br.readLine())!=null) {
			sb.append(str);
		}
		SoccerInfoVO soccer = gson.fromJson(sb.toString(),SoccerInfoVO.class);
		
		String uri = request.getRequestURI();
		int idx = uri.lastIndexOf("/")+1;
		uri = uri.substring(idx);
		if("delete".equals(uri)) {
			result = siService.deleteSoccerInfo(soccer.getSiNum());
		}
	}
	
	public void doProcess(HttpServletResponse response, String json) throws IOException {
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
	}

}
