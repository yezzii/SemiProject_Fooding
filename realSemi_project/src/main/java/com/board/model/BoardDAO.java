package com.board.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class BoardDAO {
	
	   PreparedStatement pstmt = null;
	   
	   Connection con = null;

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

	      String url = "jdbc:mysql://localhost/semi?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC";

	      String user = "web";

	      String password = "1234";

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
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }

	   } // closeConn() 메서드 end

	public List<Board_mainDTO> getBoardMainList() {
		
		List<Board_mainDTO> list = new ArrayList<Board_mainDTO>();
		
		openConn();
		
		try {
			sql = "select * from board_main";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board_mainDTO dto = new Board_mainDTO();
				
				dto.setMain_idx(rs.getInt("main_idx"));
				dto.setMain_addr(rs.getString("main_addr"));
				dto.setMain_name(rs.getString("main_name"));
				dto.setMain_location(rs.getString("main_location"));
				dto.setMain_content(rs.getString("main_content"));
				
				list.add(dto);
			}
			
<<<<<<< Updated upstream
			
		} catch (SQLException e) {
=======
				
		}catch (SQLException e) {
			// TODO Auto-generated catch block
>>>>>>> Stashed changes
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		return list;
	}

	
	//보드 게시글 삭제 메서드
	public int deleteBoard(int no, String pwd) {

		int result = 0;
		
		try {
			openConn();
			
			sql = "select * from board where board_no = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(pwd.equals(rs.getString("board_pwd"))) {
					sql = "delete from board where board_no = ?";
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, no);
					
					result = pstmt.executeUpdate();
				}else {   // 비밀번호가 틀린 경우
					result = -1;
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
	}/* deleteBoard end */

	
	
	// board 테이블의 글번호에 해당하는 게시글을 
	// 수정하는 메서드.
	public void updateSequence(int no) {
		try {
			openConn();
			
			sql = "update board set board_no = board_no - 1 where board_no > ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
	}  // updateSequence() 메서드 end  

	public int Insert_main(Board_mainDTO dto) {
		
		int count = 0, result = 0;
		
		openConn();
		
		try {
			
			sql = "select max(main_idx) from board_main";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			sql = "insert into board_main(main_idx,main_addr,main_name,main_location,main_content) values(?,?,?,?,?)";
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, count);
			pstmt.setString(2, dto.getMain_addr());
			pstmt.setString(3, dto.getMain_name());
			pstmt.setString(4, dto.getMain_location());
			pstmt.setString(5, dto.getMain_content());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
	}
	   
}
