package com.reservation.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.action.Action;
import com.member.action.ActionForward;
import com.reservation.model.ReservationDAO;
import com.reservation.model.ReservationDTO;

public class InsertReservationAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, Exception {

		String date = request.getParameter("date");
		String time = request.getParameter("time");
		int people_num = Integer.parseInt(request.getParameter("people_num"));
		String req_text = request.getParameter("req_text");
		int idx = Integer.parseInt(request.getParameter("main_idx"));
		
		HttpSession session = request.getSession();
		
		ReservationDTO dto = new ReservationDTO();
		
		dto.setMain_idx(idx);
		dto.setMember_cnt(people_num);
		dto.setMember_id((String) session.getAttribute("id"));
		dto.setRequest_text(req_text);
		dto.setD_day(date+" "+time);
		
		
		ReservationDAO dao = ReservationDAO.getInstance();
		
		int result = dao.reservation_insert(dto);
		
		PrintWriter out = response.getWriter(); 
		
		out.println(result+"");
		
		return null;
	}

}
