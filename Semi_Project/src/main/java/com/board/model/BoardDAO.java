package com.board.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {

	Connection con = null;

	PreparedStatement pstmt = null;

	ResultSet rs = null;

	String sql = null;

	// MemberDAO 클래스를 싱글턴 방식을로 만들어 보자.
	// 1단계 : 싱글턴 방식을 객체를 만들기 위해서는 우선적으로 기본생성자의 접근 제어자를 public이 아닌
	// private 으로 바꾸어 주어야 한다. 즉 외부에서는 직접적으로 기본생성자를 호출하지 못하게 하는 방식이다.

	// 2단계 : MemberDAO 클래스를 정적(static) 멤버로 선언 해 주어야 한다.

	private static BoardDAO instance;

	private BoardDAO() {
	} // 기본 생성자

	// 3단계 : 기본생성자 대신에 싱글턴 객체를 return 해 주는 getInstance() 메서드를 만들어서
	// 해당 getInstance() 메서드를 외부에서 접근할 수 있도록 해주면 됨.
	public static BoardDAO getInstance() {

		if (instance == null) {
			instance = new BoardDAO();
		}

		return instance;
	} // getInstance() 메서드 end

	// DB를 연동하는 작업을 진행하는 메서드.
	public void openConn() {
		String driver = "com.mysql.cj.jdbc.Driver";

		String user = "web";

		String password = "12345678";

		String url = "jdbc:mysql://semi-project1.crerb4qztgxj.ap-northeast-2.rds.amazonaws.com:3306/semi";

		try {
			// 1단계 : 오라클 드라이버를 메모리로 로딩 작업 진행.
			Class.forName(driver);

			// 2단계 : 오라클 데이터베이스와 연결 작업 진행.
			con = DriverManager.getConnection(url, user, password);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} // openConn() 메서드 end

	// DB에 연결되어 있던 자원 종료하는 메서드.
	public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection con) {

		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}

			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	} // closeConn() 메서드 end

	public int BoardInsert(BoardDTO dto) {

		int count = 0, result = 0;

		openConn();

		try {

			sql = "select max(board_idx) from board";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1) + 1;
			}

			sql = "insert into board values(?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, count);
			pstmt.setString(2, dto.getBoard_title());
			pstmt.setString(3, dto.getBoard_writer());
			pstmt.setString(4, dto.getBoard_content());
			pstmt.setInt(5, dto.getBoard_type());
			pstmt.setString(6, dto.getBoard_image());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}

	public List<BoardDTO> FreeBoardList() {

		openConn();

		BoardDTO dto = null;

		List<BoardDTO> list = new ArrayList<BoardDTO>();

		try {

			sql = "select * from board where board_type = ? order by board_idx";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, "0");

			rs = pstmt.executeQuery();

			while (rs.next()) {

				dto = new BoardDTO();

				dto.setBoard_idx(rs.getInt("board_idx"));
				dto.setBoard_title(rs.getString("board_title"));
				dto.setBoard_writer(rs.getString("board_writer"));
				dto.setBoard_content(rs.getString("board_content"));
				dto.setBoard_image(rs.getString("board_image"));
				dto.setBoard_date(rs.getString("board_date"));
				dto.setBoard_viewcnt(rs.getInt("board_viewcnt"));
				dto.setBoard_type(rs.getInt("board_type"));

				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return list;
	}

	public List<BoardDTO> ReviewBoardList() {

		openConn();

		BoardDTO dto = null;

		List<BoardDTO> list = new ArrayList<BoardDTO>();

		try {

			sql = "select * from board where board_type = ? order by board_idx";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, "1");

			rs = pstmt.executeQuery();

			while (rs.next()) {

				dto = new BoardDTO();

				dto.setBoard_idx(rs.getInt("board_idx"));
				dto.setBoard_title(rs.getString("board_title"));
				dto.setBoard_writer(rs.getString("board_writer"));
				dto.setBoard_content(rs.getString("board_content"));
				dto.setBoard_image(rs.getString("board_image"));
				dto.setBoard_date(rs.getString("board_date"));
				dto.setBoard_viewcnt(rs.getInt("board_viewcnt"));
				dto.setBoard_type(rs.getInt("board_type"));

				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return list;
	}

	public int deleteBoard(int no) {

		int result = 0;

		try {
			openConn();

			
			sql = "delete from board where board_idx = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, no);
			
			result = pstmt.executeUpdate();


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;

	}

	public BoardDTO ContentBoard(int no) {
		BoardDTO dto = new BoardDTO();

		try {
			openConn();

			sql = "select * from board where board_idx = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setBoard_idx(rs.getInt("board_idx"));
				dto.setBoard_title(rs.getString("board_title"));
				dto.setBoard_writer(rs.getString("board_writer"));
				dto.setBoard_content(rs.getString("board_content"));
				dto.setBoard_date(rs.getString("board_date"));
				dto.setBoard_viewcnt(rs.getInt("board_viewcnt"));
				dto.setBoard_type(rs.getInt("board_type"));
				dto.setBoard_image(rs.getString("board_image"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return dto;
	}

	// 게시판 글 수정
	public int boardModifyOk(BoardDTO dto) {

		int result = 0;

		try {
			openConn();

			sql = "select * from board where board_idx = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, dto.getBoard_idx());

			rs = pstmt.executeQuery();

			if (rs.next()) {

				sql = "update board set board_title = ?, board_content = ? where board_idx = ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, dto.getBoard_title());
				pstmt.setString(2, dto.getBoard_content());
				pstmt.setInt(3, dto.getBoard_idx());

				result = pstmt.executeUpdate();
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}

	public int insertBoard(BoardDTO dto) {

		int result = 0, count = 0;

		try {
			openConn();

			sql = "select max(board_idx) from board";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1) + 1;
			}

			sql = "insert into board values(?,?,?,?,default,default,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, count);
			pstmt.setString(2, dto.getBoard_title());
			pstmt.setString(3, dto.getBoard_writer());
			pstmt.setString(4, dto.getBoard_content());
			pstmt.setInt(5, dto.getBoard_type());
			pstmt.setString(6, dto.getBoard_image());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;

	}

}
