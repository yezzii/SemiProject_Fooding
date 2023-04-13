package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

import sha256.Encryption;

public class MemberKakaoLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

	MemberDAO dao = MemberDAO.getInstance();
		
	String Raw_pwd = request.getParameter("member_token").trim();
	String kakao_token = Encryption.encodeSha256(Raw_pwd);
	String kakao_name = request.getParameter("member_name").trim();
	String kakao_email = request.getParameter("member_email").trim();
	String kakao_thumnail = request.getParameter("thumbnail").trim();
		
	HttpSession session = request.getSession();

	PrintWriter out = response.getWriter();

	session = request.getSession(true);

	int check = dao.tokenCheck(kakao_token);

	ActionForward forward = new ActionForward();
	
			
		if(check == 0) {		//회원이 아닌경우 회원가입페이지로 안내
			
			
			request.setAttribute("member_token", kakao_token);
			request.setAttribute("member_name", kakao_name);
			request.setAttribute("member_email", kakao_email);
			request.setAttribute("member_thumnail", kakao_thumnail);
			request.setAttribute("alert", 1);
		
			forward.setRedirect(false);
			
			forward.setPath("member/member_kakao_join.jsp");
		
		
		}else if(check == 1) {				//회원인 경우 로그인 페이지로 안내
			
			MemberDTO memdto = dao.KakaoLogin(kakao_token, kakao_name, kakao_email);
			
			if (memdto != null) {
				
				if (memdto.getMember_type() == 0) {
					
					session.setAttribute("id", memdto.getMember_id());
					session.setAttribute("name", memdto.getMember_name());
					session.setAttribute("type", memdto.getMember_type());
					
					out.println("<script>");
					out.println("alert('" + session.getAttribute("name") + " 관리자님 오지게 인사박습니다.')");
					out.println("location.href='main.jsp'");
					out.println("</script>");
					
				} else if (memdto.getMember_type() == 1) {

					session.setAttribute("id", memdto.getMember_id());
					session.setAttribute("email", memdto.getMember_email());
					session.setAttribute("phone", memdto.getMember_phone());
					session.setAttribute("name", memdto.getMember_name());
					session.setAttribute("type", memdto.getMember_type());

					out.println("<script>");
					out.println("alert('" + session.getAttribute("name") + " 회원님 다시 오신걸 환영합니다.')");
					out.println("location.href='main.jsp'");
					out.println("</script>");

				} else if (memdto.getMember_type() == 2) {

					session.setAttribute("id", memdto.getMember_id());
					session.setAttribute("email", memdto.getMember_email());
					session.setAttribute("phone", memdto.getMember_phone());
					session.setAttribute("name", memdto.getMember_name());
					session.setAttribute("type", memdto.getMember_type());
					session.setAttribute("storenum", memdto.getMember_storenum());
					

					out.println("<script>");
					out.println("alert('" + session.getAttribute("name") + " 사장님 다시 오신걸 환영합니다.')");
					out.println("location.href='main.jsp'");
					out.println("</script>");
				}else if (memdto.getMember_type() == 3) {

					session.setAttribute("id", memdto.getMember_id());
					session.setAttribute("name", memdto.getMember_name());
					session.setAttribute("type", memdto.getMember_type());
					session.setAttribute("Thumnail", kakao_thumnail);

					out.println("<script>");
					out.println("alert('" + session.getAttribute("name") + " 카카오 회원님 환영합니다.')");
					out.println("location.href='main.jsp'");
					out.println("</script>");
				
			}else {
					out.println("<script>");
					out.println("alert('아이디 및 비밀번호를 확인해주세요')");
					out.println("history.back()");
					out.println("</script>");
			}
		}					
	}
		
		return forward;
	}
}
