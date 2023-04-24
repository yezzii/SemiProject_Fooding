package com.boardMain.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.boardMain.model.Board_MainDTO;
import com.member.action.Action;
import com.member.action.ActionForward;
import com.menu.model.MenuDAO;
import com.menu.model.MenuDTO;

public class MenuLoadAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, Exception {
		
		MenuDAO dao = MenuDAO.getInstance();
		
		int Main_idx = Integer.parseInt(request.getParameter("main_idx"));
		
		List<MenuDTO> menuImgList = dao.getMenuImgList(Main_idx);
		
		 JSONArray jsonArray = new JSONArray();
		    for (MenuDTO dto : menuImgList) {
		        JSONObject obj = new JSONObject();
		        obj.put("menu_img", dto.getMenu_img());
		        jsonArray.put(obj);
		    }

		    JSONObject jsonObj = new JSONObject();
		    jsonObj.put("List", jsonArray.toString()); // jsonArray를 문자열로 변환하여 jsonObj에 추가

		    response.setContentType("application/json"); // Content-Type 헤더 설정
		    
		    PrintWriter out = response.getWriter();
		    out.println(jsonObj);
		    System.out.println("메뉴이미지 action 호출" + jsonObj);
		return null;
	}

}