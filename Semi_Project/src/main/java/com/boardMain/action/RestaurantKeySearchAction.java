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

	public class RestaurantKeySearchAction implements Action {

		@Override
		public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
				throws IOException, ServletException {
			
			String keyword = request.getParameter("keyword").trim();
		
			String SType = null;

			if (keyword.equals("서울") || keyword.equals("경기") || keyword.equals("인천") || keyword.equals("대구") || keyword.equals("부산") || keyword.equals("제주")) {
			    SType = "Location";
			} else if (keyword.equals("고기") || keyword.equals("한식") || keyword.equals("양식") || keyword.equals("중식") || keyword.equals("일식") || keyword.equals("아시안") || keyword.equals("카페")) {
			    SType = "FoodType";
			} else if (keyword.equals("데이트") || keyword.equals("가족") || keyword.equals("뷰") || keyword.equals("전통") || keyword.equals("비지니스")) {
			    SType = "Thema";
			} else{
				SType = "";
			}

			int totalRestaurant = 0;
			Board_MainDAO dao = Board_MainDAO.getInstance();
			totalRestaurant = dao.searchRestaurantCount(keyword);
			System.out.println("검색값 : " + keyword);
			System.out.println("Type : " + SType);

			
			
			List<RtDTO> searchList = dao.RestaurantKeywordSearch(keyword,SType);
			
			request.setAttribute("totalRestaurant", totalRestaurant);
			request.setAttribute("keyword", keyword);
			request.setAttribute("List", searchList);
			
			ActionForward forward = new ActionForward();
			 
			forward.setRedirect(false);
			forward.setPath("RestaurantList.jsp");
			
			return forward;
			
			
		}

	}
