package com.starReview.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.member.action.Action;
import com.member.action.ActionForward;
import com.starReview.model.starDAO;

public class StarListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, Exception {
		
		response.setContentType("application/json;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		int idx = Integer.parseInt(request.getParameter("idx"));
		System.out.println(idx + "ㅇㅇㅇㅇ");
		
		starDAO dao = starDAO.getInstance();
		
		JSONArray list = dao.starList(idx);
		System.out.println(idx);
		
		JSONObject result = new JSONObject(idx);
		result.put("List", list);
		
		
		PrintWriter out = response.getWriter();
		out.print(result);
		
		return null;
	}
}