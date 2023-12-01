<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="review.ReviewDAO" %>
<%@ page import="review.Review" %>

<%
try {
int review_idx = Integer.parseInt(request.getParameter("review_idx"));

// 리뷰DAO 초기화
ReviewDAO reviewDAO = new ReviewDAO();
Review existingReview = reviewDAO.getReview(review_idx);

// 리뷰가 존재하는지 확인
if (existingReview != null) {
    // 리뷰 삭제
    reviewDAO.delete(review_idx);
%>
<div class="container">
<h2>리뷰 삭제</h2>
<p>리뷰가 성공적으로 삭제되었습니다.</p>

</div>
<%
} else {
%>
<div class="container">
<p>삭제할 리뷰가 없습니다.</p>
</div>
<%
}
} catch (Exception e) {
e.printStackTrace();
// 필요에 따라 예외 처리를 수행합니다.
}
%>

<script> setTimeout(function(){ window.location.href = "reviews.jsp"; }, 1000); </script>