package com.starReview.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class starDAO {

	Connection con = null;

	PreparedStatement pstmt = null;

	ResultSet rs = null;

	String sql = null;

	// starDAO 클래스를 싱글턴 방식을로 만들어 보자.
	// 1단계 : 싱글턴 방식을 객체를 만들기 위해서는 우선적으로 기본생성자의 접근 제어자를 public이 아닌
	// private 으로 바꾸어 주어야 한다. 즉 외부에서는 직접적으로 기본생성자를 호출하지 못하게 하는 방식이다.

	// 2단계 : starDAO 클래스를 정적(static) 멤버로 선언 해 주어야 한다.

	private static starDAO instance;

	private starDAO() {
	} // 기본 생성자

	// 3단계 : 기본생성자 대신에 싱글턴 객체를 return 해 주는 getInstance() 메서드를 만들어서
	// 해당 getInstance() 메서드를 외부에서 접근할 수 있도록 해주면 됨.
	public static starDAO getInstance() {

		if (instance == null) {
			instance = new starDAO();
		}

		return instance;
	} // getInstance() 메서드 end

	// DB를 연동하는 작업을 진행하는 메서드.
	public void openConn() {
		
		try {
		
		Context init = new InitialContext();
		
		DataSource dataSource = (DataSource) init.lookup("java:comp/env/jdbc/mysql");

		// 2단계 : 오라클 데이터베이스와 연결 작업 진행.
		con = dataSource.getConnection();

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
	
	public int insertStar(starDTO dto) {
	    int result = 0, count = 0;
	    PreparedStatement pstmt1 = null;
	    ResultSet rs1 = null;
	    PreparedStatement pstmt2 = null;
	    ResultSet rs2 = null;
	    
	    try {
	        openConn();
	        String sql = "select max(star_review_idx) from star_review";
	        pstmt1 = con.prepareStatement(sql);
	        rs1 = pstmt1.executeQuery();
	        
	        if (rs1.next()) {
	            count = rs1.getInt(1) + 1;
	        }
	        
	        sql = "insert into star_review values(?,?,?,?,?)";
	        pstmt2 = con.prepareStatement(sql);
	        pstmt2.setInt(1, count);
	        pstmt2.setInt(2, dto.getStore_num());
	        pstmt2.setString(3, dto.getMember_id());
	        pstmt2.setString(4, dto.getReview());
	        pstmt2.setString(5, dto.getStar_count());
	        result = pstmt2.executeUpdate();
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs1 != null) rs1.close();
	            if (rs2 != null) rs2.close();
	            if (pstmt1 != null) pstmt1.close();
	            if (pstmt2 != null) pstmt2.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        closeConn(rs2, pstmt2, con);
	    }
	    return result;
	}


	
	
	public List<starDTO> starList(){
		
		List<starDTO> list = new ArrayList<starDTO>();
		
		try {
			openConn();
			
			sql = "select max(star_review_idx) from star_review";
			
			pstmt = con.prepareStatement(sql);
			
			
			sql = "select * from star_review order by star_review_idx";
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				starDTO dto = new starDTO();
				
				dto.setStar_review_idx(rs.getInt("star_review_idx"));
				dto.setStore_num(rs.getInt("store_num"));
				dto.setMember_id(rs.getString("member_id"));
				dto.setReview(rs.getString("review"));
				dto.setStar_count(rs.getString("star_count"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return list;
		
		
	}
	
	
}