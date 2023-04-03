package com.member.action;

import javax.mail.*;

public class MemberFindPwdAction extends Authenticator {
	PasswordAuthentication pa;

	public MemberFindPwdAction() {
		String email = "hujik1234@gmail.com";
		String pwd = "";
		
		pa = new PasswordAuthentication(email, pwd);
		
	}
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return pa;
		
	} 
	
	 //받는 사람의 정보
	 String toName = request.getParameter("username");
	 String toEmail = request.getParameter("email");


}


