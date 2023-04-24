package com.boardMain.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.boardMain.model.Board_MainDAO;
import com.boardMain.model.Board_MainDTO;
import com.member.action.Action;
import com.member.action.ActionForward;

public class CardLoadAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, Exception {
		
		System.out.println("card_load 진입");
		
		int rowsize = 8;
		int block = 5;
		int totalBoard_main = 0;
		int allpage = 0;
		int page = 0;
		
		if(request.getParameter("page")!= null) {
			page = Integer.parseInt(request.getParameter("page").trim());
		}else {
			page = 1;
		}
		
		if(page==0) {
			page = 1;
		}
		
		
		int startNo = (page * rowsize) - (rowsize - 1);
		
		int endNo = (page * rowsize);
		
		// 해당 페이지에서 시작 블럭
		int startBlock = (((page - 1) / block) * block) + 1;
		// 해당 페이지에서 마지막 블럭
		int endBlock = (((page - 1) / block) * block) + block;
		
		Board_MainDAO dao = Board_MainDAO.getInstance();
		
		totalBoard_main = dao.getBoardCount();
		
		allpage = (int) Math.ceil(totalBoard_main / (double) rowsize);

		if (endBlock > allpage) {
			endBlock = allpage;
		}
		
		List<Board_MainDTO> MList = dao.getBoardMainList(page, rowsize);
		request.setAttribute("List", MList);
		
		
		 JSONArray jsonArray = new JSONArray();
		    for (Board_MainDTO dto : MList) {
		        JSONObject obj = new JSONObject();
		        obj.put("Main_idx", dto.getMain_idx());
		        obj.put("Main_name", dto.getMain_name());
		        obj.put("Main_info", dto.getMain_info());
		        obj.put("Main_type", dto.getMain_type());
		        obj.put("Main_opentime", dto.getMain_opentime());
		        obj.put("Main_endtime", dto.getMain_endtime());
		        obj.put("Main_post", dto.getMain_post());
		        obj.put("Main_addr", dto.getMain_addr());
		        obj.put("Main_detailaddr", dto.getMain_detailaddr());
		        obj.put("Main_phone", dto.getMain_phone());
		        obj.put("Main_location", dto.getMain_location());
		        obj.put("Main_memid", dto.getMain_memid());
		        obj.put("Main_storenum", dto.getMain_storenum());
		        obj.put("Main_thema", dto.getMain_thema());
		        obj.put("Main_img", dto.getMain_img());
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
