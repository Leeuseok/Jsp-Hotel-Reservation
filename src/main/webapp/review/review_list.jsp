<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="review.Review" %>
<%@ page import="review.ReviewDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰목록</title>
    <!-- Import Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">
    <div class="container mx-auto py-10">
        <!-- Back Button -->
        <a href="reviews.jsp" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">뒤로가기</a>

        <h1 class="text-3xl font-bold text-center mb-6">리뷰목록</h1>

        <%-- Fetch all reviews via ReviewDAO --%>
        <%
            ReviewDAO reviewDAO = new ReviewDAO();
            ArrayList<Review> reviewList = reviewDAO.getAllReviews();
        %>

        <%-- Show table only if there is at least one review --%>
        <% if (!reviewList.isEmpty()) { %>
            <table class="w-full bg-white border border-gray-300">
                <thead>
                    <tr>
                        <th class="border border-gray-300 px-4 py-2">Member id</th>
                        <th class="border border-gray-300 px-4 py-2">Created date</th>
                        <th class="border border-gray-300 px-4 py-2">Review title</th>
                        <th class="border border-gray-300 px-4 py-2">Review content</th>
                        <th class="border border-gray-300 px-4 py-2">Created date</th>
                        <th class="border border-gray-300 px-4 py-2">
                            Delete
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <%-- Repeat the row for each review --%>
                    <% for (Review review : reviewList) { %>
                        <tr>
                            <td class="border border-gray-300 px-4 py-2"><%= review.getMem_idx() %></td>
                            <td class="border border-gray-300 px-4 py-2"><%= review.getReview_title() %></td>
                            <td class="border border-gray-300 px-4 py-2"><%= review.getReview_title() %></td>
                            <td class="border border-gray-300 px-4 py-2"><%= review.getReview_cmt() %></td>
                            <td class="border border-gray-300 px-4 py-2"><%= review.getCreated_at() %></td>
                            <td class="border border-gray-300 px-4 py-2">
                                <form action="delete_review.jsp" method="post">
                                    <input type="hidden" name="review_idx" value="<%= review.getReview_idx() %>">
                                    <button type="submit" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">Delete</button>
                                </form>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } else { %>
            <p class="text-center text-gray-500">리뷰가 없습니다</p>
        <% } %>

        <!-- Add JavaScript or Bootstrap script here -->

    </div>
</body>
</html>