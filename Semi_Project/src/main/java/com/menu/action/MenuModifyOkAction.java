package com.menu.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.action.Action;
import com.member.action.ActionForward;
import com.menu.model.MenuDAO;
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
				"D:\\workspace(WEB)\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp4\\wtpwebapps\\Semi_Project\\Main_menu_img";
		
		int fileSize = 10 * 1024 * 1024;
		
		MultipartRequest multi = new MultipartRequest(
				request,
				saveFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy()
				);
		
		int main_idx = Integer.parseInt(multi.getParameter("no").trim());
		
		String menu_name = multi.getParameter("name").trim();
		
		int menu_price = Integer.parseInt(multi.getParameter("price").trim());
		
		File menu_img = multi.getFile("file");
		
		System.out.println("idx>>>"+main_idx);
		System.out.println("name>>>"+menu_name);
		System.out.println("price>>>"+menu_price);
		System.out.println("img>>>"+menu_img);
		
		if(menu_img != null) {
			String fileName = menu_img.getName();
			
			menu_img.renameTo(new File(saveFolder+"/"+fileName));
			
			dto.setMenu_img("Main_menu_img/"+fileName);
		}
		System.out.println(dto.getMenu_img());
		dto.setMenu_name(menu_name);
		dto.setMenu_price(menu_price);
		dto.setMenu_idx(main_idx);

		MenuDAO dao = MenuDAO.getInstance();
		
		int modify = dao.modifyUpload(dto);
		
		PrintWriter out = response.getWriter();
		
		out.println(modify);
		
		return null;
	}

}
