package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;

import sha256.Encryption;

public class MemberDeleteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		String member_id = request.getParameter("member_id");
		
		String Raw_pwd =  request.getParameter("member_pwd");	
		String member_pwd = Encryption.encodeSha256(Raw_pwd);
		
		MemberDAO dao = MemberDAO.getInstance();
		
		int check = dao.MemberDelete(member_id, member_pwd);
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('회원 삭제가 되었습니다.')");
			out.println("location.href='index.jsp'");		//수정하기(리스트로)
			out.println("</script>");
		}else if(check == -1) {
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다.다시 확인해주세요')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('회원 삭제 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return null;
	}

}
