package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.Board_MainDAO;
import com.board.model.Board_MainDTO;
import com.member.action.Action;
import com.member.action.ActionForward;

public class Board_UpdateOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String main_name = request.getParameter("main_name");
		String main_type = request.getParameter("main_type");
		String main_info = request.getParameter("main_info");
		String main_opentime = request.getParameter("main_opentime");
		String main_endtime = request.getParameter("main_endtime");
		String main_post = request.getParameter("main_post");
		String main_addr = request.getParameter("main_addr");
		String main_detailaddr = request.getParameter("main_detailaddr");
		String main_phone = request.getParameter("main_phone");
		int main_idx = Integer.parseInt(request.getParameter("main_idx"));
		
		Board_MainDTO dto = new Board_MainDTO();
		
		dto.setMain_idx(main_idx);
		dto.setMain_name(main_name);
		dto.setMain_type(main_type);
		dto.setMain_info(main_info);
		dto.setMain_opentime(main_opentime);
		dto.setMain_endtime(main_endtime);
		dto.setMain_post(main_post);
		dto.setMain_addr(main_addr);
		dto.setMain_detailaddr(main_detailaddr);
		dto.setMain_phone(main_phone);
		
		Board_MainDAO dao = Board_MainDAO.getInstance();
		
		int check = dao.updateBoardMain(dto);
		
		PrintWriter out = response.getWriter();
		if(check > 0) {
			out.println("<script>");
			out.println("alert('가게 정보 수정 성공!!!')");
			out.println("location.href='board_main_list.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('가게 정보 수정 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		return null;
	}

}
