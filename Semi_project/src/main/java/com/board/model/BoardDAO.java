package com.board.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.member.model.MemberDAO;

public class BoardDAO {
	   Connection con = null;

	   PreparedStatement pstmt = null;

	   ResultSet rs = null;

	   String sql = null;

	   // MemberDAO 클래스를 싱글턴 방식을로 만들어 보자.
	   // 1단계 : 싱글턴 방식을 객체를 만들기 위해서는 우선적으로 기본생성자의 접근 제어자를 public이 아닌
	   // private 으로 바꾸어 주어야 한다. 즉 외부에서는 직접적으로 기본생성자를 호출하지 못하게 하는 방식이다.

	   // 2단계 : MemberDAO 클래스를 정적(static) 멤버로 선언 해 주어야 한다.

	   private static MemberDAO instance;

	   private MemberDAO() {
	   } // 기본 생성자

	   // 3단계 : 기본생성자 대신에 싱글턴 객체를 return 해 주는 getInstance() 메서드를 만들어서
	   // 해당 getInstance() 메서드를 외부에서 접근할 수 있도록 해주면 됨.
	   public static MemberDAO getInstance() {

	      if (instance == null) {
	         instance = new MemberDAO();
	      }

	      return instance;
	   } // getInstance() 메서드 end

	   // DB를 연동하는 작업을 진행하는 메서드.
	   public void openConn() {
	      String driver = "com.mysql.cj.jdbc.Driver";

	      String url = "jdbc:mysql://localhost/exam?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC";

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
}
