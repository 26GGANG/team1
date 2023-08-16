package com.team2.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.team2.service.HumanInfoService;
import com.team2.vo.HumanInfoVO;

@WebServlet("/human-info/*")
public class HumanInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Gson gson = new Gson();
	private HumanInfoService hiService = new HumanInfoService();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		uri = uri.substring(uri.lastIndexOf("/")+1);
		String json = "";
		if("list".equals(uri)) {
			List<HumanInfoVO> humanList = hiService.getHumanInfos(null);
			json = gson.toJson(humanList);
		}else if("view".equals(uri) || "update".equals(uri)) {
			HumanInfoVO human = hiService.getHumanInfo(Integer.parseInt(request.getParameter("hiNum")));
			json = gson.toJson(human);
		}
		doPrecess(response, json);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		uri = uri.substring(uri.lastIndexOf("/")+1);
		String json = "";
		HumanInfoVO human = new HumanInfoVO();
		if("insert".equals(uri)) {
			int result = hiService.insertHumanInfo(human);
			json = gson.toJson(result);
		}
		doPrecess(response, json);
	}
	
	public void doPrecess(HttpServletResponse response, String json) throws IOException {
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
	}
}
