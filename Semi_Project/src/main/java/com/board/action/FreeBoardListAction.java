package com.board.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;
import com.board.model.BoardDTO;

public class FreeBoardListAction implements BoardAction {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		BoardDAO dao = BoardDAO.getInstance();
		
		List<BoardDTO> list = dao.FreeBoardList();
		System.out.println("111111");
		request.setAttribute("List", list);
		
		return null;
	}

}
