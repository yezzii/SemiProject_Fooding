package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.model.Board_MainDAO;
import com.board.model.Board_MainDTO;
import com.member.action.Action;
import com.member.action.ActionForward;
import com.mysql.cj.Session;

public class BoardSignupAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// board_signUp에서 넘어온 데이터를 등록시키는 비지니스 로직.
		
		String main_name = request.getParameter("main_name").trim();
		String main_type = request.getParameter("main_type").trim();
		String main_info = request.getParameter("main_info").trim();
		String main_opentime = request.getParameter("main_opentime").trim();
		String main_endtime = request.getParameter("main_endtime").trim();
		String main_post = request.getParameter("main_post").trim();
		String main_addr = request.getParameter("main_addr").trim();
		String main_detailaddr = request.getParameter("main_detailaddr").trim();
		String main_phone = request.getParameter("main_phone").trim();
		
		
		
		
		HttpSession session = request.getSession(true);
		
		String id =(String) session.getAttribute("id");
		
		System.out.println(id);
		
		Board_MainDTO dto = new Board_MainDTO();
		
		dto.setMain_name(main_name);
		dto.setMain_type(main_type);
		dto.setMain_info(main_info);
		dto.setMain_opentime(main_opentime);
		dto.setMain_endtime(main_endtime);
		dto.setMain_post(main_post);
		dto.setMain_addr(main_addr);
		dto.setMain_detailaddr(main_detailaddr);
		dto.setMain_phone(main_phone);
		dto.setMain_memid(id);
		
		Board_MainDAO dao = Board_MainDAO.getInstance();
		
		int res = dao.insertBoard_Main(dto);

		PrintWriter out = response.getWriter();
		
		if(res>0) {
			out.println("<script>");
			out.println("alert('등록완료')");
			out.println("location.href='select.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		return null;
	}

}
