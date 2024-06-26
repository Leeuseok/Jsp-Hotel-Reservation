package check;
import java.sql.Timestamp;

public class ReservationBean {

	private String start_date;
	private String end_date;
	private int room_idx;
	private Timestamp resev_at;
	private int resev_idx;
	private int room_price;
	private int resev_price;
	private int people;
	
	
	public int getResev_price() {
		return resev_price;
	}
	public void setResev_price(int resev_price) {
		this.resev_price = resev_price;
	}
	public int getResev_idx() {
		return resev_idx;
	}
	public void setResev_idx(int resev_idx) {
		this.resev_idx = resev_idx;
	}
	private int mem_idx;
	
	
	public int getMem_idx() {
		return mem_idx;
	}
	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
	}

	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public int getRoom_idx() {
		return room_idx;
	}
	public void setRoom_idx(int room_idx) {
		this.room_idx = room_idx;
	}
	public Timestamp getResev_at() {
		return resev_at;
	}
	public void setResev_at(Timestamp resev_at) {
		this.resev_at = resev_at;
	}
	public int getRoom_price() {
		return room_price;
	}
	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}

}
