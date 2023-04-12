package com.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;
import com.board.model.Board_MainDAO;
import com.member.action.Action;
import com.member.action.ActionForward;

public class SearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		Board_MainDAO dao = Board_MainDAO.getInstance();
		String keyword = request.getParameter("main_serach").trim();
		
		dao.TotalMainSearch(keyword);
		
		return null;
	}

}
