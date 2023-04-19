package com.boardMain.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boardMain.model.Board_MainDAO;
import com.boardMain.model.Board_MainDTO;
import com.member.action.Action;
import com.member.action.ActionForward;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Board_mainProfileUpdateOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, Exception {
		// 사업자 마이페이지에서 가게 수정하는 메서드
		
		Board_MainDTO dto = new Board_MainDTO();
		
		String saveFolder = 
				"C:\\Users\\rnjsd\\Documents\\GitHub\\Semi_project\\Semi_Project\\src\\main\\webapp\\Board_Main_img";
		
		int fileSize = 10 * 1024 * 1024;
		
		MultipartRequest multi = new MultipartRequest(
				request,
				saveFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy()
				);
		int main_idx = Integer.parseInt(multi.getParameter("main_idx").trim());
		String main_type = multi.getParameter("main_type").trim();
		String main_thema = multi.getParameter("main_thema").trim();
		String main_name = multi.getParameter("main_name").trim();
		String main_info = multi.getParameter("main_info").trim();
		String main_opentime = multi.getParameter("main_opentime").trim();
		String main_endtime = multi.getParameter("main_endtime").trim();
		String main_post = multi.getParameter("main_post").trim();
		String main_addr = multi.getParameter("main_addr").trim();
		String main_detailaddr = multi.getParameter("main_detailaddr").trim();
		String main_phone = multi.getParameter("main_phone").trim();
		
		File main_file = multi.getFile("main_img");
	
		if(main_file != null) {
			String fileName = main_file.getName();
			
			String homedir = saveFolder;
			
			String reFileName = main_name+"_"+fileName;
			
			main_file.renameTo(new File(homedir+"/"+reFileName));
			
			String fileDBName = "Board_Main_img/"+reFileName;
			
			dto.setMain_img(fileDBName);
		}
		
		dto.setMain_idx(main_idx);
		dto.setMain_name(main_name);
		dto.setMain_type(main_type);
		dto.setMain_info(main_info);
		dto.setMain_opentime(main_opentime);
		dto.setMain_endtime(main_endtime);
		dto.setMain_post(main_post);
		dto.setMain_addr(main_addr);
		dto.setMain_detailaddr(main_detailaddr);
		dto.setMain_phone(main_phone);
		dto.setMain_thema(main_thema);
		
		Board_MainDAO dao = Board_MainDAO.getInstance();
		
		int check = dao.updateBoardMain(dto);
		
		PrintWriter out = response.getWriter();
		if(check > 0) {
			out.println("<script>");
			out.println("alert('가게 정보 수정 성공!!!')");
			out.println("location.href='member_profile.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('가게 정보 수정 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return null;
	}

}
