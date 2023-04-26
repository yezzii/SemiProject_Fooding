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

	public class RestaurantCostSearchAction implements Action {

		@Override
		public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
				throws IOException, ServletException {
			

			int costMin = Integer.parseInt(request.getParameter("min").trim());
			int costMax = Integer.parseInt(request.getParameter("max").trim());

			String costVal = Integer.toString(costMin)+"원 ~ "+ Integer.toString(costMax)+"원";
			Board_MainDAO dao = Board_MainDAO.getInstance();
			
			System.out.println(costMin);
			
			System.out.println(costMax);
			
			List<RtDTO> searchList = dao.RestaurantCostSearch(costMin,costMax);
			
			request.setAttribute("List", searchList);
			request.setAttribute("keyword", costVal);
			
			
			ActionForward forward = new ActionForward();
			 
			forward.setRedirect(false);
			forward.setPath("RestaurantList.jsp");
			
			return forward;
			
			
			
			
			
		}

	}
