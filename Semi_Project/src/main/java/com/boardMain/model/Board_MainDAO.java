package com.boardMain.model;

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

import com.Restaurant.model.RtDTO;

public class Board_MainDAO {
	Connection con = null;

	PreparedStatement pstmt = null;

	ResultSet rs = null;

	String sql = null;

	// MemberDAO 클래스를 싱글턴 방식을로 만들어 보자.
	// 1단계 : 싱글턴 방식을 객체를 만들기 위해서는 우선적으로 기본생성자의 접근 제어자를 public이 아닌
	// private 으로 바꾸어 주어야 한다. 즉 외부에서는 직접적으로 기본생성자를 호출하지 못하게 하는 방식이다.

	// 2단계 : MemberDAO 클래스를 정적(static) 멤버로 선언 해 주어야 한다.

	private static Board_MainDAO instance;

	private Board_MainDAO() {
	} // 기본 생성자

	// 3단계 : 기본생성자 대신에 싱글턴 객체를 return 해 주는 getInstance() 메서드를 만들어서
	// 해당 getInstance() 메서드를 외부에서 접근할 수 있도록 해주면 됨.
	public static Board_MainDAO getInstance() {

		if (instance == null) {
			instance = new Board_MainDAO();
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

	// 가게 등록 메서드
	public int insertBoard_Main(Board_MainDTO dto) {
		int result = 0, count = 0;
		String board_main = null;

		try {
			openConn();
			sql = "select count(*) from board_main";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1) + 1;
			}

			sql = "select member_storenum from member where member_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getMain_memid());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				board_main = rs.getString(1);
			}

			sql = "insert into board_main values(?,?,?,?,?,?,?,?,?,?,'',?,?,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, count);
			pstmt.setString(2, dto.getMain_name());
			pstmt.setString(3, dto.getMain_type());
			pstmt.setString(4, dto.getMain_info());
			pstmt.setString(5, dto.getMain_opentime());
			pstmt.setString(6, dto.getMain_endtime());
			pstmt.setString(7, dto.getMain_post());
			pstmt.setString(8, dto.getMain_addr());
			pstmt.setString(9, dto.getMain_detailaddr());
			pstmt.setString(10, dto.getMain_phone());
			pstmt.setString(11, dto.getMain_memid());
			pstmt.setString(12, board_main);
			pstmt.setString(13, dto.getMain_thema());
			pstmt.setString(14, dto.getMain_img());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}// insertBoard_Main() end

	// Main의 총합을 구하는 메서드
	public int getBoardCount() {

		int count = 0;

		try {
			openConn();
			sql = "select count(*) from board_main";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1) + 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return count;
	}// getBoardCount() end

