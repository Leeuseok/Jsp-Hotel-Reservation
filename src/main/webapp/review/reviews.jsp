<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="review.Review"%>
<%@ page import="review.ReviewDAO"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 홈</title>
    <!-- Tailwind CSS 가져오기 -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        table {
            border-spacing: 0;
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #e2e8f0;
            padding: 8px;
            text-align: center;
        }
    </style>
</head>
<jsp:include page="/header.jsp"/>
 <body class="bg-gray-100">
    <div class="container mx-auto py-10">
        <h1 class="text-3xl font-bold text-center mb-6">리뷰</h1>

        <!-- ReviewDAO를 통해 상위 3개의 리뷰 가져오기 -->
        <% 
            ReviewDAO reviewDAO = new ReviewDAO();
            ArrayList<Review> recentReviews = reviewDAO.getMostRecentReviews(3);
        %>

        <!-- 리뷰가 최소한 하나 이상 있는 경우에만 테이블 표시 -->
        <% if (!recentReviews.isEmpty()) { %>
            <table>
                <thead>
                    <tr>
                        <th>리뷰 제목</th>
                        <th>리뷰 내용</th>
                        <th>작성 날짜</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- 상위 3개 리뷰에 대한 행 반복 출력 -->
                    <% for (Review review : recentReviews) { %>
                        <tr>
                            <td><%= review.getReview_title() %></td>
                            <td><%= review.getReview_cmt() %></td>
                            <td><%= review.getCreated_at() %></td>
                         
                        </tr>
                    <% } %>
                </tbody>
            </table>

            <!-- 세부 정보 보기 섹션 -->
            <div id="detailedView" style="display: none;">
                <h2>세부 리뷰</h2>
                <div id="detailedContent"></div>
                <button onclick="hideDetailedView()">닫기</button>
            </div>

            <!-- 나머지 리뷰 목록으로 이동하는 링크 -->
            <div class="mt-6 text-center">
                <a href="review_list.jsp" class="text-blue-500">더 많은 리뷰 보기</a>
            </div>
        <% } else { %>
            <p class="text-center text-gray-500">리뷰가 없습니다</p>
        <% } %>

        <!-- 리뷰 작성 폼으로 이동하는 폼 -->
        <div class="mt-6 text-center">
            <form action="review_form.jsp" method="get">
                <input type="submit" value="리뷰 작성"
                    class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
            </form>
        </div>
    </div>

    <script>
        function showDetailedView(reviewId) {
            // AJAX를 사용하여 reviewId를 기반으로 세부 리뷰 내용을 가져옵니다.
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    // fetched 내용으로 detailedContent div 업데이트
                    document.getElementById("detailedContent").innerHTML = xhr.responseText;
                    // detailedView div 표시
                    document.getElementById("detailedView").style.display = "block";
                }
            };
            // 'your_fetch_details_url'을 실제 세부 리뷰 내용을 가져올 URL로 교체합니다.
            xhr.open("GET", "your_fetch_details_url?reviewId=" + reviewId, true);
            xhr.send();
        }

        function hideDetailedView() {
            // detailedView div 숨김
            document.getElementById("detailedView").style.display = "none";
        }
    </script>
</body>
<jsp:include page="/footer.jsp"/>
</html>