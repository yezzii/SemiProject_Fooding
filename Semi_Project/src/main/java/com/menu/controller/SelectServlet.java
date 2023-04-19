package com.menu.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.menu.model.MenuDAO;

/**
 * Servlet implementation class SelectServlet
 */
@WebServlet("/select.do")
public class SelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public SelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 전체 메뉴리스트를 조회하는 비지니스 로직.
		
		response.setContentType("text/html; charset=UTF-8");
		
		MenuDAO dao = MenuDAO.getInstance();
		
		PrintWriter out = response.getWriter();
		
		String str = dao.getMenuList();
		
		out.println(str);
		
	}

}
