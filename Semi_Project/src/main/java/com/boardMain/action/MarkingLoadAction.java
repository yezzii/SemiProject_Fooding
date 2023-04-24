package com.boardMain.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import com.member.action.Action;
import com.member.action.ActionForward;
import com.member.model.MemberDAO;
import com.member.model.MemberMarkDTO;

public class MarkingLoadAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, Exception {

		  // 1. 세션 아이디로 좋아요를 눌렀는지 확인
	    HttpSession session = request.getSession();

	    String Member_id = (String) session.getAttribute("id");

	    // 2. 데이터가 있다면 해당 회원이 좋아요 한 가게번호 불러오기(List형태로)
	    MemberDAO dao = MemberDAO.getInstance();

	    List<MemberMarkDTO> MList = dao.loadMark(Member_id);
	    
	    System.out.println(MList);
	    
	    // 3. Ajax에 출력값 전송
	    JSONArray jsonArray = new JSONArray();
	    for (MemberMarkDTO dto : MList) {
	        JSONObject obj = new JSONObject();
	        obj.put("idx", dto.getIdx());
	        obj.put("mem_id", dto.getMem_id());
	        obj.put("marked_storeidx", dto.getMarked_storeidx());
	        jsonArray.put(obj);
	    }

	    JSONObject jsonObj = new JSONObject();
	    jsonObj.put("MList", jsonArray.toString()); // jsonArray를 문자열로 변환하여 jsonObj에 추가

	    response.setContentType("application/json"); // Content-Type 헤더 설정
	    
	    PrintWriter out = response.getWriter();
	    out.println(jsonObj);

	    return null;
	}

}
