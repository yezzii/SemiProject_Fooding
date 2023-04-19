package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.MemberDAO;
import com.member.model.MemberMarkDTO;

public class MarkingLoadAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, Exception {

			//1. 세션 아이디로 좋아요를 눌렀는지 확인 
			HttpSession session = request.getSession();
			
			String Member_id = (String) session.getAttribute("id");
			
			
			//2. 데이터가 있다면 해당 회원이 좋아요 한 가게번호 불러오기(List형태로)
			MemberDAO dao = MemberDAO.getInstance();
			
			List<MemberMarkDTO> MList = dao.loadMark(Member_id);
			
			//3. Ajax에 출력값 전송
			
			PrintWriter out = response.getWriter();

			out.println(MList + "");
		
		
		return null;
	}

}
