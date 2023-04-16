package com.boardMain.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boardMain.model.Board_MainDAO;
import com.boardMain.model.Board_MainDTO;
import com.member.action.Action;
import com.member.action.ActionForward;

public class RandomRestaurantAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, Exception {

		Board_MainDAO dao = Board_MainDAO.getInstance();
		
		int MainList = dao.getBoardCount();

		int randomNum = (int)(Math.random() * MainList) + 1;
		
		Board_MainDTO dto = dao.getBoardMainSelect(randomNum);
		
		System.out.println(dto);
		
		request.setAttribute("DTO", dto);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("RandomRestaurant.jsp");
		
		return forward;
		
	}

}
