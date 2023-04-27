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

public class FreeBoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		// TODO Auto-generated method stub
		int rowsize = 12;
		int block = 5;
		int reviewBoard_main = 0;
		int allpage = 0;
		int page = 0;
		
		if(request.getParameter("page")!= null) {
			page = Integer.parseInt(request.getParameter("page").trim());
		}else {
			page = 1;
		}
		
		if(page==0) {
			page = 1;
		}
		
		
		int startNo = (page * rowsize) - (rowsize - 1);
		
		int endNo = (page * rowsize);
		
		// 해당 페이지에서 시작 블럭
		int startBlock = (((page - 1) / block) * block) + 1;
		// 해당 페이지에서 마지막 블럭
		int endBlock = (((page - 1) / block) * block) + block;
		
		BoardDAO dao = BoardDAO.getInstance();
		
		reviewBoard_main = dao.getBoardCount();
		
		allpage = (int) Math.ceil(reviewBoard_main / (double) rowsize);

		if (endBlock > allpage) {
			endBlock = allpage;
		}
		
		System.out.println("start : " + startNo);
		System.out.println("end : " + endNo);
		
		
		List<BoardDTO> list = dao.getBoardReviewList(page, rowsize);
		
		request.setAttribute("page", page);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("reviewBoard_main",reviewBoard_main);
		request.setAttribute("allPage", allpage);
		request.setAttribute("startNo", startNo);
		request.setAttribute("endNo", endNo);
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);
		
		request.setAttribute("review_boardList", list);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("free_board.jsp");
		
		return forward;
	}

}
