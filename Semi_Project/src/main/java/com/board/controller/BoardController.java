package com.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.action.BoardAction;
import com.board.action.BoardInsertAction;
import com.board.action.BoardInsertOkAction;

public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BoardController() {
		super();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String uri = request.getRequestURI();

		String path = request.getContextPath();

		String command = uri.substring(path.length() + 1);

		BoardAction action = null;

		// 이 사이에 if 문으로 *.do 비교 해야됨
		if (command.equals("write_board.do")) {
			action = new BoardInsertAction();
		} else if (command.equals("write_boardOk.do")) {
			action = new BoardInsertOkAction();
		} else if (command.equals("Board_content.do")) {
			action = new BoardGetContentAction();
		}

		String path1 = action.execute(request, response);

		RequestDispatcher rd = request.getRequestDispatcher(path1);

		rd.forward(request, response);
	}
}
