package com.starReview.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.action.Action;
import com.member.action.ActionForward;
import com.starReview.model.starDAO;
import com.starReview.model.starDTO;

public class StarReviewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, Exception {
		// TODO Auto-generated method stub


		String star= request.getParameter("star");
		String review = request.getParameter("review");
		int idx = Integer.parseInt(request.getParameter("idx"));
			System.out.println(idx);
			System.out.println(star);
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		String reviewStar = (star);
		
		starDTO dto = new starDTO();
		
		dto.setStore_num(idx);
		dto.setStar_count(reviewStar);
		dto.setReview(review);
		dto.setMember_id(id);
		
		starDAO dao = starDAO.getInstance();
		
		int check = dao.insertStar(dto);
		
		
		PrintWriter out = response.getWriter();
		
		out.println(check + "");
		
		return null;
	}

}
