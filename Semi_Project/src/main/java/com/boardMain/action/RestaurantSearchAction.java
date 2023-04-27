package com.boardMain.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Restaurant.model.RtDTO;
import com.boardMain.model.Board_MainDAO;
import com.member.action.Action;
import com.member.action.ActionForward;

public class RestaurantSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String keyword = request.getParameter("keyword").trim();
	
		
		int rowsize=9;
		
		int block = 5;
		
		int totalRestaurant = 0;
		
		int allPage = 0;
		
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
		
		int StartBlock = (((page-1)/block) * block) +1;
		
		int endBlock = (((page-1)/ block)*block)+block;
		
		Board_MainDAO dao = Board_MainDAO.getInstance();
		
		totalRestaurant = dao.searchRestaurantCount(keyword);
		
		System.out.println("검색값 :"+keyword);
		System.out.println("totalRestaurant :"+totalRestaurant);
		
		allPage = (int)Math.ceil(totalRestaurant / (double)rowsize);
		
		if(endBlock > allPage) {
			endBlock = allPage;
		}
		System.out.println("start : " + startNo);
		System.out.println("end : " + endNo);
		
		List<RtDTO> searchList = dao.TotalMainSearch(keyword,page,rowsize);
		System.out.println("검색값 >>>"+searchList);
		System.out.println("page >>>"+page);
		 request.setAttribute("page", page);
		 request.setAttribute("rowsize", rowsize);
		 request.setAttribute("block", block);
		 request.setAttribute("totalRestaurant", totalRestaurant);
		 request.setAttribute("allPage", allPage);
		 request.setAttribute("startNo", startNo);
		 request.setAttribute("endNo", endNo);
		 request.setAttribute("StartBlock", StartBlock);
		 request.setAttribute("endBlock", endBlock);
		 
		 request.setAttribute("keyword", keyword);
		 request.setAttribute("List", searchList);
		
		 ActionForward forward = new ActionForward();
		 
		 forward.setRedirect(false);
		 forward.setPath("RestaurantSearchList.jsp");
		
		 return forward;
		
		
	}

}
