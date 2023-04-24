package com.boardMain.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.boardMain.model.Board_MainDAO;
import com.boardMain.model.Board_MainDTO;
import com.member.action.Action;
import com.member.action.ActionForward;

public class Board_mainDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, Exception {

		int idx = Integer.parseInt(request.getParameter("main_idx"));
		
		Board_MainDAO dao = Board_MainDAO.getInstance();
		
		Board_MainDTO dto = dao.getBoardMainSelect(idx);
		
		PrintWriter out = response.getWriter();
		
		JSONObject jsonObj = new JSONObject();
		 
		jsonObj.put("idx", dto.getMain_idx());
		jsonObj.put("name", dto.getMain_name());
		jsonObj.put("type", dto.getMain_type());
		jsonObj.put("info", dto.getMain_info());
		jsonObj.put("opentime", dto.getMain_opentime());
		jsonObj.put("endtime", dto.getMain_endtime());
		jsonObj.put("post", dto.getMain_post());
		jsonObj.put("addr", dto.getMain_addr());
		jsonObj.put("detailaddr", dto.getMain_detailaddr());
		jsonObj.put("phone", dto.getMain_phone());
		jsonObj.put("location", dto.getMain_location());
		jsonObj.put("memid", dto.getMain_memid());
		jsonObj.put("storenum", dto.getMain_storenum());
		jsonObj.put("thema", dto.getMain_thema());
		jsonObj.put("img", dto.getMain_img());
		
		out.println(jsonObj);
		
		return null;
	}

}
