<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/57a8fee989.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/footer.css">
</head>

<footer class="footer py-3 text-dark">
    <div class="container d-flex flex-column flex-md-row justify-content-between align-items-center">
        <div class="mb-3 mb-md-0">
            <a href="<%=request.getContextPath()%>/index.do" class="h4 text-decoration-none text-dark">Manolja</a>
        </div>

        <div class="d-flex flex-column flex-md-row align-items-center mb-3 mb-md-0">
            <ul class="list-unstyled d-flex flex-wrap justify-content-center justify-content-md-start mb-3 mb-md-0">
                <li class="mx-2"><a href="#" class="text-dark text-decoration-none">고객센터</a></li>
                <li class="mx-2"><a href="#" class="text-dark text-decoration-none">이용약관</a></li>
                <li class="mx-2"><a href="#" class="text-dark text-decoration-none">개인정보처리방침</a></li>
            </ul>
        </div>

        <div>
            <a href="#" class="text-dark text-decoration-none mx-2"><i class="fab fa-instagram"></i></a>
            <a href="#" class="text-dark text-decoration-none mx-2"><i class="far fa-comments"></i></a>
            <a href="#" class="text-dark text-decoration-none mx-2"><i class="fab fa-youtube"></i></a>
        </div>

        <div class="text-secondary p-4">
            <p class="mb-1">CEO: 정유진</p>
            <p class="mb-1">T. 053-940-5555</p>
            <p class="mb-1">대구광역시 북구 복현로 35</p>
            <p>&copy; 2023 JSP_PROJECT</p>
        </div>
    </div>
</footer>


<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"></script>
