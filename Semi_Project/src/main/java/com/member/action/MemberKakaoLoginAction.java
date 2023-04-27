package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

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
	
	int result = 0;
			
		if(check == 0) {		//회원이 아닌경우 회원가입페이지로 안내
			
			
			session.setAttribute("member_token", kakao_token);
			session.setAttribute("member_name", kakao_name);
			session.setAttribute("member_email", kakao_email);
			session.setAttribute("member_thumnail", kakao_thumnail);
			session.setAttribute("alert", 1);
			System.out.println("카카오회원가입필요메서드");
			
			
			result = 0;
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("result", result);
			jsonObj.put("name", kakao_name);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(jsonObj.toString());
			
			//forward.setRedirect(false);
			
			//forward.setPath("member_kakao_join.jsp");
			
		
		}else if(check == 1) {				//회원인 경우 로그인 페이지로 안내
			
			MemberDTO memdto = dao.KakaoLogin(kakao_token, kakao_name, kakao_email);
			
			if (memdto != null) {
				
				if (memdto.getMember_type() == 0) {
					
					session.setAttribute("id", memdto.getMember_id());
					session.setAttribute("name", memdto.getMember_name());
					session.setAttribute("type", memdto.getMember_type());
					session.setAttribute("Thumnail", kakao_thumnail);
					
					result = 1;
					
					JSONObject jsonObj = new JSONObject();
					 
					jsonObj.put("result", result);
					jsonObj.put("name", memdto.getMember_name());
					
					out.println(jsonObj);
					
				} else if (memdto.getMember_type() == 1) {

					session.setAttribute("id", memdto.getMember_id());
					session.setAttribute("email", memdto.getMember_email());
					session.setAttribute("phone", memdto.getMember_phone());
					session.setAttribute("name", memdto.getMember_name());
					session.setAttribute("type", memdto.getMember_type());
					session.setAttribute("Thumnail", kakao_thumnail);
					
					result = 1;
					
					JSONObject jsonObj = new JSONObject();
					 
					jsonObj.put("result", result);
					jsonObj.put("name", memdto.getMember_name());
					
					out.println(jsonObj);

				} else if (memdto.getMember_type() == 2) {

					session.setAttribute("id", memdto.getMember_id());
					session.setAttribute("email", memdto.getMember_email());
					session.setAttribute("phone", memdto.getMember_phone());
					session.setAttribute("name", memdto.getMember_name());
					session.setAttribute("type", memdto.getMember_type());
					session.setAttribute("storenum", memdto.getMember_storenum());
					session.setAttribute("Thumnail", kakao_thumnail);

					result = 1;
					
					JSONObject jsonObj = new JSONObject();
					 
					jsonObj.put("result", result);
					jsonObj.put("name", memdto.getMember_name());
					
					out.println(jsonObj);
				}else if (memdto.getMember_type() == 3) {

					session.setAttribute("id", memdto.getMember_id());
					session.setAttribute("name", memdto.getMember_name());
					session.setAttribute("type", memdto.getMember_type());
					session.setAttribute("Thumnail", kakao_thumnail);

					result = 1;
					
					JSONObject jsonObj = new JSONObject();
					 
					jsonObj.put("result", result);
					jsonObj.put("name", memdto.getMember_name());
					
					out.println(jsonObj);
				
			}else {
				
				result = -1;
				
				out.println(result + "");
			}
		}					
	}
		out.close();
		return null;
	}
}
