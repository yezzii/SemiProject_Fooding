package com.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import security.PasswordEmail;

public class testAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, Exception {

		PasswordEmail email = new PasswordEmail();
		String to = "ll001122@naver.com";
		email.sendEmail(to);
		
		return null;
	}

}
