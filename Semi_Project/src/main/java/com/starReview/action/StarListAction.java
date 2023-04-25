package com.starReview.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.action.Action;
import com.member.action.ActionForward;
import com.starReview.model.starDAO;
import com.starReview.model.starDTO;

public class StarListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, Exception {
		// TODO Auto-generated method stub
		
		
		starDAO dao = starDAO.getInstance();
		
		
		List<starDTO> list = dao.starList();
		
		
        request.setAttribute("List", list);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("RestaurantList.jsp");
		
		
		return forward;
	}
}