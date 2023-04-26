package com.reservation.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.action.Action;
import com.member.action.ActionForward;
import com.reservation.model.ReservationDAO;
import com.reservation.model.ReservationDTO;

public class ListReservationAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, Exception {

		HttpSession session = request.getSession();
		
		String mem_id = (String)session.getAttribute("id");
		
		ReservationDAO dao = ReservationDAO.getInstance();
		
		int rowsize = 9;
		int block = 5;
		int totalReservation = 0;
		int allpage = 0;
		int page = 0;
		
		if(request.getParameter("page")!= null) {
			page = Integer.parseInt(request.getParameter("page").trim());
		}else {
			page = 1;
		}
		
		if(page==0) {
			page = 1;
		}
		
		
		int startNo = (page * rowsize) - (rowsize - 1);
		
		int endNo = (page * rowsize);
		
		// 해당 페이지에서 시작 블럭
		int startBlock = (((page - 1) / block) * block) + 1;
		// 해당 페이지에서 마지막 블럭
		int endBlock = (((page - 1) / block) * block) + block;
		
		totalReservation = dao.getReservationCount(mem_id);
		
		allpage = (int) Math.ceil(totalReservation / (double) rowsize);

		if (endBlock > allpage) {
			endBlock = allpage;
		}
		System.out.println("start : " + startNo);
		System.out.println("end : " + endNo);
		
		List<ReservationDTO> ReservationList = new ArrayList<ReservationDTO>();
		
		ReservationList = dao.reservation_list(page, rowsize, mem_id);
		
		request.setAttribute("page", page);
		request.setAttribute("allPage", allpage);
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);
		
		request.setAttribute("ReservationList", ReservationList);
		
		
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("account-orders.jsp");
		
		return forward;
	}

}
