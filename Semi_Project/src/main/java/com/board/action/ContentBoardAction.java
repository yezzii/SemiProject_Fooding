package com.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;
import com.member.action.Action;
import com.member.action.ActionForward;

public class ContentBoardAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		int no = Integer.parseInt(request.getParameter("no"));
		
		BoardDAO dao = BoardDAO.getInstance();
		
		dao.ContentBoard(no);
		
		return null;
	}

}
