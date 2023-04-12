package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.Board_MainDAO;
import com.member.action.Action;
import com.member.action.ActionForward;

public class Board_mainDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		
		int board_idx = Integer.parseInt(request.getParameter("idx"));
		
		Board_MainDAO dao = Board_MainDAO.getInstance();
		
		int check = dao.deleteBoardmain(board_idx);
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			dao.updateSequence(board_idx);
			out.println("<script>");
			out.println("alert('가게 삭제 완료')");
			out.println("location.href = 'board_main_list.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('가게 삭제 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		return null;
	}

}
