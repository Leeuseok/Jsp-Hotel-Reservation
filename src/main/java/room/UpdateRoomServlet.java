package room;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import room.*;

@WebServlet("/room/updateroom_process")
public class UpdateRoomServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        RoomMgr roomMgr = new RoomMgr();
        RoomBean room = new RoomBean();
        
        room.setRoom_idx(Integer.parseInt(request.getParameter("room_id")));
//        room.setMem_idx(Integer.parseInt(request.getParameter("mem_idx")));
        room.setRoom_title(request.getParameter("room_title"));
//        room.setRoom_kind(Integer.parseInt(request.getParameter("room_kind")));
        room.setRoom_people(Integer.parseInt(request.getParameter("room_people")));
        room.setRoom_detail(request.getParameter("room_detail"));
        room.setRoom_area(request.getParameter("room_area"));
        room.setRoom_guide(request.getParameter("room_guide"));
        room.setRoom_map(request.getParameter("room_map"));
        room.setRoom_price(Integer.parseInt(request.getParameter("room_price")));
        room.setRoom_num(Integer.parseInt(request.getParameter("room_num")));
        
        boolean isUpdated = roomMgr.updateRoom(room);
        
        if (isUpdated) {
            response.sendRedirect("updateSuccess.jsp");
        } else {
            response.sendRedirect("updateFail.jsp");
        }
    }
}
