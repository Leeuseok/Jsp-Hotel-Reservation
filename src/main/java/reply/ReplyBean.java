package reply;

import java.sql.Date;

public class ReplyBean {
    private int reply_idx;     // 댓글의 고유 인덱스
    private int mem_idx;       // 회원의 고유 인덱스
    private int room_id;    // 리뷰의 고유 인덱스
    private String reply_cmt;  // 댓글 내용
    private String mem_id;   // 회원 이름
    private Date created_at;   // 댓글 작성일
	public int getReply_idx() {
		return reply_idx;
	}
	public void setReply_idx(int reply_idx) {
		this.reply_idx = reply_idx;
	}
	public int getMem_idx() {
		return mem_idx;
	}
	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
	}
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public String getReply_cmt() {
		return reply_cmt;
	}
	public void setReply_cmt(String reply_cmt) {
		this.reply_cmt = reply_cmt;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}


    // Getter 및 Setter 메서드들

}
