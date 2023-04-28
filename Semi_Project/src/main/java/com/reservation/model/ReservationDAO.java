package com.reservation.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReservationDAO {

	Connection con = null;

	PreparedStatement pstmt = null;

	ResultSet rs = null;

	String sql = null;

	// MemberDAO 클래스를 싱글턴 방식을로 만들어 보자.
	// 1단계 : 싱글턴 방식을 객체를 만들기 위해서는 우선적으로 기본생성자의 접근 제어자를 public이 아닌
	// private 으로 바꾸어 주어야 한다. 즉 외부에서는 직접적으로 기본생성자를 호출하지 못하게 하는 방식이다.

	// 2단계 : MemberDAO 클래스를 정적(static) 멤버로 선언 해 주어야 한다.

	private static ReservationDAO instance;

	private ReservationDAO() {
	} // 기본 생성자

	// 3단계 : 기본생성자 대신에 싱글턴 객체를 return 해 주는 getInstance() 메서드를 만들어서
	// 해당 getInstance() 메서드를 외부에서 접근할 수 있도록 해주면 됨.
	public static ReservationDAO getInstance() {

		if (instance == null) {
			instance = new ReservationDAO();
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

	public int reservation_insert(ReservationDTO dto) {

		int count = 0, result = 0;

		openConn();

		try {

			sql = "select max(booking_idx) from reservation";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1) + 1;
			}

			sql = "insert into reservation value(?,?,default,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, count);
			pstmt.setString(2, dto.getMember_id());
			pstmt.setInt(3, dto.getMain_idx());
			pstmt.setString(4, dto.getStore_name());
			pstmt.setInt(5, dto.getMember_cnt());
			pstmt.setString(6, dto.getD_day());
			pstmt.setString(7, dto.getRequest_text());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	// 회원의 예약내역 행의 갯수를 구하는 메서드
	public int getReservationCount(String mem_id) {

		int count = 0;

		try {
			openConn();
			sql = "select count(*) from reservation where member_id = ? order by d_day desc";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, mem_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				count = rs.getInt(1);
			}
			System.out.println(count);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return count;
	}// getBoardCount() end

	public List<ReservationDTO> reservation_list(int page, int rowsize, String mem_id) {

		List<ReservationDTO> list = new ArrayList<ReservationDTO>();

		ReservationDTO dto = null;

		int startNo = (page * rowsize) - (rowsize - 1);

		int endNo = (page * rowsize);

		try {
			openConn();

			sql = "select * from (select row_number() over (order by d_day) rnum ,b.* from reservation b where member_id = ?) a where rnum between ? and ?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, mem_id);

			pstmt.setInt(2, startNo);

			pstmt.setInt(3, endNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				dto = new ReservationDTO();

				dto.setBooking_idx(rs.getInt("booking_idx"));
				dto.setD_day(rs.getString("d_day"));
				dto.setDate(rs.getString("date"));
				dto.setMain_idx(rs.getInt("main_idx"));
				dto.setMember_cnt(rs.getInt("member_cnt"));
				dto.setMember_id(rs.getString("member_id"));
				dto.setRequest_text(rs.getString("request_text"));
				dto.setStore_name(rs.getString("store_name"));

				list.add(dto);
			}
			System.out.println(list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return list;
	}
	
	
	public List<ReservationDTO> store_reservation_list(int page, int rowsize, int main_idx) {
		
		List<ReservationDTO> list = new ArrayList<ReservationDTO>();
		
		ReservationDTO dto = null;
		
		int startNo = (page * rowsize) - (rowsize - 1);
		
		int endNo = (page * rowsize);
		
		try {
			openConn();
			
			sql = "select * from (select row_number() over (order by d_day) rnum ,b.* from reservation b where main_idx = ?) a where rnum between ? and ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, main_idx);
			
			pstmt.setInt(2, startNo);
			
			pstmt.setInt(3, endNo);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				dto = new ReservationDTO();
				
				dto.setBooking_idx(rs.getInt("booking_idx"));
				dto.setD_day(rs.getString("d_day"));
				dto.setDate(rs.getString("date"));
				dto.setMain_idx(rs.getInt("main_idx"));
				dto.setMember_cnt(rs.getInt("member_cnt"));
				dto.setMember_id(rs.getString("member_id"));
				dto.setRequest_text(rs.getString("request_text"));
				dto.setStore_name(rs.getString("store_name"));
				
				list.add(dto);
			}
			System.out.println(list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return list;
	}

	public int getOverReservationCount(String mem_id) {
		int count = 0;
		try {
			openConn();
			
			sql = "select count(*) from reservation where member_id = ? and d_day > now() order by d_day desc";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, mem_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				count = rs.getInt(1);
			}
			System.out.println(count);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return count;
	}// getBoardCount() end

	
	// 가게의 전예약 카운트
	public int getStoreReservationCount(int main_idx) {
		int count = 0;

		try {
			openConn();
			sql = "select count(*) from reservation where main_idx = ? order by d_day desc";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, main_idx);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				count = rs.getInt(1);
			}
			System.out.println(count);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return count;
	}// getBoardCount() end

	public int getOverStoreReservationCount(int main_idx) {
		
		int count = 0;
		try {
			openConn();
			
			sql = "select count(*) from reservation where main_idx = ? and d_day > now() order by d_day desc";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, main_idx);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				count = rs.getInt(1);
			}
			System.out.println(count);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return count;
	}// getBoardCount() end

}
