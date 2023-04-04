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

	public int MemberJoin(MemberDTO dto) {

		int result = 0, count = 0;

		openConn();

		try {

			sql = "select max(*) from member";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}

			sql = "insert into member(member_id, member_name, member_pwd, member_email, member_phone, member_account, member_type,member_no) values(?,?,?,?,?,default,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getMember_id());
			pstmt.setString(2, dto.getMember_name());
			pstmt.setString(3, dto.getMember_pwd());
			pstmt.setString(4, dto.getMember_email());
			pstmt.setString(5, dto.getMember_phone());
			pstmt.setInt(6, dto.getMember_type());
			pstmt.setInt(7, count + 1);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return result;
	}
	
	
	
	public int MemberKakaoJoin(MemberDTO dto) {

		int result = 0, count = 0;

		openConn();

		try {

			sql = "select max(member_no) from member";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
			
			
			sql = "insert into member(member_id, member_name, member_pwd, member_email, member_phone,"
					+ " member_type,member_no,member_token) values(?,?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getMember_id());
			pstmt.setString(2, dto.getMember_name());
			pstmt.setString(3, dto.getMember_pwd());
			pstmt.setString(4, dto.getMember_email());
			pstmt.setString(5, dto.getMember_phone());
			pstmt.setInt(6, dto.getMember_type());
			pstmt.setInt(7, count + 1);
			pstmt.setString(8, dto.getMember_token());
			

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return result;
	}
	
	
	
	
	
	public int CompanyJoin(MemberDTO dto) {

		int result = 0, count = 0;

		openConn();

		try {

			sql = "select max(*) from member";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}

			sql = "insert into member(member_id, member_name, member_pwd, member_email, member_phone, member_account, member_type, member_storenum,member_no) values(?,?,?,?,?,default,?,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getMember_id());
			pstmt.setString(2, dto.getMember_name());
			pstmt.setString(3, dto.getMember_pwd());
			pstmt.setString(4, dto.getMember_email());
			pstmt.setString(5, dto.getMember_phone());
			pstmt.setInt(6, dto.getMember_type());
			pstmt.setString(7, dto.getMember_storenum());
			pstmt.setInt(8, count + 1);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return result;
	}


	public MemberDTO MemberLogin(String member_id, String member_pwd) {

		MemberDTO dto = null;

		openConn();

		try {

			sql = "select * from member where member_id = ? and member_pwd = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, member_id);

			pstmt.setString(2, member_pwd);

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				System.out.println(rs.getString("member_id"));
				dto = new MemberDTO();

				dto.setMember_id(rs.getString("member_id"));
				dto.setMember_email(rs.getString("member_email"));
				dto.setMember_phone(rs.getString("member_phone"));
				dto.setMember_name(rs.getString("member_name"));
				dto.setMember_type(rs.getInt("member_type"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
	
	
	
	public MemberDTO KakaoLogin(String kakao_token, String kakao_name, String kakao_email) {

		MemberDTO dto = null;

		openConn();

		try {

			sql = "select * from member where member_token = ? and member_name = ? and member_email = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, kakao_token);

			pstmt.setString(2, kakao_name);
			
			pstmt.setString(3, kakao_email);

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				System.out.println(rs.getString("member_token"));
				dto = new MemberDTO();
				
				dto.setMember_token(rs.getString("member_token"));
				dto.setMember_id(rs.getString("member_id"));
				dto.setMember_email(rs.getString("member_email"));
				dto.setMember_phone(rs.getString("member_phone"));
				dto.setMember_name(rs.getString("member_name"));
				dto.setMember_type(rs.getInt("member_type"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}
	
	
	public String MemberFindId(String member_name, String member_email) {
		
		String foundId = null;
		
		openConn();

		try {
			String sql = "select member_id from member where member_name = ? and member_email = ? ";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, member_name);
			pstmt.setString(2, member_email);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				foundId = rs.getString("member_id");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return foundId;
	}

	
	
	public int idCheck(String kakaoToken) {
		
		int res = 0;

		try {
			openConn();

			sql = "select * from member where member_token = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, kakaoToken);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				res = 1;
			}else {
				res = 0;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return res;
	}
	
	
	
	public int tokenCheck(String member_token) {
		
		int res = 0;

		try {
			openConn();

			sql = "select * from member where member_token = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, member_token);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				res = 1;
			}else {
				res = 0;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return res;
	}
	

	 public int getMemberCount() {
	      
	      int count = 0;
	      
	      try {
	         openConn();
	         
	         sql = "select count(*) from member";
	         
	         pstmt = con.prepareStatement(sql);
	         
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            count = rs.getInt(1);
	         } 
	         
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally {
	         closeConn(rs, pstmt, con);
	      }
	      
	      return count;
	   } // getBoardCount 메서드 end
	   
	   // board 테이블에서 현재 페이지에 해당하는 게시물을 조회하는 메서드
	
	//board 테이블에서 현재 페이지에 해당하는 게시물을 조회하는 메서드.
	public List<MemberDTO> getMemberList(int page, int rowsize) {

		List<MemberDTO> list = new ArrayList<MemberDTO>();
		
		//해당 페이지에서 시작 번호
		int startNo = (page * rowsize) - (rowsize - 1);
		
		//해당 페이지에서 끝 번호
		int endNo = (page * rowsize);
		
		
		try {
			
			openConn();
			sql = "select * from (select row_number() over(order by member_no ) rnum ,b.* from member b) a where rnum between  ?  and  ? ";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);
			
			rs = pstmt.executeQuery();
		
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				
				dto.setMember_account(rs.getInt("member_account"));
				dto.setMember_email(rs.getString("member_email"));
				dto.setMember_id(rs.getString("member_id"));
				dto.setMember_mark(rs.getString("member_mark"));
				dto.setMember_name(rs.getString("member_name"));
				dto.setMember_phone(rs.getString("member_phone"));
				dto.setMember_pwd(rs.getString("member_pwd"));
				dto.setMember_storenum(rs.getString("member_storenum"));
				dto.setMember_type(rs.getInt("member_type"));
				System.out.println(dto.getMember_id());
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}	//getMemberCount() 메서드 end
	

	
	
	
	//#################Update#####################
		
	public int updateMember(MemberDTO dto) {

		int result = 0;

		openConn();

		try {

			sql = "select * from member where member_id = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getMember_id());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
			
			sql = "update member set member_pwd = ?, member_email = ?, member_phone = ?, member_storenum =?  where member_id = ?";	

			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getMember_pwd());
			pstmt.setString(2, dto.getMember_email());
			pstmt.setString(3, dto.getMember_phone());
			pstmt.setString(4, dto.getMember_storenum());
			pstmt.setString(5, dto.getMember_id());
			
			result = pstmt.executeUpdate();

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return result;
	}

	

	//##################UpdateEnd####################
	
	public MemberDTO getMemberSelect(String member_id) {

		MemberDTO dto = null;
		
		try {
			openConn();
			
			sql = "select * from member "
					+ " where member_id = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, member_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto = new MemberDTO();
				
				dto.setMember_account(rs.getInt("member_account"));
				dto.setMember_email(rs.getString("member_email"));
				dto.setMember_id(rs.getString("member_id"));
				dto.setMember_mark(rs.getString("member_mark"));
				dto.setMember_name(rs.getString("member_name"));
				dto.setMember_phone(rs.getString("member_phone"));
				dto.setMember_pwd(rs.getString("member_pwd"));
				dto.setMember_storenum(rs.getString("member_storenum"));
				dto.setMember_type(rs.getInt("member_type"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return dto;
	}  // getMemberSelect() 메서드 end	

	
	//MemberDelete()
	public int MemberDelete(String id, String pwd) {

		int result = 0;
		
		try {
			openConn();
			
			sql = "select * from member "
					+ " where member_id = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(pwd.equals(rs.getString("member_pwd"))) {
					
					sql = "delete from member where member_id = ?";
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, id);
					
					result = pstmt.executeUpdate();
					
				}else {  // 비밀번호가 틀린 경우
					result = -1;
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
	}  // deleteMember() 메서드 end

	
	
	
	
	
	
	
}