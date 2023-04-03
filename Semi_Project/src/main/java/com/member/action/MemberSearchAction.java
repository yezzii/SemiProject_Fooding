package com.member.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

public class MemberSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// 검색 폼 페이지에서 넘어온 데이터를 가지고 검색어에 해당하는 게시길들을 board 테이블에서 조회하여 view page로 이동시키는 비지니스 로직
				// ==> 동시에 페이징 작업 진행.
				String field = request.getParameter("field").trim();
				String keyword = request.getParameter("keyword").trim();
				
				//페이징 처리 작업 진행
				
				//한 페이지당 보여질 게시물의 수
				int rowsize = 10;
				
				int block = 3;
				
				int totalMember = 0;
				
				int allPage = 0;
				
				int page = 1;
				
				if(request.getParameter("page")!= null) {
					page = Integer.parseInt(request.getParameter("page").trim());
				}
				
				int startNo = (page * rowsize) - (rowsize-1);
				
				int endNo = (page * rowsize);
				
				int StartBlock = (((page-1)/block) * block) +1;
				
				int endBlock = (((page-1)/ block)*block)+block;
				
				MemberDAO dao = MemberDAO.getInstance();
				
				// 검색 게시물의 수 확인
				totalMember = dao.searchListCount(field,keyword);
				
				allPage = (int)Math.ceil(totalMember / (double)rowsize);
				
				if(endBlock > allPage) {
					endBlock = allPage;
				}
				
				
				List<MemberDTO>searchList = dao.getSearchMemberList(field,keyword,page,rowsize);
				
				request.setAttribute("page", page);
				 request.setAttribute("rowsize", rowsize);
				 request.setAttribute("block", block);
				 request.setAttribute("totalMember", totalMember);
				 request.setAttribute("allPage", allPage);
				 request.setAttribute("startNo", startNo);
				 request.setAttribute("endNo", endNo);
				 request.setAttribute("StartBlock", StartBlock);
				 request.setAttribute("endBlock", endBlock);
				 request.setAttribute("field", field);
				 request.setAttribute("keyword", keyword);
				 request.setAttribute("List", searchList);
				

					ActionForward forward = new ActionForward();
					
					forward.setRedirect(false);
					forward.setPath("member/member_search.jsp");
					
					return forward;
	}

}
