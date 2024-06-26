package room;

import java.sql.*;
import java.util.*;


public class RoomMgr {
	
	private DBConnectionMgr pool = null;
	
	public RoomMgr() {
 	 try{
 		pool = DBConnectionMgr.getInstance();
 	  
 	   
 	   }catch(Exception e){
 	      System.out.println("Error : 커넥션 얻어오기 실패");
 	   }
     }
 
    public Vector<RoomBean> getRoomList() {
	   Connection conn = null;
	   Statement stmt = null;
	   ResultSet rs = null;
	   
	   Vector<RoomBean> vlist = new Vector<RoomBean>();	   
	   
       try {
		/* pool을 통해 Connection 을 얻는다.입력하세요 */
         
          conn = pool.getConnection();
          
          String strQuery = "select * from room";
          stmt = conn.createStatement();
          rs = stmt.executeQuery(strQuery);
          
		  while (rs.next()) {
             RoomBean bean = new RoomBean();
             
             bean.setRoom_idx (rs.getInt("room_idx"));
 			 bean.setMem_idx (rs.getInt("mem_idx"));
 			 bean.setRoom_title(rs.getString("room_title"));
 			 bean.setRoom_kind(rs.getInt("room_kind"));
 			 bean.setRoom_people(rs.getInt("room_people"));
 			 bean.setRoom_detail(rs.getString("room_detail"));
 			 bean.setRoom_area(rs.getString("room_area"));
 			 bean.setRoom_guide(rs.getString("room_guide"));
 			 bean.setRoom_map(rs.getString("room_map"));
 			 bean.setRoom_price(rs.getInt("room_price"));
 			 bean.setCreated_at(rs.getDate("created_at"));
 			 bean.setRoom_num(rs.getInt("room_num"));
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
    
    
	public Vector<RoomBean> getRoominfo(int idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;

		Vector<RoomBean> vinfo = new Vector<RoomBean>();	 
		try {
			/* 얻어진 pool로 Connection을 얻음. */
			con = pool.getConnection();

			sql = "select * from room where room_idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);

			/* id가 존재하면 true, 같은 아이디가 존재하지 않으면 false */
	        rs = pstmt.executeQuery();
	        
	        if (rs.next() == true) {
	             RoomBean bean = new RoomBean();
	             bean.setRoom_idx (rs.getInt("room_idx"));
	 			 bean.setMem_idx (rs.getInt("mem_idx"));
	 			 bean.setRoom_title(rs.getString("room_title"));
	 			 bean.setRoom_kind(rs.getInt("room_kind"));
	 			 bean.setRoom_people(rs.getInt("room_people"));
	 			 bean.setRoom_detail(rs.getString("room_detail"));
	 			 bean.setRoom_area(rs.getString("room_area"));
	 			 bean.setRoom_guide(rs.getString("room_guide"));
	 			 bean.setRoom_map(rs.getString("room_map"));
	 			 bean.setRoom_price(rs.getInt("room_price"));
	 			 bean.setCreated_at(rs.getDate("created_at"));
	 			 bean.setRoom_num(rs.getInt("room_num"));
	 			 vinfo.addElement(bean);
	        }
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			/* 사용된 Connection 을 반환. 재사용위해 닫지 않고 그냥 반환만 */
			pool.freeConnection(con, pstmt, rs);
		}
		return vinfo;
	}
	

	public boolean updateRoom(RoomBean room) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    boolean isUpdated = false;

	    try {
	        conn = pool.getConnection();

	        String sql = "UPDATE room SET room_title=?, room_people=?, room_detail=?, room_area=?, room_guide=?, room_map=?, room_price=?, room_num=? WHERE room_idx=?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, room.getRoom_title());
	        pstmt.setInt(2, room.getRoom_people());
	        pstmt.setString(3, room.getRoom_detail());
	        pstmt.setString(4, room.getRoom_area());
	        pstmt.setString(5, room.getRoom_guide());
	        pstmt.setString(6, room.getRoom_map());
	        pstmt.setInt(7, room.getRoom_price());
	        pstmt.setInt(8, room.getRoom_num());
	        pstmt.setInt(9, room.getRoom_idx());

	        if (pstmt.executeUpdate() > 0) {
	            isUpdated = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        pool.freeConnection(conn, pstmt);
	    }

	    return isUpdated;
	}

	public boolean deleteRoom(RoomBean room) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    boolean isDeleted = false;

	    try {
	        conn = pool.getConnection();

	        String sql = "DELETE FROM ROOM WHERE room_idx=?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, room.getRoom_idx());

	        if (pstmt.executeUpdate() > 0) {
	        	isDeleted = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        pool.freeConnection(conn, pstmt);
	    }

	    return isDeleted;
	}
	
	public boolean adminchk(String mem_id) { // 어드민 확인
	    return mem_id.equals("admin");
	}
 }