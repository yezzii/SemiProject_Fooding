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

public class Board_mainSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String field = request.getParameter("field").trim();
		String keyword = request.getParameter("keyword").trim();
		
		int rowsize=10;
		
		int block = 3;
		
		int totalMember = 0;
		
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
		
		totalMember = dao.serchListCount(field,keyword);
		
		allPage = (int)Math.ceil(totalMember / (double)rowsize);
		
		if(endBlock > allPage) {
			endBlock = allPage;
		}
		
		List<Board_MainDTO>searchList = dao.getSearchBoardmainList(field,keyword,page,rowsize);
		
		request.setAttribute("page", page);
		 request.setAttribute("rowsize", rowsize);
		 request.setAttribute("block", block);
		 request.setAttribute("totalMember", totalMember);
		 request.setAttribute("allPage", allPage);
		 request.setAttribute("startNo", startNo);
		 request.setAttribute("endNo", endNo);
		 request.setAttribute("StartBlock", StartBlock);
		 request.setAttribute("endBlock", endBlock);
		 request.setAttribute("field", field);
		 request.setAttribute("keyword", keyword);
		 request.setAttribute("List", searchList);
		
		 ActionForward forward = new ActionForward();
		 
		 forward.setRedirect(false);
		 forward.setPath("Board_Main_search.jsp");
		
		 return forward;
		
		
	}

}
