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

        <form action="submit_review.jsp" method="post" class="max-w-md mx-auto">
            <div class="mb-4">
                <label for="mem_idx" class="block text-gray-700 text-sm font-bold mb-2">회원 ID:</label>
                <input type="text" name="mem_idx" required class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>

            <div class="mb-4">
                <label for="room_idx" class="block text-gray-700 text-sm font-bold mb-2">객실 ID:</label>
                <input type="text" name="room_idx" required class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>

            <div class="mb-4">
                <label for="review_title" class="block text-gray-700 text-sm font-bold mb-2">리뷰 제목:</label>
                <input type="text" name="review_title" required class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>

            <div class="mb-4">
                <label for="review_cmt" class="block text-gray-700 text-sm font-bold mb-2">리뷰 코멘트:</label>
                <textarea name="review_cmt" rows="4" required class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"></textarea>
            </div>



            <input type="submit" value="리뷰 작성" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
        </form>

        <!-- 여기에 자바스크립트 또는 부트스트랩 스크립트를 추가합니다 -->

    </div>
</body>
</html>