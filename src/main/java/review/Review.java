package review;

import java.util.Date;

public class Review {
    private int review_idx;
    private int mem_idx;
    private int room_idx;
    private String review_title;
    private String review_cmt;
    private Date created_at;

    // Default constructor
    public Review() {
    }

    // Constructor with parameters
    public Review(int review_idx, int mem_idx, int room_idx, String review_title, String review_cmt, Date created_at) {
        this.review_idx = review_idx;
        this.mem_idx = mem_idx;
        this.room_idx = room_idx;
        this.review_title = review_title;
        this.review_cmt = review_cmt;
        this.created_at = created_at;
    }

    // Getters and setters for the fields

    public int getReview_idx() {
        return review_idx;
    }

    public void setReview_idx(int review_idx) {
        this.review_idx = review_idx;
    }

    public int getMem_idx() {
        return mem_idx;
    }

    public void setMem_idx(int mem_idx) {
        this.mem_idx = mem_idx;
    }

    public int getRoom_idx() {
        return room_idx;
    }

    public void setRoom_idx(int room_idx) {
        this.room_idx = room_idx;
    }

    public String getReview_title() {
        return review_title;
    }

    public void setReview_title(String review_title) {
        this.review_title = review_title;
    }

    public String getReview_cmt() {
        return review_cmt;
    }

    public void setReview_cmt(String review_cmt) {
        this.review_cmt = review_cmt;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }
}