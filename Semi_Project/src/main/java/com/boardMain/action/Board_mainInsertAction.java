package com.boardMain.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.boardMain.model.Board_MainDAO;
import com.boardMain.model.Board_MainDTO;
import com.member.action.Action;
import com.member.action.ActionForward;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Board_mainInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		Board_MainDTO dto = new Board_MainDTO();
		
		String saveFolder = "C:\\Users\\ll001\\Documents\\GitHub\\Semi_project\\Semi_Project\\src\\main\\webapp\\Board_Main_img";
		
		int fileSize = 10*1024*1024; //10MB
		
		MultipartRequest multi = new MultipartRequest(
				request, 
				saveFolder, 
				fileSize, 
				"UTF-8",
				new DefaultFileRenamePolicy()
				);
		
		// board_signUp에서 넘어온 데이터를 등록시키는 비지니스 로직.
		
		HttpSession session = request.getSession(true);
			
			
		String main_name = multi.getParameter("main_name");
		String main_type = multi.getParameter("main_type").trim();
		String main_info = multi.getParameter("main_info").trim();
		String main_opentime = multi.getParameter("main_opentime").trim();
		String main_endtime = multi.getParameter("main_endtime").trim();
		String main_post = multi.getParameter("main_post").trim();
		String main_addr = multi.getParameter("main_addr").trim();
		String main_detailaddr = multi.getParameter("main_detailaddr").trim();
		String main_phone = multi.getParameter("main_phone").trim();
		String main_thema = multi.getParameter("main_thema").trim();
		
		File main_img = multi.getFile("main_img");
		
		if(main_img != null) {
			String fileName = main_img.getName();
			System.out.println(fileName);
			
			
			
			String homedir = saveFolder;
			
			
			
			
			
			String reFileName = main_name+"_"+fileName;
			
			main_img.renameTo(new File(homedir+"/"+reFileName));
			
			String fileDBName = 
					"/" + reFileName;
			
			dto.setMain_img(fileDBName);
		}
	
		
		String id =(String) session.getAttribute("id");
	
		
		dto.setMain_name(main_name);
		dto.setMain_type(main_type);
		dto.setMain_info(main_info);
		dto.setMain_opentime(main_opentime);
		dto.setMain_endtime(main_endtime);
		dto.setMain_post(main_post);
		dto.setMain_addr(main_addr);
		dto.setMain_detailaddr(main_detailaddr);
		dto.setMain_phone(main_phone);
		dto.setMain_memid(id);
		dto.setMain_thema(main_thema);
		
		Board_MainDAO dao = Board_MainDAO.getInstance();
		
		int res = dao.insertBoard_Main(dto);

		PrintWriter out = response.getWriter();
		
		if(res>0) {
			out.println("<script>");
			out.println("alert('등록완료')");
			out.println("location.href='board_main_list.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		return null;
	}

}