	// 전체가게리스트를 보여주는 메서드
	public List<Board_MainDTO> getBoardMainList(int page, int rowsize) {
		List<Board_MainDTO> list = new ArrayList<Board_MainDTO>();

		int startNo = (page * rowsize) - (rowsize - 1);

		int endNo = (page * rowsize);

		try {
			openConn();
			sql = "select * from (select row_number() over (order by main_idx) rnum ,b.* from board_main b) a where rnum between ? and ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Board_MainDTO dto = new Board_MainDTO();

				dto.setMain_idx(rs.getInt("main_idx"));
				dto.setMain_name(rs.getString("main_name"));
				dto.setMain_type(rs.getString("main_type"));
				dto.setMain_info(rs.getString("main_info"));
				dto.setMain_opentime(rs.getString("main_opentime"));
				dto.setMain_endtime(rs.getString("main_endtime"));
				dto.setMain_post(rs.getString("main_post"));
				dto.setMain_addr(rs.getString("main_addr"));
				dto.setMain_detailaddr(rs.getString("main_detailaddr"));
				dto.setMain_phone(rs.getString("main_phone"));
				dto.setMain_location(rs.getString("main_location"));
				dto.setMain_memid(rs.getString("main_memid"));
				dto.setMain_storenum(rs.getString("main_storenum"));
				dto.setMain_thema(rs.getString("main_thema"));
				dto.setMain_img(rs.getString("main_img"));

				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}// getBoardMainList() end

	// 가게번호로 상세정보 가져오기
	public Board_MainDTO getBoardMainSelect(int idx) {

		Board_MainDTO dto = null;

		try {
			openConn();
			sql = "select * from board_main where main_idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new Board_MainDTO();
				dto.setMain_idx(rs.getInt("main_idx"));
				dto.setMain_name(rs.getString("main_name"));
				dto.setMain_type(rs.getString("main_type"));
				dto.setMain_info(rs.getString("main_info"));
				dto.setMain_opentime(rs.getString("main_opentime"));
				dto.setMain_endtime(rs.getString("main_endtime"));
				dto.setMain_post(rs.getString("main_post"));
				dto.setMain_addr(rs.getString("main_addr"));
				dto.setMain_detailaddr(rs.getString("main_detailaddr"));
				dto.setMain_phone(rs.getString("main_phone"));
				dto.setMain_location(rs.getString("main_location"));
				dto.setMain_memid(rs.getString("main_memid"));
				dto.setMain_storenum(rs.getString("main_storenum"));
				dto.setMain_thema(rs.getString("main_thema"));
				dto.setMain_img(rs.getString("main_img"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}// getBoardMainSelect()end

	public int updateBoardMain(Board_MainDTO dto) {
		int result = 0;
		openConn();

		try {
			sql = "select * from board_main where main_idx = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getMain_idx());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				sql = "update board_main set main_type = ?,main_info = ?,main_opentime = ?,main_endtime = ?,main_post = ?,main_addr = ?,main_detailaddr = ?,main_phone = ?,main_thema = ?,main_img = ? where main_idx =?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getMain_type());
				pstmt.setString(2, dto.getMain_info());
				pstmt.setString(3, dto.getMain_opentime());
				pstmt.setString(4, dto.getMain_endtime());
				pstmt.setString(5, dto.getMain_post());
				pstmt.setString(6, dto.getMain_addr());
				pstmt.setString(7, dto.getMain_detailaddr());
				pstmt.setString(8, dto.getMain_phone());
				pstmt.setString(9, dto.getMain_thema());
				pstmt.setString(10, dto.getMain_img());
				pstmt.setInt(11, dto.getMain_idx());

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

	public List<RtDTO> TotalMainSearch(String keyword, int page, int rowsize) {

		List<RtDTO> searchList = new ArrayList<RtDTO>();
		
		int startNo = (page * rowsize) - (rowsize - 1);

		int endNo = (page * rowsize);

		openConn();

		try {
			sql = "SELECT * FROM ( SELECT ROW_NUMBER() OVER "
		               + "(ORDER BY main_idx) AS rnum, bm.*, mm.* FROM "
		               + "board_main bm INNER JOIN main_menu mm ON "
		               + "bm.main_idx = mm.rst_no WHERE bm.main_name LIKE ?"
		               + " OR bm.main_type LIKE ? OR bm.main_addr LIKE ?"
		               + " OR bm.main_thema LIKE ? OR mm.menu_name LIKE ? )"
		               + " AS sub WHERE sub.rnum BETWEEN ? AND ? group by main_idx";
			
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, '%' + keyword + '%');
			pstmt.setString(2, '%' + keyword + '%');
			pstmt.setString(3, '%' + keyword + '%');
			pstmt.setString(4, '%' + keyword + '%');
			pstmt.setString(5, '%' + keyword + '%');
			pstmt.setInt(6, startNo);
			pstmt.setInt(7, endNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				RtDTO dto = new RtDTO();
				dto.setMain_idx(rs.getInt("main_idx"));
				dto.setMain_name(rs.getString("main_name"));
				dto.setMain_type(rs.getString("main_type"));
				dto.setMain_info(rs.getString("main_info"));
				dto.setMain_opentime(rs.getString("main_opentime"));// 5
				dto.setMain_endtime(rs.getString("main_endtime"));
				dto.setMain_post(rs.getString("main_post"));
				dto.setMain_addr(rs.getString("main_addr"));
				dto.setMain_detailaddr(rs.getString("main_detailaddr"));
				dto.setMain_phone(rs.getString("main_phone"));// 10
				dto.setMain_location(rs.getString("main_location"));
				dto.setMain_memid(rs.getString("main_memid"));
				dto.setMain_storenum(rs.getString("main_storenum"));
				dto.setMain_thema(rs.getString("main_thema"));
				dto.setMain_img(rs.getString("main_img"));// 15
				dto.setMenu_name(rs.getString("menu_name"));
				dto.setMenu_price(rs.getInt("menu_price"));

				searchList.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return searchList;
	}

	public List<RtDTO> RestaurantKeywordSearch(String keyword, String type) {

		List<RtDTO> searchList = new ArrayList<RtDTO>();
		openConn();

		try {
			if (type.equals("Location")) {
				sql = "select bm.*, mm.* from semi.board_main bm, semi.main_menu mm where bm.main_addr like ? group by bm.main_name";
			} else if (type.equals("FoodType")) {
				sql = "select bm.*, mm.* from semi.board_main bm, semi.main_menu mm where bm.main_type like ? group by bm.main_name";
			} else if (type.equals("Thema")) {
				sql = "select bm.*, mm.* from semi.board_main bm, semi.main_menu mm where bm.main_thema like ? group by bm.main_name";
			}

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, '%' + keyword + '%');
			rs = pstmt.executeQuery();

			while (rs.next()) {
				RtDTO dto = new RtDTO();
				dto.setMain_idx(rs.getInt("main_idx"));
				dto.setMain_name(rs.getString("main_name"));
				dto.setMain_type(rs.getString("main_type"));
				dto.setMain_info(rs.getString("main_info"));
				dto.setMain_opentime(rs.getString("main_opentime"));
				dto.setMain_endtime(rs.getString("main_endtime"));
				dto.setMain_post(rs.getString("main_post"));
				dto.setMain_addr(rs.getString("main_addr"));
				dto.setMain_detailaddr(rs.getString("main_detailaddr"));
				dto.setMain_phone(rs.getString("main_phone"));
				dto.setMain_location(rs.getString("main_location"));
				dto.setMain_memid(rs.getString("main_memid"));
				dto.setMain_storenum(rs.getString("main_storenum"));
				dto.setMain_thema(rs.getString("main_thema"));
				dto.setMain_img(rs.getString("main_img"));
				dto.setMenu_name(rs.getString("menu_name"));
				dto.setMenu_price(rs.getInt("menu_price"));

				searchList.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return searchList;
	}

	public List<RtDTO> RestaurantCostSearch(int min, int max) {

		List<RtDTO> searchList = new ArrayList<RtDTO>();

		openConn();

		try {
			// 최저금액, 최대금액 지정해서 메뉴가격비교해서 뽑아오는 sql문 만들기
			sql = "select bm.*,  mm.* from semi.board_main bm, semi.main_menu mm "
					+ "where mm.menu_price >= ? and mm.menu_price <= ? "
					+ "and mm.rst_no = bm.main_idx group by main_name";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, min);
			pstmt.setInt(2, max);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				RtDTO dto = new RtDTO();

				dto.setMain_idx(rs.getInt("main_idx"));
				dto.setMain_name(rs.getString("main_name"));
				dto.setMain_type(rs.getString("main_type"));
				dto.setMain_info(rs.getString("main_info"));
				dto.setMain_opentime(rs.getString("main_opentime"));

				dto.setMain_endtime(rs.getString("main_endtime"));
				dto.setMain_post(rs.getString("main_post"));
				dto.setMain_addr(rs.getString("main_addr"));
				dto.setMain_detailaddr(rs.getString("main_detailaddr"));
				dto.setMain_phone(rs.getString("main_phone"));

				dto.setMain_location(rs.getString("main_location"));
				dto.setMain_memid(rs.getString("main_memid"));
				dto.setMain_storenum(rs.getString("main_storenum"));
				dto.setMain_thema(rs.getString("main_thema"));
				dto.setMain_img(rs.getString("main_img"));

				dto.setMenu_name(rs.getString("menu_name"));
				dto.setMenu_price(rs.getInt("menu_price"));
				dto.setMenu_img(rs.getString("menu_img"));

				searchList.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return searchList;
	}

	public int deleteBoardmain(int board_idx) {
		int result = 0;

		try {
			openConn();

			sql = "delete from board_main where main_idx = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_idx);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}

	// 회원 번호를 재정렬하는 메서드
	public void updateSequence(int board_idx) {

		try {
			openConn();
			sql = "update board_main set main_idx = main_idx-1 where main_idx > ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

	}

	// 검색어에 해당하는 게시물의 수를 조회하는 메서드
	public int serchListCount(String field, String keyword) {
		int count = 0;

		try {
			openConn();

			sql = "select count(*) from board_main";

			if (field.equals("main_name")) {
				sql += " where main_name like ?";
			} else if (field.equals("main_type")) {
				sql += " where main_type like ?";
			} else if (field.equals("main_info")) {
				sql += " where main_info like ?";
			} else if (field.equals("main_opentime")) {
				sql += " where main_opentime like ?)";
			} else if (field.equals("main_endtime")) {
				sql += " where main_endtime like ?";
			} else if (field.equals("main_addr")) {
				sql += " where main_addr like ? or main_post like ? or main_detailaddr like ?";
			} else if (field.equals("main_phone")) {
				sql += " where main_phone like ?";
			} else if (field.equals("main_memid")) {
				sql += " where main_memid like ?";
			} else if (field.equals("main_storenum")) {
				sql += " where main_storenum like ?";
			} else if (field.equals("main_thema")) {
				sql += " where main_thema like ?";
			}

			sql += " order by main_idx";

			pstmt = con.prepareStatement(sql);

			if (field.equals("main_addr")) {
				pstmt.setString(1, '%' + keyword + '%');
				pstmt.setString(2, '%' + keyword + '%');
				pstmt.setString(3, '%' + keyword + '%');
			} else {
				pstmt.setString(1, '%' + keyword + '%');
			}
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
	}

	// 검색어에 해당하는 게시물의 수를 조회하는 메서드
	public int searchRestaurantCount(String keyword) {
		int count = 0;

		try {
			openConn();

			sql = "SELECT COUNT(*) FROM ("
					+ "    SELECT DISTINCT main_idx FROM ("
					+ "        SELECT ROW_NUMBER() OVER (ORDER BY main_idx) AS rnum, bm.*, mm.*"
					+ "        FROM board_main bm "
					+ "        INNER JOIN main_menu mm ON bm.main_idx = mm.rst_no "
					+ "        WHERE bm.main_name LIKE ?"
					+ "        OR bm.main_type LIKE ? "
					+ "        OR bm.main_addr LIKE ?"
					+ "        OR bm.main_thema LIKE ?"
					+ "        OR mm.menu_name LIKE ?"
					+ "    ) AS sub"
					+ ") AS sub2;";

			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, '%' + keyword + '%');
			pstmt.setString(2, '%' + keyword + '%');
			pstmt.setString(3, '%' + keyword + '%');
			pstmt.setString(4, '%' + keyword + '%');
			pstmt.setString(5, '%' + keyword + '%');
			
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
	}

	public int getBoardidx(String storenum) {
		int result = 0;

		try {
			openConn();
			sql = "select main_idx from board_main where main_storenum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, storenum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}

}
