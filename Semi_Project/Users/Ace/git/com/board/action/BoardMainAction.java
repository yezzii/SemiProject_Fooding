package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;
import com.board.model.BoardMainDTO;
import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

import sha256.Encryption;

public class BoardMainAction implements BoardAction {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		String name = request.getParameter("main_name");
		String content = request.getParameter("main_content");
		String addr = request.getParameter("main_addr");
		String location = request.getParameter("main_location");
		

		BoardMainDTO dto = new BoardMainDTO();
		
		dto.setMain_name(name);
		dto.setMain_content(content);
		dto.setMain_addr(addr);
		dto.setMain_location(location);

		BoardDAO dao = BoardDAO.getInstance();

		int result = dao.BoardMain(dto);

		PrintWriter out = response.getWriter();

		if(result > 0) {
			out.println("<script>");
			out.println("alert('가게등록 완료!')");
			out.println("location.href='main.jsp'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('가게등록 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return null;
	}

}