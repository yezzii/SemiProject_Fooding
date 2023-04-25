package com.member.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.boardMain.model.Board_MainDTO;

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

				dto = new MemberDTO();

				dto.setMember_id(rs.getString("member_id"));
				dto.setMember_email(rs.getString("member_email"));
				dto.setMember_phone(rs.getString("member_phone"));
				dto.setMember_name(rs.getString("member_name"));
				dto.setMember_type(rs.getInt("member_type"));
				dto.setMember_storenum(rs.getString("member_storenum"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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

	// 아이디로 값을 받아와서 dto에 저장 후 매개변수로 받아온 입력값을 비교
	public MemberDTO MemberFindPwd(String member_id) {

		MemberDTO dto = null;

		int result = 0;

		openConn();

		try {
			String sql = "select * from member where member_id = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, member_id);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new MemberDTO();

				dto.setMember_id(rs.getString("member_id"));
				dto.setMember_name(rs.getString("member_name"));
				dto.setMember_email(rs.getString("member_email"));
				dto.setMember_no(rs.getInt("member_no"));

				System.out.println("아이디 : " + dto.getMember_id());
				System.out.println("이름 : " + dto.getMember_name());
				System.out.println("이메일 : " + dto.getMember_email());

			} else {
				dto = new MemberDTO();

				dto.setMember_id("없음");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}

	// 임시비밀번호 DB에 저장
	public void TempPwdUpdate(int no, String encode) {

		openConn();

		String sql = "update member set member_pwd = ? where member_no = ?";

		try {

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, encode);

			pstmt.setInt(2, no);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

	}

	public int getMemberCount() {

		int count = 0;

		try {
			openConn();

			sql = "select count(*) from member";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
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

	// member 테이블에서 현재 페이지에 해당하는 게시물을 조회하는 메서드.
	public List<MemberDTO> getMemberList(int page, int rowsize) {

		List<MemberDTO> list = new ArrayList<MemberDTO>();

		// 해당 페이지에서 시작 번호
		int startNo = (page * rowsize) - (rowsize - 1);

		// 해당 페이지에서 끝 번호
		int endNo = (page * rowsize);

		try {

			openConn();
			sql = "select * from (select row_number() over(order by member_no ) rnum ,b.* from member b) a where rnum between  ?  and  ? ";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
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
				dto.setMember_no(rs.getInt("member_no"));

				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	} // getMemberCount() 메서드 end

	// ID 중복체크
	public int idCheck(String id) {

		int res = 0;

		try {
			openConn();

			sql = "select * from member where member_id = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				res = -1;
			} else {
				res = 1;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return res;
	}// ID 중복체크 end

	// #################Update#####################

	public int updateMember(MemberDTO dto) {

		int result = 0;

		openConn();

		try {

			sql = "select * from member where member_id = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getMember_id());

			rs = pstmt.executeQuery();

			if (rs.next()) {

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

	// ##################UpdateEnd####################

	public MemberDTO getMemberSelect(String member_id) {

		MemberDTO dto = null;

		try {
			openConn();

			sql = "select * from member " + " where member_id = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, member_id);

			rs = pstmt.executeQuery();

			if (rs.next()) {

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
	} // getMemberSelect() 메서드 end

	// MemberDelete()
	public int MemberDelete(String id, String pwd) {

		int result = 0;

		try {
			openConn();

			sql = "select * from member " + " where member_id = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (pwd.equals(rs.getString("member_pwd"))) {

					sql = "delete from member where member_id = ?";

					pstmt = con.prepareStatement(sql);

					pstmt.setString(1, id);

					result = pstmt.executeUpdate();

				} else { // 비밀번호가 틀린 경우
					result = -1;
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return result;
	} // deleteMember() 메서드 end

	// ##############searchListCount##############//

	// 테이블에서 검색어에 해당하는 게시물의 수를 조회하는 메서드.

	public int searchListCount(String field, String keyword) {
		int count = 0;

		try {

			openConn();

			sql = "select count(*) from member";

			if (field.equals("mem_id")) {
				sql += " where member_id like ?";
			} else if (field.equals("mem_name")) {
				sql += " where member_name like ?";
			} else if (field.equals("mem_email")) {
				sql += " where member_email like ?";
			} else if (field.equals("mem_phone")) {
				sql += " where member_phone like ?";
			} else if (field.equals("mem_account")) {
				sql += " where member_account like ?";
			} else if (field.equals("member_storenum")) {
				sql += " where member_storenum like ?";
			} else if (field.equals("member_type")) {
				sql += " where member_type like ?";
			}

			sql += " oder by member_no";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, '%' + keyword + '%');

			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return count;
	} // searchListCount() 메서드 end

	// board 테이블에서 검색한 내용을 가지고 페이징 처리하는 메서드.
	public List<MemberDTO> getSearchMemberList(String field, String keyword, int page, int rowsize) {

		List<MemberDTO> searchList = new ArrayList<MemberDTO>();

		int startNo = (page * rowsize) - (rowsize - 1);
		int endNo = (page * rowsize);

		try {
			openConn();

			sql = "select * from (select row_number() over(order by member_no) rnum, b.* from member b";

			if (field.equals("mem_id")) {
				sql += " where member_id like ?) g";
			} else if (field.equals("mem_name")) {
				sql += " where member_name like ?) j";
			} else if (field.equals("mem_email")) {
				sql += " where member_email like ?) i";
			} else if (field.equals("mem_phone")) {
				sql += " where member_phone like ?) k";
			} else if (field.equals("mem_account")) {
				sql += " where member_account like ?) p";
			} else if (field.equals("member_storenum")) {
				sql += " where member_storenum like ?) h";
			} else if (field.equals("member_type")) {
				sql += " where member_type like ?) f";
			}

			sql += " where rnum between ? and ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setInt(2, startNo);
			pstmt.setInt(3, endNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberDTO dto = new MemberDTO();

				dto.setMember_id(rs.getString("member_id"));
				dto.setMember_name(rs.getString("member_name"));
				dto.setMember_email(rs.getString("member_email"));
				dto.setMember_phone(rs.getString("member_phone"));
				dto.setMember_account(rs.getInt("member_account"));
				dto.setMember_storenum(rs.getString("member_storenum"));

				searchList.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return searchList;
	}// getSearchMemberList() 메서드 end

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
					+ " member_type,member_no,member_token,member_storenum) values(?,?,?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getMember_id());
			pstmt.setString(2, dto.getMember_name());
			pstmt.setString(3, dto.getMember_pwd());
			pstmt.setString(4, dto.getMember_email());
			pstmt.setString(5, dto.getMember_phone());
			pstmt.setInt(6, dto.getMember_type());
			pstmt.setInt(7, count + 1);
			pstmt.setString(8, dto.getMember_token());
			pstmt.setString(9, dto.getMember_storenum());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return result;
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
			} else {
				res = 0;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return res;
	}

	public MemberDTO getMemberProfile(String id) {
		MemberDTO dto = null;

		openConn();
		try {
			sql = "select * from member where member_id = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new MemberDTO();

				dto.setMember_no(rs.getInt("member_no"));
				dto.setMember_id(rs.getString("member_id"));
				dto.setMember_name(rs.getString("member_name"));
				dto.setMember_pwd(rs.getString("member_pwd"));
				dto.setMember_email(rs.getString("member_email"));
				dto.setMember_phone(rs.getString("member_phone"));
				dto.setMember_account(rs.getInt("member_account"));
				dto.setMember_storenum(rs.getString("member_storenum"));
				dto.setMember_type(rs.getInt("member_type"));
				dto.setMember_token(rs.getString("member_token"));
				dto.setMember_joindate(rs.getString("member_joindate"));
				dto.setMember_image(rs.getString("member_image"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}// end
	
	
	
	
	
	public int checkMarking(MemberMarkDTO dto) {

		openConn();

		int result = 0;

		try {

			sql = "select * from member_marking where marked_storeidx = ? and mem_id = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, dto.getMarked_storeidx());
			pstmt.setString(2, dto.getMem_id());

			rs = pstmt.executeQuery();

			if (rs.next()) {

				result = 1;
			} else {
				result = 0;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}

	public int addMarking(MemberMarkDTO dto) {

		openConn();

		int count = 0;

		int result = 0;


		try {

				sql = "select max(idx) from member_marking";

				pstmt = con.prepareStatement(sql);

				rs = pstmt.executeQuery();

				if (rs.next()) {
					count = rs.getInt(1) + 1;
				}

				sql = "insert into member_marking value(?,?,?)";

				pstmt = con.prepareStatement(sql);

				pstmt.setInt(1, count);
				pstmt.setString(2, dto.getMem_id());
				pstmt.setInt(3, dto.getMarked_storeidx());

				result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}

	public int deleteMarking(MemberMarkDTO dto) {

		openConn();

		int result = 0;

		try {
			
			sql = "delete from member_marking where mem_id = ? and marked_storeidx = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getMem_id());
			
			pstmt.setInt(2, dto.getMarked_storeidx());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}
	
	
	public void updateSequence(int num) {
		
		try {
			openConn();
			
			sql = "update member_marking set idx = idx - 1 where idx > ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
	}  // updateSequence() 메서드 end
	
	
	

	public int updateProfileMember(MemberDTO dto) {
		// 마이페이지에 있는 회원의 정보수정을 하는 메서드
		int result = 0;

		try {
			openConn();
			sql = "select * from member where member_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getMember_id());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (dto.getMember_image() == null) {
					sql = "update member set member_pwd = ?, member_email = ?, member_phone = ? where member_id = ? ";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, dto.getMember_pwd());
					pstmt.setString(2, dto.getMember_email());
					pstmt.setString(3, dto.getMember_phone());
					pstmt.setString(4, dto.getMember_id());
				} else {
					sql = "update member set member_pwd = ?, member_email = ?, member_phone = ?,member_image = ? where member_id = ? ";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, dto.getMember_pwd());
					pstmt.setString(2, dto.getMember_email());
					pstmt.setString(3, dto.getMember_phone());
					pstmt.setString(4, dto.getMember_image());
					pstmt.setString(5, dto.getMember_id());
				}

				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}// updateProfileMember() 메서드 end

	public List<MemberMarkDTO> loadMark(String id) {
		
		List<MemberMarkDTO> list = new ArrayList<MemberMarkDTO>();
		
		openConn();
		
		sql = "select * from member_marking where mem_id = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberMarkDTO dto = new MemberMarkDTO();
				
				dto.setIdx(rs.getInt("idx"));
				dto.setMem_id(rs.getString("mem_id"));
				dto.setMarked_storeidx(rs.getInt("marked_storeidx"));
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	public List<Board_MainDTO> loadMarkRst(String member_id) {
	    List<Board_MainDTO> list = new ArrayList<Board_MainDTO>();
	    openConn();

	    try {
	        // 첫 번째 쿼리 실행
	        String sql = "SELECT board_main.main_idx FROM board_main " +
	                     "INNER JOIN member_marking ON " +
	                     "member_marking.marked_storeidx = board_main.main_idx " +
	                     "WHERE member_marking.mem_id = ?";
	        PreparedStatement pstmt1 = con.prepareStatement(sql);
	        pstmt1.setString(1, member_id);
	        ResultSet rs1 = pstmt1.executeQuery();

	        List<Integer> mainIdxList = new ArrayList<Integer>();
	        while(rs1.next()) {
	            mainIdxList.add(rs1.getInt("main_idx"));
	        }
	        rs1.close();
	        pstmt1.close();

	        // 두 번째 쿼리 실행
	        for(int main_idx : mainIdxList) {
	            Board_MainDTO dto = new Board_MainDTO();
	            sql = "SELECT * FROM board_main WHERE main_idx = ?";
	            PreparedStatement pstmt2 = con.prepareStatement(sql);
	            pstmt2.setInt(1, main_idx);
	            ResultSet rs2 = pstmt2.executeQuery();

	            if(rs2.next()) {
	                dto.setMain_idx(rs2.getInt("main_idx"));
	                dto.setMain_name(rs2.getString("main_name"));
	                dto.setMain_type(rs2.getString("main_type"));
	                dto.setMain_info(rs2.getString("main_info"));
	                dto.setMain_opentime(rs2.getString("main_opentime"));
	                dto.setMain_endtime(rs2.getString("main_endtime"));
	                dto.setMain_post(rs2.getString("main_post"));
	                dto.setMain_addr(rs2.getString("main_addr"));
	                dto.setMain_detailaddr(rs2.getString("main_detailaddr"));
	                dto.setMain_phone(rs2.getString("main_phone"));
	                dto.setMain_location(rs2.getString("main_location"));
	                dto.setMain_memid(rs2.getString("main_memid"));
	                dto.setMain_storenum(rs2.getString("main_storenum"));
	                dto.setMain_thema(rs2.getString("main_thema"));
	                dto.setMain_img(rs2.getString("main_img"));
	                list.add(dto);
	            }

	            rs2.close();
	            pstmt2.close();
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	    	closeConn(rs, pstmt, con);
	    }

	    return list;
	}

	 public int markCount(String member_id) {
		 	
		 	openConn();

			int count = 0;

			try {

					sql = "select count(idx) from member_marking where mem_id = ?";

					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, member_id);
					
					rs = pstmt.executeQuery();

					if (rs.next()) {
						count = rs.getInt(1);
					}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			return count;
		}

}
