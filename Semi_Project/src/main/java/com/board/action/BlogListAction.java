package com.board.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;
import com.board.model.BoardDTO;
import com.member.action.Action;
import com.member.action.ActionForward;

public class BlogListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, Exception {
		// TODO Auto-generated method stub
		
		BoardDAO dao = BoardDAO.getInstance();
		
		List<BoardDTO> list = dao.BlogList();
		
		request.setAttribute("blogList", list);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("blog_list.jsp");
		
		
		return forward;
	}

}
