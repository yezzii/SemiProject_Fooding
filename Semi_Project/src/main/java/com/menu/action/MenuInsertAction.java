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

public class MenuInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		MenuDTO dto = new MenuDTO();
		
		
		String saveFolder = 
				"C:\\Users\\rnjsd\\Documents\\GitHub\\Semi_project\\Semi_Project\\src\\main\\webapp\\Main_menu_img";
		
		
		int fileSize = 10 * 1024 * 1024;
		
		MultipartRequest multi = new MultipartRequest(
				request,
				saveFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy()
				);
		
		int main_idx = Integer.parseInt(multi.getParameter("main_idx").trim());
		
		String menu_name = multi.getParameter("menu_name").trim();
		
		int menu_price = Integer.parseInt(multi.getParameter("menu_price").trim());
		
		File menu_img = multi.getFile("menu_img");
		
		if(menu_img != null) {
			String fileName = menu_img.getName();
			
			String homedir = saveFolder;
			
			String reFileName = main_idx+"_"+fileName;
			
			menu_img.renameTo(new File(homedir+"/"+reFileName));
			
			String fileDBName = "Main_menu_img/"+reFileName;
			
			dto.setMenu_img(fileDBName);
		}
		
			dto.setRst_no(main_idx);
			dto.setMenu_name(menu_name);
			dto.setMenu_price(menu_price);
		
			MenuDAO dao = MenuDAO.getInstance();
			
			int check = dao.insertCustomer(dto);
			
			PrintWriter out = response.getWriter();
			
			out.println(check);
			
			return null;
	}

}
