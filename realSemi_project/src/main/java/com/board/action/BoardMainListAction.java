package com.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;
import com.board.model.Board_mainDTO;

public class BoardMainListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		BoardDAO dao = BoardDAO.getInstance();
		
		List<Board_mainDTO> list = dao.getBoardMainList();
		
		request.setAttribute("List", list);
		
		return "반환될 페이지 파일명";
	}

}
