package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.action.Action;
import com.board.model.BoardDAO;

public class MemberDeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String board_pwd = 
				request.getParameter("pwd").trim();
		
		int board_no = 
			Integer.parseInt(request.getParameter("no").trim());
		
		BoardDAO dao = BoardDAO.getInstance();
		
		int check = 
				dao.deleteBoard(board_no, board_pwd);
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			dao.updateSequence(board_no);
			out.println("<script>");
			out.println("alert('게시글 삭제 성공!!!')");
			out.println("location.href='select.do'");
			out.println("</script>");
		}else if(check == -1) {
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다.~~~')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('게시글 삭제 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
	
		return null;
	}

}
