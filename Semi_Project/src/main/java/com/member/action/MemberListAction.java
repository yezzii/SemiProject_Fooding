package com.member.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

public class MemberListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// 요청 : 게시물 전체 목록을 보여달라는 요청.
		// 응답 : DB의 board 테이블 전체 게시물 목록을
		// 조회하여 view page로 이동시키는 비지니스 로직.
		// 비지니스 로직 진행 시 페이징 처리 작업까지 동시 진행.

		// 페이징 처리 작업진행.
		// 한 페이지당 보여질 게시물의 수
		int rowsize = 10;
		// 아래에 보여질 페이지 최대 블럭 수
		int block = 5;
		// DB 상의 게시물의 전체 수
		int totalMember = 0;
		// 전체 페이지 수
		int allpage = 0;
		// 현재 페이지 변수
		int page = 0;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page").trim());
		} else {
			// 처음으로 "전체 게시물 목록" a 태그를 클릭한 경우
			page = 1;
		}

		// 해당 페이지에서 시작 번호
		int startNo = (page * rowsize) - (rowsize - 1);
		// 해당 페이지에서 끝 번호
		int endNo = (page * rowsize);

		// 해당 페이지에서 시작 블럭
		int startBlock = (((page - 1) / block) * block) + 1;
		// 해당 페이지에서 마지막 블럭
		int endBlock = (((page - 1) / block) * block) + block;

		MemberDAO dao = MemberDAO.getInstance();

		// 전체 게시물의 수를 확인하는 메서드 호출.
		totalMember = dao.getMemberCount();

		// 전체 게시물의 수를 한 페이지당 보여질 게시물의 수로
		// 나누어 주어야 함.
		// 이 과정을 거치면 전체 페이지수가 나오게 됨.
		// 이 떄 전체 페이지 수가 나올 떄 나머지가 있으면
		// 무조건 전체 페이지 수를 하나 올려 주어야 함.
		allpage = (int) Math.ceil(totalMember / (double) rowsize);

		if (endBlock > allpage) {
			endBlock = allpage;
		}

		// 전체 회원의 수를 확인하는 메서드.
		List<MemberDTO> MemberList = dao.getMemberList(page, rowsize);

		// 지금까지 페이징 처리 시 작업했던 모든 데이터들을 view page로 이동시키자
		request.setAttribute("page", page);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("totalMember", totalMember);
		request.setAttribute("allPage", allpage);
		request.setAttribute("startNo", startNo);
		request.setAttribute("endNo", endNo);
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);

		request.setAttribute("List", MemberList);

		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("member/MemberList.jsp");
		
		return forward;
	}

}
