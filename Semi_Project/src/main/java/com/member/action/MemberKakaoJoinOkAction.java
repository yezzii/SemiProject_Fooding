package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

import sha256.Encryption;

public class MemberKakaoJoinOkAction implements Action {

@Override
public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException {
	

			String member_id = request.getParameter("member_id").trim();
			String kakao_token =request.getParameter("member_token").trim();
			String member_name = request.getParameter("member_name").trim();
			String member_email = request.getParameter("member_email").trim();
			String Raw_pwd = request.getParameter("member_pwd").trim();
			String member_pwd = Encryption.encodeSha256(Raw_pwd);
			int member_type = Integer.parseInt(request.getParameter("member_type").trim());
			String member_phone = request.getParameter("member_phone").trim();
			String Store_num = request.getParameter("company_storenum").trim();
			
			System.out.println("member_id >>>>"+member_id);
			System.out.println("member_name>>>>"+member_name);
			System.out.println("Raw_pwd>>>>"+Raw_pwd);
			System.out.println("kakao_token>>>>"+kakao_token);
			System.out.println("member_email>>>>"+member_email);
			System.out.println("member_type>>>>"+member_type);
			System.out.println("member_type>>>>"+member_phone);
			System.out.println("StoreNum>>>>"+Store_num);
			
			MemberDTO dto = new MemberDTO();

			dto.setMember_id(member_id);
			dto.setMember_name(member_name);
			dto.setMember_email(member_email);
			dto.setMember_pwd(member_pwd);
			dto.setMember_phone(member_phone);
			dto.setMember_token(kakao_token);
			dto.setMember_type(member_type);
			dto.setMember_storenum(Store_num);

			MemberDAO dao = MemberDAO.getInstance();

			int result = dao.MemberKakaoJoin(dto);

			PrintWriter out = response.getWriter();

			if(result > 0) {
				out.println("<script>");
				out.println("alert('카카오 회원가입이 완료되었습니다! "+dto.getMember_name()+"님 로그인을 진행해주세요.')");
				out.println("location.href='index.jsp'");
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

