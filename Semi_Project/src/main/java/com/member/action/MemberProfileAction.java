package com.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.boardMain.model.Board_MainDAO;
import com.boardMain.model.Board_MainDTO;
import com.member.model.MemberDAO;
import com.member.model.MemberDTO;
import com.mysql.cj.Session;

public class MemberProfileAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
         throws IOException, ServletException {
      // 요청 : 게시물 전체 목록을 보여달라는 요청.
      // 응답 : DB의 board 테이블 전체 게시물 목록을

      HttpSession session = request.getSession();
      
      String id =   (String)session.getAttribute("id");
      String thumnail = (String)session.getAttribute("Thumnail");
      
      MemberDAO dao = MemberDAO.getInstance();
   
      MemberDTO MemberProfile = dao.getMemberProfile(id);


      request.setAttribute("List", MemberProfile);

      ActionForward forward = new ActionForward();
      
      String storenum = (String)session.getAttribute("storenum");
      
      // 가게정보 수정 액션 페이지
      Board_MainDAO a = Board_MainDAO.getInstance();
      int main_idx = a.getBoardidx(storenum);
      
      
      Board_MainDTO dto  = a.getBoardMainSelect(main_idx);
      request.setAttribute("boardmain", dto);
      request.setAttribute("Thumnail", thumnail);
      
      forward.setPath("account-profile.jsp");
      
      return forward;
   }

}