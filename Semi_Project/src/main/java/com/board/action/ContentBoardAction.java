package com.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;
import com.board.model.BoardDTO;
import com.member.action.Action;
import com.member.action.ActionForward;

public class ContentBoardAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		int no = Integer.parseInt(request.getParameter("no"));

		BoardDAO dao = BoardDAO.getInstance();

		BoardDTO dto = dao.ContentBoard(no);

		request.setAttribute("DTO", dto);

		ActionForward forward = new ActionForward();

		forward.setRedirect(false);

		forward.setPath("board_detail.jsp");

		return forward;
	}

}
