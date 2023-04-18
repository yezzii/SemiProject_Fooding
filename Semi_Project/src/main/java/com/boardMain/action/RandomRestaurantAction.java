package com.boardMain.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.*;

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
		
		int mainCount = dao.getBoardCount();
		
		List<Board_MainDTO> list = new ArrayList<Board_MainDTO>();
		
		Set<Integer> selected = new HashSet<>(); // 이미 선택된 랜덤값을 저장하는 Set

		while(selected.size() < 3) { // 3개의 값이 선택될 때까지 반복
		    int randomNum = (int)(Math.random() * mainCount) + 1;

		    while (selected.contains(randomNum) || randomNum > mainCount) { // 선택한 값이 이전에 선택된 값과 같거나, mainCount보다 크면 다시 랜덤한 수를 뽑음
		        randomNum = (int)(Math.random() * mainCount) + 1;
		    }

		    Board_MainDTO dto = dao.getBoardMainSelect(randomNum);
		    list.add(dto); // 선택한 값의 DTO를 리스트에 추가
		    selected.add(randomNum); // 선택한 값을 Set에 추가
		    System.out.println(randomNum);
		}
		System.out.println(list);
		
		request.setAttribute("List", list);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("RandomRestaurant.jsp");
		
		return forward;
		
	}

}
