package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;

public class MemberJoinChkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		// DB에 있는 아이디와 회원가입창에 쓴 아이디가 중복이 되는지 
		// 확인하는 비지니스 로직.
		MemberDAO dao = MemberDAO.getInstance();
		//한글처리 작업 진행.
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html charset=utf-8");
		
		String member_id = request.getParameter("paramId").trim();
		System.out.println(member_id);
		
	
		
		int result = dao.idCheck(member_id);
		
        
        // 성공여부 확인 : 개발자용(서버콘솔)
        if (result == 0) { //id 중복
            System.out.println("Action 내부) 이미 존재하는 아이디입니다.");
        } else if (result == 1) {
            System.out.println("Action 내부) 사용 가능한 아이디입니다.");
        }
		
        PrintWriter out = response.getWriter();
        
        out.write(result + "");
        
		
		return null;
	}

}
