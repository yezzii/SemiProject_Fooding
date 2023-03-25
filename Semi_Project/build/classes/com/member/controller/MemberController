package com.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.action.CompanyJoinAction;
import com.member.action.MemberAction;
import com.member.action.MemberFindIdAction;
import com.member.action.MemberJoinAction;
import com.member.action.MemberLoginAction;

public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemberController() {
		super();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String uri = request.getRequestURI();

		String path = request.getContextPath();

		String command = uri.substring(path.length() + 1);

		System.out.println(command);
		
		MemberAction action = null;
		
		
		//이 사이에 if 문으로 *.go 비교 해야됨
		if(command.equals("member_join.go")) {
			action = new MemberJoinAction();
		}else if(command.equals("company_join.go")) {
			action = new CompanyJoinAction();
		}else if(command.equals("login.go")) {
			action = new MemberLoginAction();
		}else if(command.equals("find_id.go")) {
			action = new MemberFindIdAction();
		}

		String path1 = action.execute(request, response);

		RequestDispatcher rd = request.getRequestDispatcher(path1);

		rd.forward(request, response);
	}

}
