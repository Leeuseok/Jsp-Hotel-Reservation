package check;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Vector;

import com.mysql.cj.xdevapi.Result;

import Member.DBConnectionMgr;
import room.RoomBean;

public class checkMgr {
	private DBConnectionMgr pool;

	public checkMgr() {
		try {
			/* MemberMgr 생성자 내부에 데이터베이스 연결 pool 객체를 얻음 */
				pool = DBConnectionMgr.getInstance();
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	
	
    public boolean insertReservation(ReservationBean bean) {
        String sql = null;
        boolean flag = false;
    	Result rs = null;	
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            // DB 연결
            con = pool.getConnection();
            
            // 현재 시간을 Timestamp로 변환
            Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());

            sql = "INSERT INTO booking (sdate, edate, room_idx, resev_at, resev_price, resev_people, mem_idx) VALUES (?, ?, ?, ?, ?, ?, ?)";
            // PreparedStatement 설정
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, bean.getStart_date());
            pstmt.setString(2, bean.getEnd_date());
            pstmt.setInt(3, bean.getRoom_idx());
            pstmt.setTimestamp(4, currentTimestamp);
            pstmt.setInt(5, bean.getResev_price());
            pstmt.setInt(6, bean.getPeople());
            pstmt.setInt(7, bean.getMem_idx());

            // 쿼리 실행
            int rowsAffected = pstmt.executeUpdate();

            // 성공적으로 실행되면 rowsAffected는 1 이상의 값이 됨
            flag = (rowsAffected > 0);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
            // 리소스 해제
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return flag;
    }
    
    
    public Vector<ReservationBean> getCheckList(int mem_idx) {
 	   Connection conn = null;
 	   Statement stmt = null;
 	   ResultSet rs = null;
 	   
 	   Vector<ReservationBean> vlist = new Vector<ReservationBean>();	   
 	   
        try {
 		/* pool을 통해 Connection 을 얻는다.입력하세요 */
          
           conn = pool.getConnection();
                      
           String strQuery = "select * from booking where mem_idx =" + mem_idx;
           stmt = conn.createStatement();
           rs = stmt.executeQuery(strQuery);
           
 		  while (rs.next()) {
 			 ReservationBean bean = new ReservationBean();
              
 			 bean.setResev_idx(rs.getInt("resev_idx"));
              bean.setRoom_idx (rs.getInt("room_idx"));
  			 bean.setMem_idx (rs.getInt("mem_idx"));
  			 bean.setStart_date(rs.getString("sdate"));
  			 bean.setEnd_date(rs.getString("edate"));
  			 bean.setResev_at(rs.getTimestamp("resev_at"));
  			 bean.setPeople(rs.getInt("resev_people"));
  			 bean.setResev_price(rs.getInt("resev_price"));
  			  vlist.addElement(bean);
           }
        } catch (Exception ex) {
           System.out.println("Exception" + ex);
        } finally {
 		 /* Connection을 pool에 반환한다.입력하세요 */
     	   pool.freeConnection(conn, stmt, rs);
 	     
        }
        return vlist;
     }
    
    
    
    public boolean cancelReservation(int resev_idx) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;

        try {
            // DB 연결
            con = pool.getConnection();

            // 쿼리 작성
            String sql = "DELETE FROM booking WHERE resev_idx = ?";
            
            // PreparedStatement 설정
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, resev_idx);

            // 쿼리 실행
            int rowsAffected = pstmt.executeUpdate();

            // 성공적으로 실행되면 rowsAffected는 1 이상의 값이 됨
            flag = (rowsAffected > 0);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
            // 리소스 해제
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return flag;
    }
	
	
}
