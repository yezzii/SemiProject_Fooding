package com.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;
import com.board.model.Board_mainDTO;

public class BoardMainInsertOkAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
		{
		
		Board_mainDTO dto = new Board_mainDTO();
		
		dto.setMain_name(request.getParameter("name"));
		dto.setMain_addr(request.getParameter("addr"));
		dto.setMain_location(request.getParameter("location"));
		dto.setMain_content(request.getParameter("content"));
		
		
		BoardDAO dao = BoardDAO.getInstance();
		
		dao.Insert_main(dto);
		
		return null;
	}

}
