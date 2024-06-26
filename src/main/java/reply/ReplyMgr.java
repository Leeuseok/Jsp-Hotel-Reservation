package reply;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

public class ReplyMgr {
    private Connection conn; // db와 연결하는 객체
    private ResultSet rs;

    // 생성자 (Constructor)
    public ReplyMgr() {
        try {
            // DB 연결 정보
            String dbURL = "jdbc:mysql://localhost:3306/jsp_project?useSSL=false";
            String dbID = "root";
            String dbPassword = "1234";
            
            // JDBC 드라이버 로드 및 연결
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 현재 날짜 및 시간을 가져오는 메서드
    public String getDate() {
        String SQL = "SELECT NOW()";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    // 다음 댓글의 인덱스를 가져오는 메서드
    public int getNext() {
        String SQL = "SELECT reply_idx FROM reply ORDER BY reply_idx DESC";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) + 1;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 1;
    }

    // 댓글 작성 메서드
    public int write(int room_id, String reply_cmt, String mem_id) {
        String SQL = "INSERT INTO reply(reply_idx, mem_idx,room_idx,reply_cmt,created_at,mem_id) VALUES(?, ?, ?, ?, NOW(), ?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext());
            pstmt.setInt(2, 3);
            pstmt.setInt(3, room_id);
            pstmt.setString(4, reply_cmt);
            pstmt.setString(5, mem_id);
            pstmt.executeUpdate();
            return getNext();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    // 특정 댓글의 내용을 가져오는 메서드
    public String getUpdateReply(int reply_idx) {
        String SQL = "SELECT reply_cmt FROM reply WHERE reply_idx = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, reply_idx);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    // 특정 리뷰에 속하는 댓글 리스트를 가져오는 메서드
    public ArrayList<ReplyBean> getList(int room_idx) {
        String SQL = "SELECT * FROM reply WHERE room_idx = ?";

        ArrayList<ReplyBean> list = new ArrayList<>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, room_idx);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ReplyBean replyBean = new ReplyBean();
                replyBean.setReply_idx(rs.getInt("reply_idx"));
                replyBean.setMem_idx(rs.getInt("mem_idx"));
                replyBean.setRoom_id(rs.getInt("room_idx"));
                replyBean.setReply_cmt(rs.getString("reply_cmt"));
                replyBean.setMem_id(rs.getString("mem_id"));
                
                // 추가된 부분: 댓글 작성 일자
                Timestamp timestamp = rs.getTimestamp("created_at");
                if (timestamp != null) {
                    replyBean.setCreated_at(new Date(timestamp.getTime()));
                }

                list.add(replyBean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 댓글 업데이트 메서드
    public int update(int reply_idx, String reply_cmt) {
        String SQL = "UPDATE reply SET reply_cmt = ? WHERE reply_idx = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, reply_cmt);
            pstmt.setInt(2, reply_idx);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    // 특정 댓글을 가져오는 메서드
    public ReplyBean getReply(int reply_idx) {
        String SQL = "SELECT mem_id FROM reply WHERE reply_idx=?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, reply_idx);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ReplyBean replyBean = new ReplyBean();
                replyBean.setMem_id(rs.getString(1));
                return replyBean;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // 댓글 삭제 메서드
    public int delete(int reply_idx) {
        String SQL = "DELETE FROM reply WHERE reply_idx = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, reply_idx);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
}
