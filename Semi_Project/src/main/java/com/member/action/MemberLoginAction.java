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


public class MemberLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException ,ServletException {

		response.setContentType("application/json;charset=UTF-8");
		//한글처리 작업 진행.
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		
		MemberDAO dao = MemberDAO.getInstance();
		
		String id = request.getParameter("id");
		String Raw_pwd = request.getParameter("pwd");
		String pwd = Encryption.encodeSha256(Raw_pwd);
		String basic_thumnail = "main_img/basic_thumnail.png";
		
		int result = 0;
		
		HttpSession session = request.getSession();

		PrintWriter out = response.getWriter();

		session = request.getSession(true);

		MemberDTO memdto = dao.MemberLogin(id, pwd);

		if (memdto != null) {
			
			if (memdto.getMember_type() == 0) {
				
				session.setAttribute("id", memdto.getMember_id());
				session.setAttribute("email", memdto.getMember_email());
				session.setAttribute("phone", memdto.getMember_phone());
				session.setAttribute("name", memdto.getMember_name());
				session.setAttribute("type", memdto.getMember_type());
				session.setAttribute("date", memdto.getMember_joindate());
				session.setAttribute("img", memdto.getMember_image());
				session.setAttribute("Thumnail", basic_thumnail);
				
				result = 1;
				
				JSONObject jsonObj = new JSONObject();
				 
				jsonObj.put("result", result);
				jsonObj.put("name", memdto.getMember_name());
				
				out.println(jsonObj);
				
				
			} else if (memdto.getMember_type() == 1 || memdto.getMember_type() == 3) {

				session.setAttribute("id", memdto.getMember_id());
				session.setAttribute("email", memdto.getMember_email());
				session.setAttribute("phone", memdto.getMember_phone());
				session.setAttribute("name", memdto.getMember_name());
				session.setAttribute("type", memdto.getMember_type());
				session.setAttribute("date", memdto.getMember_joindate());
				session.setAttribute("img", memdto.getMember_image());
				session.setAttribute("Thumnail", basic_thumnail);
				
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
				session.setAttribute("date", memdto.getMember_joindate());
				session.setAttribute("img", memdto.getMember_image());
				session.setAttribute("Thumnail", basic_thumnail);
				

				result = 1;
				
				JSONObject jsonObj = new JSONObject();
				 
				jsonObj.put("result", result);
				jsonObj.put("name", memdto.getMember_name());
				
				out.println(jsonObj);

			}
		}else {
			
			result = -1;
			
			out.println(result + "");
			
		}
		
		out.close();

		return null;
	}

}
