package com.board.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.Board_MainDAO;
import com.board.model.Board_MainDTO;
import com.member.action.Action;
import com.member.action.ActionForward;

public class Board_mainListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		int rowsize = 10;
		int block = 5;
		int totalBoard_main = 0;
		int allpage = 0;
		int page = 0;
		
		if(request.getParameter("page")!= null) {
			page = Integer.parseInt(request.getParameter("page").trim());
		}else {
			page = 1;
		}
		
		int startNo = (page * rowsize) - (rowsize - 1);
		
		int endNo = (page * rowsize);
		
		// 해당 페이지에서 시작 블럭
		int startBlock = (((page - 1) / block) * block) + 1;
		// 해당 페이지에서 마지막 블럭
		int endBlock = (((page - 1) / block) * block) + block;
		
		Board_MainDAO dao = Board_MainDAO.getInstance();
		
		totalBoard_main = dao.getBoardCount();
		
		allpage = (int) Math.ceil(totalBoard_main / (double) rowsize);

		if (endBlock > allpage) {
			endBlock = allpage;
		}
		
		List<Board_MainDTO> MainList = dao.getBoardMainList(page, rowsize);
		
		request.setAttribute("page", page);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("totalBoardmain",totalBoard_main);
		request.setAttribute("allPage", allpage);
		request.setAttribute("startNo", startNo);
		request.setAttribute("endNo", endNo);
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);
		
		request.setAttribute("List", MainList);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("board/boardmain_list.jsp");
		
		return forward;
	}

}
