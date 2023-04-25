package com.menu.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class MenuDAO {

	Connection con = null;

	PreparedStatement pstmt = null;

	ResultSet rs = null;

	String sql = null;

	// MemberDAO 클래스를 싱글턴 방식을로 만들어 보자.
	// 1단계 : 싱글턴 방식을 객체를 만들기 위해서는 우선적으로 기본생성자의 접근 제어자를 public이 아닌
	// private 으로 바꾸어 주어야 한다. 즉 외부에서는 직접적으로 기본생성자를 호출하지 못하게 하는 방식이다.

	// 2단계 : MemberDAO 클래스를 정적(static) 멤버로 선언 해 주어야 한다.

	private static MenuDAO instance;

	private MenuDAO() {
	} // 기본 생성자

	// 3단계 : 기본생성자 대신에 싱글턴 객체를 return 해 주는 getInstance() 메서드를 만들어서
	// 해당 getInstance() 메서드를 외부에서 접근할 수 있도록 해주면 됨.
	public static MenuDAO getInstance() {

		if (instance == null) {
			instance = new MenuDAO();
		}

		return instance;
	} // getInstance() 메서드 end

	// DB를 연동하는 작업을 진행하는 메서드.
	public void openConn() {
		String driver = "com.mysql.cj.jdbc.Driver";

		String user = "web";

		String password = "tpalvmfhwprxm1010";

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

	public String getMenuList(int no) {
		
		String result = "";
		
		try {
			openConn();
			
			sql = "select * from main_menu where rst_no = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			result += "<main_menus>";
			
			while(rs.next()) {
				result += "<main_menu>";
				result += "<menu_no>"+rs.getInt("menu_no")+"</menu_no>";
				result += "<rst_no>"+rs.getInt("rst_no")+"</rst_no>";
				result += "<menu_name>"+rs.getString("menu_name")+"</menu_name>";
				result += "<menu_price>"+rs.getInt("menu_price")+"</menu_price>";
				result += "<menu_img>"+rs.getString("menu_img")+"</menu_img>";
				result += "<menu_idx>"+rs.getString("menu_idx")+"</menu_idx>";
				result += "</main_menu>";
			}
			result += "</main_menus>";
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}
	//입력폼에서 넘어온 데이터들을 DB에 저장하는 메서드
	public int insertMenu(MenuDTO dto) {
		int result = 0, count =0,count2=0;
		
		try {
			openConn();
			
			sql = "select max(menu_no) from main_menu";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1)+1;
			}
			
			sql = "select max(menu_idx) from main_menu where rst_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getRst_no());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count2 = rs.getInt(1)+1;
			}
			
			
			sql = "insert into main_menu values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, count);
			pstmt.setInt(2,dto.getRst_no());
			pstmt.setString(3, dto.getMenu_name());
			pstmt.setInt(4,dto.getMenu_price());
			pstmt.setString(5, dto.getMenu_img());
			pstmt.setInt(6, count2);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}

	public int deleteMenu(int menu_idx,int rst_no) {
		int result = 0;
		try {
			openConn();

			
			// 메뉴 삭제
			sql = "delete from main_menu where menu_idx = ? and rst_no = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1,menu_idx);
			
			pstmt.setInt(2,rst_no);
			
			System.out.println("rst_no >>>"+rst_no);
			
			result = pstmt.executeUpdate();
			
		  sql = "update main_menu set menu_idx = menu_idx -1 where menu_idx > ? and rst_no = ?" ;
		  
		  pstmt = con.prepareStatement(sql);
		  
		  pstmt.setInt(1,menu_idx);
			
		  pstmt.setInt(2,rst_no);
		  
		  result = pstmt.executeUpdate();
			 
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}//deleteMenu 메서드 end

	public int modifyUpload(MenuDTO dto) {
		// 메뉴를 수정하는 메서드
		int result = 0;
		
		try {
			openConn();
			
			sql = "select * from main_menu where menu_idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getMenu_idx());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(dto.getMenu_img() == null) {
					sql = "update main_menu set menu_name = ?,menu_price = ? where menu_idx = ?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, dto.getMenu_name());
					pstmt.setInt(2, dto.getMenu_price());
					pstmt.setInt(3, dto.getMenu_idx());
					
				}else {
					sql = "update main_menu set menu_name =?,menu_price=?,menu_img = ? where menu_idx = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, dto.getMenu_name());
					pstmt.setInt(2, dto.getMenu_price());
					pstmt.setString(3,dto.getMenu_img());
					pstmt.setInt(4, dto.getMenu_idx());
				}
				result = pstmt.executeUpdate();
				System.out.println(dto.getMenu_img());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}
	
	
}
