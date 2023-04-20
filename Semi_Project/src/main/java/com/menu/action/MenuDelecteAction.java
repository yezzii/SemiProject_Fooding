package com.menu.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.action.Action;
import com.member.action.ActionForward;
import com.menu.model.MenuDAO;

public class MenuDelecteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, Exception {
		
		
		int menu_no = Integer.parseInt(request.getParameter("no"));
		System.out.println("menu_no>>>"+menu_no);
		MenuDAO dao = MenuDAO.getInstance();
		
		int res = dao.deleteMenu(menu_no);
		
		PrintWriter out = response.getWriter();
		
		out.println(res);
		
		return null;
	}

}
