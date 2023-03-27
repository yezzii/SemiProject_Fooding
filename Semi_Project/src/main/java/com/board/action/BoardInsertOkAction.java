package com.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;
import com.board.model.BoardDTO;

public class BoardInsertOkAction implements BoardAction {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		String board_title = request.getParameter("board_title");
		String board_writer = request.getParameter("board_writer");
		String board_content = request.getParameter("board_content");
		int board_type = Integer.parseInt(request.getParameter("board_type"));
		
		
		BoardDTO dto = new BoardDTO();

		dto.setBoard_title(board_title);
		dto.setBoard_writer(board_writer);
		dto.setBoard_content(board_content);
		dto.setBoard_type(board_type);
		
		BoardDAO dao = BoardDAO.getInstance();
		
		int result = dao.BoardInsert(dto);
		
		System.out.println("11111111");
		return null;
	}

}
