package com.board.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;
import com.board.model.BoardDTO;
import com.member.action.Action;
import com.member.action.ActionForward;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class BoardInsertOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		
		String saveFolder = "C:\\Users\\Ace\\git\\Semi_project\\Semi_Project\\src\\main\\webapp\\photo";

		int fileSize = 10*1024 *1024;

		MultipartRequest multi = new MultipartRequest(request, 
				saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		String writer = multi.getParameter("board_writer");
		String title = multi.getParameter("board_title");
		String content = multi.getParameter("board_content");
		String image = multi.getFilesystemName("board_image");
		int type =Integer.parseInt(multi.getParameter("board_type"));
		
		BoardDTO dto = new BoardDTO();
		
		dto.setBoard_writer(writer);
		dto.setBoard_title(title);
		dto.setBoard_content(content);
		dto.setBoard_image(image);
		System.out.println("이미지 >>>."+image);
		dto.setBoard_type(type);
		
		BoardDAO dao = BoardDAO.getInstance();
		
		int check = dao.insertBoard(dto);
		
		ActionForward forward = new ActionForward();
	      if(check >0) {
	    	  
	     
	      forward.setRedirect(true);
	      if(type == 0) {
	         forward.setPath("free_board.do");
	      } else if (type == 1) {
	         forward.setPath("review_board.do");
	      }
	      return forward;
	      }else {
	    	  return null;
	    			  
	      }
	   }

}
