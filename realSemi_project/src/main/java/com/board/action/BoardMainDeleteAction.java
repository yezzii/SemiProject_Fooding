package com.board.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;

public class BoardMainDeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int result = 0;
		
		BoardDAO dao = BoardDAO.getInstance();
		
		int no =Integer.parseInt(request.getParameter("no"));
		
		String pwd = session.getAttribute("pwd");
		
		dao.deleteBoard(no , pwd);
		
		return null;
	}

}
