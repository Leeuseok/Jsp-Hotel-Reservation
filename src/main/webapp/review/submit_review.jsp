<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="review.ReviewDAO" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 작성</title>
    <!-- Tailwind CSS를 가져옵니다 -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">
    <div class="container mx-auto py-10">
        <h1 class="text-3xl font-bold text-center mb-6">리뷰 작성</h1>

        <%
            ReviewDAO reviewDAO = new ReviewDAO();

            String memIdxStr = request.getParameter("mem_idx");
            String roomIdxStr = request.getParameter("room_idx");
            String reviewTitle = request.getParameter("review_title");
            String reviewCmt = request.getParameter("review_cmt");

            try {
                int memIdx = Integer.parseInt(memIdxStr);
                int roomIdx = Integer.parseInt(roomIdxStr);

                // Write the review to the database
                int reviewIdx = reviewDAO.write(memIdx, roomIdx, reviewTitle, reviewCmt);

                if (reviewIdx != -1) {
                    // Review successfully saved
                    out.println("<p>리뷰를 작성해 주셔서 감사합니다 ~ 리뷰 ID: " + reviewIdx + "</p>");

                    // Redirect to reviews.jsp after a delay (3 seconds)
                    response.setHeader("Refresh", "3; URL=reviews.jsp");
                } else {
                    // Error saving the review
                    out.println("<p>리뷰를 저장하는 중 오류가 발생했습니다.</p>");
                }
            } catch (NumberFormatException e) {
                out.println("<p>유효하지 않은 회원 ID 또는 객실 ID입니다.</p>");
            }
        %>

        <!-- 여기에 자바스크립트 또는 부트스트랩 스크립트를 추가합니다 -->

    </div>
</body>
</html>