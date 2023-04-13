package com.boardMain.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boardMain.model.Board_MainDAO;
import com.boardMain.model.Board_MainDTO;
import com.member.action.Action;
import com.member.action.ActionForward;

public class Board_mainUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// 가게정보 수정 액션 페이지
		int board_idx = Integer.parseInt(request.getParameter("idx"));
		
		Board_MainDAO dao = Board_MainDAO.getInstance();
		
		Board_MainDTO dto  = dao.getBoardMainSelect(board_idx);
		
		request.setAttribute("boardmain", dto);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("board/boardmain_update.jsp");
		
		return forward;
	}

}
