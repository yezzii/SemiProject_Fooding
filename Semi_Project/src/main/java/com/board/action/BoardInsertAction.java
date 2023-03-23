package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardInsertAction implements BoardAction {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		HttpSession session = request.getSession(false);
		
		String id = (String)session.getAttribute("id");
		
		PrintWriter out = response.getWriter();
		
		String loc = "";
		
		if(id.equals("") || id.equals(null)) {
			out.println("<script>");
			out.println("alert('로그인 후 다시 시도해주세요')");
			out.println("</script>");
			
			loc = "member/login.jsp";
		}else {
			loc = "board/board_write.jsp";
		}
		
		return loc;
	}

}
