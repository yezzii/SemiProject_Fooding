package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;
import com.member.action.Action;
import com.member.action.ActionForward;

public class BoardDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		int board_no = Integer.parseInt(request.getParameter("no"));
		
		BoardDAO dao = BoardDAO.getInstance();
		
		int dto = dao.deleteBoard(board_no);
		
		PrintWriter out = response.getWriter();
		
			
			if(dto > 0) {
				out.println("<script>");
				out.println("alert('회원 삭제 성공!!!')");
				out.println("location.href='review_board.do'");	
				out.println("</script>");
			}else if(dto == -1) {
				out.println("<script>");
				out.println("alert('비밀번호가 틀립니다.~~~')");
				out.println("history.back()");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('회원 삭제 실패~~~')");
				out.println("history.back()");
				out.println("</script>");
			
		}
		
		return null;
		
	}

}
