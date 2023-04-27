package com.member.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import sha256.Encryption;

public class MemberProfileUpdateOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		MemberDTO dto = new MemberDTO();
		
		String saveFolder = 
				"D:\\workspace(WEB)\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp4\\wtpwebapps\\Semi_Project\\Member_profile";
		
		int fileSize = 10 * 1024 * 1024;
		
		
		
		MultipartRequest multi = new MultipartRequest(
				request,
				saveFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy()
				);
		
		HttpSession session = request.getSession();
		
		String member_id = (String) session.getAttribute("id");
		String member_name = (String) session.getAttribute("name");
		
		String Raw_pwd = multi.getParameter("member_pwd");	
		String member_pwd = Encryption.encodeSha256(Raw_pwd);
		
		String member_email = multi.getParameter("member_email");		
		String member_phone = multi.getParameter("member_phone");
		
		File member_image = multi.getFile("fileProfile");
		
		if(member_image != null) {
			
			String fileName = member_image.getName();
			System.out.println("fileName");
			
			String homedir = saveFolder;
			
			String reFileName = member_id +"_"+ fileName;
		
			member_image.renameTo(new File(homedir+"/"+reFileName));
		
			String fileDBName = "Member_profile/"+reFileName;
		
			dto.setMember_image(fileDBName);
		}
		
		
		dto.setMember_name(member_name);
		dto.setMember_id(member_id);
		dto.setMember_pwd(member_pwd);
		dto.setMember_email(member_email);
		dto.setMember_phone(member_phone);
	
		
		MemberDAO dao = MemberDAO.getInstance();
		
		int check = dao.updateProfileMember(dto);
		
		PrintWriter out = response.getWriter();
			
			if(check > 0) {
				out.println("<script>");
				out.println("alert('회원 정보 수정 완료')");
				out.println("location.href='member_profile.do?uno="+member_id+"'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('회원 정보 수정 실패~~~')");
				out.println("history.back()");
				out.println("</script>");
			}
		return null;
	}

}
