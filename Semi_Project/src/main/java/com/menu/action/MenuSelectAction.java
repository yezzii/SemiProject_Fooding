package com.menu.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.action.Action;
import com.member.action.ActionForward;
import com.menu.model.MenuDAO;

public class MenuSelectAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, Exception {
		
		
		MenuDAO dao = MenuDAO.getInstance();
		
		PrintWriter out = response.getWriter();
		
		String str = dao.getMenuList();
		
		out.println(str);
		
		return null;
	}

}
