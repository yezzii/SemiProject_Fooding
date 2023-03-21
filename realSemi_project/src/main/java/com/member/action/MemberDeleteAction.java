package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.action.Action;
import com.member.model.MemberDAO;

public class MemberDeleteAction implements Action {

	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		String member_pwd = 
				request.getParameter("pwd").trim();
		
		int member_no = 
			Integer.parseInt(request.getParameter("no").trim());
		
		MemberDAO dao = MemberDAO.getInstance();
		
		int check = 
				dao.DeleteMember(member_no, member_pwd);
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			dao.updateSequence(member_no);
			out.println("<script>");
			out.println("alert('게시글 삭제 성공!!!')");
			out.println("location.href='select.do'");
			out.println("</script>");
		}else if(check == -1) {
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다.~~~')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('게시글 삭제 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
	
		return null;
	}

}
