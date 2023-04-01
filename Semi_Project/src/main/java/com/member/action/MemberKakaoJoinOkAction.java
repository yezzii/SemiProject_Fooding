package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

public class MemberKakaoJoinOkAction implements Action {

@Override
public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException {
	

			String member_id = request.getParameter("member_id").trim();
			String member_name = request.getParameter("member_name").trim();
			String member_email = request.getParameter("member_email").trim();
			String member_pwd = request.getParameter("member_pwd").trim();
			String member_phone = request.getParameter("member_phone").trim();
			
		
			/*
			 * int member_type2 =
			 * Integer.parseInt(request.getParameter("member_type2").trim());
			 */
			MemberDTO dto = new MemberDTO();

			dto.setMember_id(member_id);
			dto.setMember_name(member_name);
			dto.setMember_email(member_email);
			dto.setMember_pwd(member_pwd);
			dto.setMember_phone(member_phone);
			dto.setMember_type(3);
			/* dto.setMember_type(member_type2); */

			MemberDAO dao = MemberDAO.getInstance();

			int result = dao.MemberKakaoJoin(dto);

			PrintWriter out = response.getWriter();

			if(result > 0) {
				out.println("<script>");
				out.println("alert('카카오 회원가입이 완료되었습니다!"+dto.getMember_name()+"님 이메일아이디로 로그인을 진행해주세요.')");
				out.println("location.href='main.jsp'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('회원가입에 실패했습니다. 이미 가입된 회원이거나 오류가 있습니다.')");
				out.println("history.back()");
				out.println("</script>");
			}

			return null;
		}

	}

