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
import com.member.model.MemberDAO;

public class RestaurantSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String keyword = request.getParameter("keyword").trim();
		
		int rowsize=10;
		
		int block = 3;
		
		int totalRestaurant = 0;
		
		int allPage = 0;
		
		int page = 1;
		
		if(request.getParameter("page")!= null) {
			page = Integer.parseInt(request.getParameter("page").trim());
		}
		
		int startNo = (page * rowsize) - (rowsize - 1);
		
		int endNo = (page * rowsize);
		
		int StartBlock = (((page-1)/block) * block) +1;
		
		int endBlock = (((page-1)/ block)*block)+block;
		
		Board_MainDAO dao = Board_MainDAO.getInstance();
		
		totalRestaurant = dao.searchRestaurantCount(keyword);
		System.out.println("keyword"+keyword);
		allPage = (int)Math.ceil(totalRestaurant / (double)rowsize);
		
		if(endBlock > allPage) {
			endBlock = allPage;
		}
		
		List<Board_MainDTO> searchList = dao.TotalMainSearch(keyword,page,rowsize);
		System.out.println("search"+searchList);
		request.setAttribute("page", page);
		 request.setAttribute("rowsize", rowsize);
		 request.setAttribute("block", block);
		 request.setAttribute("totalMember", totalRestaurant);
		 request.setAttribute("allPage", allPage);
		 request.setAttribute("startNo", startNo);
		 request.setAttribute("endNo", endNo);
		 request.setAttribute("StartBlock", StartBlock);
		 request.setAttribute("endBlock", endBlock);
		 request.setAttribute("keyword", keyword);
		 request.setAttribute("List", searchList);
		
		 ActionForward forward = new ActionForward();
		 
		 forward.setRedirect(false);
		 forward.setPath("Board_Main_search.jsp");
		
		 return forward;
		
		
	}

}
