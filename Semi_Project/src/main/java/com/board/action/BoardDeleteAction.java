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
		int type = Integer.parseInt(request.getParameter("type"));
		
		
		
		BoardDAO dao = BoardDAO.getInstance();
		
		int dto = dao.deleteBoard(board_no);
		
		PrintWriter out = response.getWriter();
		
			
		
		
		
		
			if(dto > 0) {
				out.println("<script>");
				out.println("alert('게시물 삭제 성공.')");
				out.println("</script>");
				if(type == 0) {
					out.println("<script>");
					out.println("location.href='free_board.do'");
					out.println("</script>");
				}else if(type == 1) {
					out.println("<script>");
					out.println("location.href='review_board.do'");
					out.println("</script>");
			    }else if(type == -1) {
					out.println("<script>");
					out.println("location.href='blog_list.do'");
					out.println("</script>");
			}else {
		    	out.println("<script>");
				out.println("alert('게시물 삭제 실패.')");
				out.println("history.back()");
				out.println("</script>");
		    }
		
		return null;
		
	}
			return null;

	}
}
