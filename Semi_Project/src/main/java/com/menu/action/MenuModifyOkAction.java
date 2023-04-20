package com.menu.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.action.Action;
import com.member.action.ActionForward;
import com.menu.model.MenuDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MenuModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, Exception {
		// 메뉴 수정하는 액션 페이지
		
		MenuDTO dto = new MenuDTO();
		
		String saveFolder = 
				"C:\\\\Users\\\\rnjsd\\\\Desktop\\\\NCS\\\\project_workspace(semi)\\\\.metadata\\\\.plugins\\\\org.eclipse.wst.server.core\\\\tmp3\\\\wtpwebapps\\\\Semi_Project\\\\Main_menu_img";
		
		int fileSize = 10 * 1024 * 1024;
		
		MultipartRequest multi = new MultipartRequest(
				request,
				saveFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy()
				);
				
		String menu_name = multi.getParameter("menu_name").trim();
		
		int menu_price = Integer.parseInt(multi.getParameter("menu_price").trim());
		
		File menu_img = multi.getFile("menu_img");
		
		if(menu_img != null) {
			String fileName = menu_img.getName();
			
			String homedir = saveFolder;
			
			String reFileName = fileName;
			
			menu_img.renameTo(new File(homedir+"/"+reFileName));
			
			String menuDBName =
		}
		
		return null;
	}

}
