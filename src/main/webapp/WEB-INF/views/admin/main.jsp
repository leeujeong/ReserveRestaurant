<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/adminCSS/main.css"/>" rel="stylesheet">
</head>
<body>
    <header>
        <div class="wrap">
            <h1>
                <a href="/restaurant/admin/adminPage">
                    <img src="/restaurant/resources/image/index/projectlogo.png">
                </a>
            </h1>
            <ul id="gnb">
                <li>${loginUser.id} 님 환영합니다</li>
                <li><a href="로그아웃">LOGOUT&nbsp;&nbsp;&nbsp;</a></li>
            </ul>
        </div>
    </header>
    <div class="go">
        <div class="admin">
            <div class="admin_user">
                <a href="/restaurant/admin/userAdminPage" class="admin_go_link">
                    <span class="admin_go">회원 조회</span>
                </a>
            </div>
            <div class="admin_rest">
                <a href="/restaurant/admin/resAdminPage" class="admin_go_link">
                    <span class="admin_go">사업장 조회</span>
                </a>
            </div>
        </div>
        <div class="go_mainPage">
            <a href="/restaurant/main/mainPage" class="admin_go_link">
                <span class="main_go">메인 페이지 이동</span>
            </a>
        </div>
    </div>


</body>
</html>