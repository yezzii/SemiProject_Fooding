package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;
import com.board.model.BoardDTO;
import com.member.action.Action;
import com.member.action.ActionForward;

public class BoardModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		int type = Integer.parseInt(request.getParameter("type"));
		String title = request.getParameter("title");
		String cont = request.getParameter("cont");
		System.out.println(title);
		System.out.println(cont);
		System.out.println(idx);
		
		BoardDTO dto = new BoardDTO();
		
		dto.setBoard_idx(idx);
		dto.setBoard_title(title);
		dto.setBoard_content(cont);
		
		BoardDAO dao = BoardDAO.getInstance();
		
		
		int check = dao.boardModifyOk(dto);
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			if(type == 0) {
				out.println("<script>");
				out.println("alert('게시물 수정 성공.')");
				out.println("location.href='free_board.do'");
				out.println("</script>");

			}else if(type == 1) {
				out.println("<script>");
				out.println("alert('게시물 수정 성공.')");
				out.println("location.href='review_board.do'");
				out.println("</script>");
		    }
		}else {
	    	out.println("<script>");
			out.println("alert('게시물 수정 실패.')");
			out.println("history.back()");
			out.println("</script>");
	    }
		
		return null;
	}

}
