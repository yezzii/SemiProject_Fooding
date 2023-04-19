package com.boardMain.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.action.Action;
import com.member.action.ActionForward;
import com.member.model.MemberDAO;
import com.member.model.MemberMarkDTO;

public class MarkingInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, Exception {

		HttpSession session = request.getSession();
		
		int Main_idx = Integer.parseInt(request.getParameter("main_idx"));
		String Member_id = (String) session.getAttribute("id");
		
		System.out.println("찜하기 기능 Action 진입 가게번호 : "+Main_idx);
		System.out.println("찜하기 기능 Action 진입 회원아이디 : "+Member_id);
		
		
		MemberMarkDTO dto = new MemberMarkDTO();
		
		dto.setMarked_storeidx(Main_idx);
		dto.setMem_id(Member_id);
		dto.setMark_YN(1);
		
		MemberDAO dao = MemberDAO.getInstance();
		
		int result = dao.addMarking(dto);
		
		PrintWriter out = response.getWriter();
		
		out.println(result + "");
		System.out.println("찜하기 Action > Ajax 보내는 값 : "+result);
		return null;
	}

}
