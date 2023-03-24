package com.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.action.BoardAction;
import com.board.model.BoardDAO;
import com.board.model.BoardMainDTO;

public class BoardGetContentAction implements BoardAction {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		BoardDAO dao = BoardDAO.getInstance();
		
		List<BoardMainDTO> contents = dao.getContentList();
		
		request.setAttribute("ContentList", contents);
		
		
		return "main.jsp";
		System.out.println("DB에서 콘텐츠 추출 성공");
	}

}
