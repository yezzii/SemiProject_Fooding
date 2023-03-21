package com.member.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
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
         e.printStackTrace();
      }

   } // closeConn() 메서드 end
   
   
//delete member 메서드
	public int DeleteMember(int num) {
		
		int result = 0;
		
		
		try {
			
			openConn();
		
			sql = "delete from member where member_id = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
	}//delete member 메서드 End
	
	
	public List<MemberDTO> getMemberList() {
		
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		
		openConn();
	
		
		try {
			sql = "select * from member order by member_id";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				MemberDTO dto = new MemberDTO();
				
				dto.setMember_id(rs.getString("member_id"));
				dto.setMember_name(rs.getString("member_name"));
				dto.setMember_pwd(rs.getString("member_pwd"));
				dto.setMember_email(rs.getString("member_email"));
				dto.setMember_phone(rs.getString("member_phone"));
				dto.setMember_accout(rs.getInt("member_account"));
				
				list.add(dto);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return list;
		
		} // member_list() end
	
	public int insertMember(MemberDTO dto) {
		int result=0 ;
		
		
		try {
			sql="insert into member values(?,?,?,?,?,sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getMember_email());
			pstmt.setString(2, dto.getMember_id());
			pstmt.setString(3, dto.getMember_name());
			pstmt.setString(4, dto.getMember_phone());
			pstmt.setString(5, dto.getMember_pwd());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}// insertMember()메서드 end
	
}
