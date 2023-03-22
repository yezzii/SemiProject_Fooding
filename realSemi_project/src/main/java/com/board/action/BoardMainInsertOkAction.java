package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;
import com.board.model.Board_mainDTO;

public class BoardMainInsertOkAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException
		{
		int result = 0;
		Board_mainDTO dto = new Board_mainDTO();
		
		dto.setMain_name(request.getParameter("name"));
		dto.setMain_addr(request.getParameter("addr"));
		dto.setMain_location(request.getParameter("location"));
		dto.setMain_content(request.getParameter("content"));
		
		
		BoardDAO dao = BoardDAO.getInstance();
		
		result = dao.Insert_main(dto);
		
		PrintWriter out = response.getWriter();
		
		if(result > 0) {
			out.println("<script>");
			out.println("alert('게시물 등록에 성공했습니다')");
			out.println("location.href='select_main.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('게시물 등록에 실패했습니다')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return null;
	}

}
