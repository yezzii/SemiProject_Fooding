package com.member.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.action.Action;
import com.board.model.BoardDAO;
import com.member.model.MemberDAO;
import com.member.model.MemberDTO;
import com.mysql.cj.x.protobuf.MysqlxDatatypes.Scalar.String;

public class MemberList implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		MemberDAO dao = MemberDAO.getInstance();
		
		List<MemberDTO> list = dao.getMemberList();
		
		request.setAttribute("List", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("webapp/member_list.jsp");
		
		rd.forward(request, response);
		
		
		return null;
	}

}
