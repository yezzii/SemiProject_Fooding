package com.member.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.action.Action;
import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

public class MemberList implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		MemberDAO dao = MemberDAO.getInstance();
		
		List<MemberDTO> list = dao.getMemberList();
		
		request.setAttribute("List", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("member_list.jsp");
		
		rd.forward(request, response);
		
		return null;
	}

}
