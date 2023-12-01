package review;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

public class ReviewDAO {
    private Connection conn;
    private ResultSet rs;

    // ������: �����ͺ��̽� ����
    public ReviewDAO() {
        try {
            String dbURL = "jdbc:mysql://localhost:3306/jsp_project?useUnicode=true&characterEncoding=utf-8";
            String dbID = "root";
            String dbPassword = "1234";

            // JDBC ����̹� �ε��ϰ� �����ͺ��̽��� ����
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // �����ͺ��̽� ���� ��ü ��ȯ
    public Connection getConnection() {
        return conn;
    }

    // �����ͺ��̽��κ��� ���� ��¥ �� �ð� ��������
    public String getCurrentDateFromDB() {
        String SQL = "SELECT NOW()";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "Error";
    }

    // ���� ������ �ε��� ��������
    public int getNext() {
        String SQL = "SELECT review_idx FROM review ORDER BY review_idx DESC";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) + 1;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 1;
    }

    // ���� �ۼ� �޼���
    public int write(int mem_idx, int room_idx, String review_title, String review_cmt) {
        String SQL = "INSERT INTO review (mem_idx, room_idx, review_title, review_cmt, created_at) VALUES (?, ?, ?, ?, NOW())";
        try {
            try (PreparedStatement pstmt = conn.prepareStatement(SQL)) {
                pstmt.setInt(1, mem_idx);
                pstmt.setInt(2, room_idx);
                pstmt.setString(3, review_title);
                pstmt.setString(4, review_cmt);
                pstmt.executeUpdate();
            }

            return getNext();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
    // ���� ������Ʈ �޼���
    public int update(int review_idx, String review_title, String review_cmt) {
        String SQL = "UPDATE review SET review_title = ?, review_cmt = ? WHERE review_idx = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, review_title);
            pstmt.setString(2, review_cmt);
            pstmt.setInt(3, review_idx);
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    // ���� ���� �޼���
    public int delete(int review_idx) {
        String SQL = "DELETE FROM review WHERE review_idx = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, review_idx);
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    // Ư�� ���� �˻� �޼���
    public Review getReview(int review_idx) {
        String SQL = "SELECT * FROM review WHERE review_idx = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, review_idx);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Review review = new Review();
                review.setReview_idx(rs.getInt("review_idx"));
                review.setMem_idx(rs.getInt("mem_idx"));
                review.setRoom_idx(rs.getInt("room_idx"));
                review.setReview_title(rs.getString("review_title"));
                review.setReview_cmt(rs.getString("review_cmt"));

                // �߰� �κ�: ���� �ۼ� ��¥
                Timestamp timestamp = rs.getTimestamp("created_at");
                if (timestamp != null) {
                    review.setCreated_at(new Date(timestamp.getTime()));
                }
                return review;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // ���� �ֱ� ���� 3�� ��������
    public ArrayList<Review> getMostRecentReviews(int count) {
        String SQL = "SELECT * FROM review ORDER BY created_at DESC LIMIT ?";
        ArrayList<Review> list = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(SQL)) {

            pstmt.setInt(1, count);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Review review = extractReviewFromResultSet(rs);
                    list.add(review);
                }
            }

        } catch (SQLException e) {
            handleSQLException(e);
        }

        return list;
    }

    // ResultSet���κ��� ���� ���� �޼���
    private Review extractReviewFromResultSet(ResultSet rs) throws SQLException {
        Review review = new Review();
        review.setReview_idx(rs.getInt("review_idx"));
        review.setMem_idx(rs.getInt("mem_idx"));
        review.setRoom_idx(rs.getInt("room_idx"));
        review.setReview_title(rs.getString("review_title"));
        review.setReview_cmt(rs.getString("review_cmt"));

        // �߰� �κ�: ���� �ۼ� ��¥
        Timestamp timestamp = rs.getTimestamp("created_at");
        if (timestamp != null) {
            review.setCreated_at(new Date(timestamp.getTime()));
        }

        return review;
    }

    // SQLException ó�� �޼���
    private void handleSQLException(SQLException e) {
        // SQLException ó��: �α� ��� �Ǵ� ������ ������� ó��
        e.printStackTrace();
    }

    // ��� ���� ��� ��������
    public ArrayList<Review> getAllReviews() {
        String SQL = "SELECT * FROM review ORDER BY created_at DESC";
        ArrayList<Review> list = new ArrayList<>();

        try {
            // ������ ��ȿ�ϰ� ���� ���� ������ Ȯ��
            if (conn != null && !conn.isClosed()) {
                // ���ҽ� ������ ���� try-with-resources ���
                try (PreparedStatement pstmt = conn.prepareStatement(SQL);
                     ResultSet rs = pstmt.executeQuery()) {

                    // ResultSet�� �� ������ �����͸� �����ϰ� Review ��ü�� ����
                    while (rs.next()) {
                        Review review = extractReviewFromResultSet(rs);
                        list.add(review);
                    }
                }
            } else {
                // ������ ��ȿ���� �ʰų� ������ �� ó��
                System.err.println("Connection is invalid or closed");
            }
        } catch (SQLException e) {
            // SQLException ó��: �α� ��� �Ǵ� ������ ������� ó��
            e.printStackTrace();
        }

        // ���� ��� ��ȯ
        return list;
    }

    // �����ͺ��̽� ���� �ݱ�
    public void closeConnection() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}