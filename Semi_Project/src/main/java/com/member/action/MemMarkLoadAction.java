 package com.member.action;

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

import com.boardMain.model.Board_MainDTO;
import com.member.action.Action;
import com.member.action.ActionForward;
import com.member.model.MemberDAO;
import com.member.model.MemberMarkDTO;

public class MemMarkLoadAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, Exception {

		  // 1. 세션 아이디로 좋아요를 눌렀는지 확인
	    HttpSession session = request.getSession();

	    String Member_id = (String) session.getAttribute("id");

	    // 2. 데이터가 있다면 해당 회원이 좋아요 한 가게번호 불러오기(List형태로)
	    MemberDAO dao = MemberDAO.getInstance();
	    
	    System.out.println("찜레스토랑 아이디 >>"+Member_id);
	    
	    List<Board_MainDTO> List = dao.loadMarkRst(Member_id);
	    
	    System.out.println(List);
	    
	    // 3. Ajax에 출력값 전송
	    JSONArray jsonArray = new JSONArray();
	    for (Board_MainDTO dto : List) {
	        JSONObject obj = new JSONObject();
	        obj.put("name", dto.getMain_name());
	        obj.put("info", dto.getMain_info());
	        obj.put("addr", dto.getMain_addr());
	        obj.put("detailAddr", dto.getMain_detailaddr());
	        obj.put("marked_storeidx", dto.getMain_idx());
	        obj.put("main_img", dto.getMain_img());
	        jsonArray.put(obj);
	    }

	    JSONObject jsonObj = new JSONObject();
	    jsonObj.put("List", jsonArray.toString()); // jsonArray를 문자열로 변환하여 jsonObj에 추가

	    response.setContentType("application/json"); // Content-Type 헤더 설정
	    
	    PrintWriter out = response.getWriter();
	    out.println(jsonObj);

	    return null;
	}

}
