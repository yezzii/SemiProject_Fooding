package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;

import sha256.Encryption;

public class MemberKakaoJoinAction implements Action {

@Override
public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException {
	

			String Raw_pwd = request.getParameter("member_id").trim();
			String kakao_token = Encryption.encodeSha256(Raw_pwd);
			String member_name = request.getParameter("member_name").trim();
			String member_email = request.getParameter("member_email").trim();
			
			
			
			MemberDAO dao = MemberDAO.getInstance();
			
			int check = dao.idCheck(kakao_token);
			
			PrintWriter out = response.getWriter();

			ActionForward forward = new ActionForward();
			
			if(check == 0) {
			// view page 로 이동 시에는 false 값 지정.
			
			
			request.setAttribute("member_token", kakao_token);
			request.setAttribute("member_name", member_name);
			request.setAttribute("member_email", member_email);
			
			forward.setRedirect(false);
			forward.setPath("member/member_kakao_join.jsp");
			
			}else if(check == 1) {
				out.println("<script>");
				out.println("alert('이미 회원입니다! 로그인을 진행해주세요.')");
				out.println("location.href='member/login.jsp'");
				out.println("</script>");
			}
			
			return forward;
		}

	}

