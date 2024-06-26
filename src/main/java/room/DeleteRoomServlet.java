package room;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import room.*;

@WebServlet("/room/deleteroom_process")
public class DeleteRoomServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        RoomMgr roomMgr = new RoomMgr();
        RoomBean room = new RoomBean();
        
        room.setRoom_idx(Integer.parseInt(request.getParameter("room_idx")));
        
        boolean isDeleted = roomMgr.deleteRoom(room);
        
        if (isDeleted) {
            response.sendRedirect("deleteSuccess.jsp");
        } else {
            response.sendRedirect("deleteFail.jsp");
        }
    }
}
