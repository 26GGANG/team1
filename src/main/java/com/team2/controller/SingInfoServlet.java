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
import com.team2.service.SingInfoService;
import com.team2.vo.SingInfoVO;


@WebServlet("/sing-info/*")
public class SingInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Gson gson=new Gson();
	private SingInfoService siService = new SingInfoService();
	String json="";
	
	
	
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<SingInfoVO> singList=siService.getSingInfos(null);
		String json=gson.toJson(singList);
		
		String cmd=CommandParser.getCmd(request);
		if("list".equals(cmd)) {
			 singList=siService.getSingInfos(null);
			json=gson.toJson(singList);
		}else if("one".equals(cmd)) {
			int siNum=Integer.parseInt(request.getParameter("siNum"));
			SingInfoVO sing=siService.getSingInfo(siNum);
			json=gson.toJson(sing);
		}
		doProcess(response,json); 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}
	public void doProcess(HttpServletResponse response, String json) throws IOException{
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
	}
public class CommandParser {
		
		public static String getCmd(HttpServletRequest request) {
			String uri = request.getRequestURI();
			int idx = uri.lastIndexOf("/")+1;
			return uri.substring(idx);
		}
	}
}


