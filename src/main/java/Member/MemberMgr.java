package Member;

import java.sql.*;
import java.util.*;

public class MemberMgr {

	private DBConnectionMgr pool;

	public MemberMgr() {
		try {
			/* MemberMgr 생성자 내부에 데이터베이스 연결 pool 객체를 얻음 */
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// ID 중복확인
	public boolean checkId(String mem_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			/* 얻어진 pool로 Connection을 얻음. */
			con = pool.getConnection();

			sql = "select mem_id from member where mem_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_id);

			/* id가 존재하면 true, 같은 아이디가 존재하지 않으면 false */
			flag = pstmt.executeQuery().next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			/* 사용된 Connection 을 반환. 재사용위해 닫지 않고 그냥 반환만 */
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}

	// 회원가입
	public boolean insertMember(MemberBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert member(mem_id,mem_pw,mem_name, mem_phone, mem_addr, mem_birth" + ")values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getMem_id());
			pstmt.setString(2, bean.getMem_pw());
			pstmt.setString(3, bean.getMem_name());
			pstmt.setString(4, bean.getMem_phone());
			pstmt.setString(5, bean.getMem_addr());
			pstmt.setString(6, bean.getMem_birth());
			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	public int loginMember(String mem_id, String mem_pw) {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = null;
	    int idx = -1; // 초기값은 유효하지 않은 값으로 설정

	    try {
	        con = pool.getConnection();
	        sql = "select idx from member where mem_id = ? and mem_pw = ?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, mem_id);
	        pstmt.setString(2, mem_pw);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            // 로그인 성공 시 idx 값 가져와 저장
	            idx = rs.getInt("idx");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        pool.freeConnection(con, pstmt, rs);
	    }

	    return idx;
	}


	// 회원 정보 가져오기
	public MemberBean getMemberInfo(String mem_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		MemberBean memberInfo = null;

		try {
			con = pool.getConnection();
			sql = "SELECT * FROM member WHERE mem_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				memberInfo = new MemberBean();
				memberInfo.setMem_id(rs.getString("mem_id"));
				memberInfo.setMem_pw(rs.getString("mem_pw"));
				memberInfo.setMem_name(rs.getString("mem_name"));
				memberInfo.setMem_phone(rs.getString("mem_phone"));
				memberInfo.setMem_addr(rs.getString("mem_addr"));
				memberInfo.setMem_birth(rs.getString("mem_birth"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return memberInfo;
	}

	// 회원정보 수정
	public boolean updateMember(MemberBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;

		try {
			con = pool.getConnection();
			sql = "UPDATE member SET mem_pw=?, mem_name=?, mem_phone=?, mem_addr=?, mem_birth=? WHERE mem_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getMem_pw());
			pstmt.setString(2, bean.getMem_name());
			pstmt.setString(3, bean.getMem_phone());
			pstmt.setString(4, bean.getMem_addr());
			pstmt.setString(5, bean.getMem_birth());
			pstmt.setString(6, bean.getMem_id());

			if (pstmt.executeUpdate() == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}

		return flag;
	}

	public boolean isAdmin(String mem_id, String mem_pw) {
		// 이 부분에서 mem_pw를 확인하는 대신에
		// 별도의 로그인 기능을 사용하여 아이디와 비밀번호를 확인할 수 있습니다.

		// 아이디가 "admin"이고, 비밀번호가 "admin1234!"인 경우를 관리자로 판단
		return "admin".equals(mem_id) && "admin1234!".equals(mem_pw);
	}

	public List<MemberBean> getAllMembers() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		List<MemberBean> allMembers = new ArrayList<>();

		try {
			con = pool.getConnection();
			sql = "SELECT * FROM member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberBean memberInfo = new MemberBean();
				memberInfo.setMem_id(rs.getString("mem_id"));
				memberInfo.setMem_pw(rs.getString("mem_pw"));
				memberInfo.setMem_name(rs.getString("mem_name"));
				memberInfo.setMem_phone(rs.getString("mem_phone"));
				memberInfo.setMem_addr(rs.getString("mem_addr"));
				memberInfo.setMem_birth(rs.getString("mem_birth"));

				allMembers.add(memberInfo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return allMembers;
	}

	public boolean deleteMember(String mem_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;

		try {
			con = pool.getConnection();
			sql = "DELETE FROM member WHERE mem_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_id);

			// 삭제된 행의 개수가 1이면 삭제 성공
			if (pstmt.executeUpdate() == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}

		return flag;
	}

}
