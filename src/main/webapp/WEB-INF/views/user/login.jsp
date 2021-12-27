<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
 <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
  
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<link href="<c:url value="/resources/css/userCSS/login.css"/>" rel="stylesheet">
<script type="text/javascript">
 	$(document).ready(function(){
 		console.log("document ready");
 		console.log($("#user_radio"));
 		$("#user_radio, #owner_radio").click(function(event){
 			console.log($("#loginForm"));
 			if(this.value == "user") {
				$("#loginForm").attr("action", "/restaurant/user/login");
			} else if (this.value == "owner") {
				$("#loginForm").attr("action", "/restaurant/owner/login");
			}
		});
 	});
 </script>

</head>
<body>
   <div id="root" class="root">
      <!-- 맨윗부분 -->
      <header class="shareit_header"> 
         <div>
            <a class="header-logo" href="메인페이지로 이동"><img src="/LoginHostUpdate/image/FindTableLogo.png" alt="shareit-logo"></a> 
            <a class="header-logo1" href="메인페이지로 이동">FindTable 사이트 가기</a> 
         </div>
      </header>
      
      <!-- 로그인 부분 -->
      <div>
         <main class="mainlogin"> 
            <div class="sc-kmisXD blbgsK">
               <img src="/LoginHostUpdate/image/FindTableLogo.png" alt="shareit-loginlogo">
            </div>
      
            <div class="welcomelogin"> 
                  <div class="title">로그인</div>
                  <p>🍖&nbsp;&nbsp;환영합니다.&nbsp;기다리고 있었습니다.&nbsp;&nbsp;🥩</p> 
            </div>
      			<div>
		       		<label for="user">user</label>
		       		<input type="radio" name="radio" id="user_radio" value="user" checked>
		       		<label for="owner">owner</label>
		       		<input type="radio" name="radio" id="owner_radio" value="owner">
		       	</div>	
               <form id="loginForm" method="post" action="/restaurant/user/login">
                     <label for="id" class="loginMiddle">
                     <span>아이디</span>
                     <input type="text" name="id" id="id" placeholder="아이디를 입력해주세요"></label>
      
                     <label for="pw" class="loginMiddle">
                     <span>비밀번호</span>
                     <input type="password" name="pw" id="pw" placeholder="비밀번호를 입력해주세요"></label>
      
                     <div class="FindIdPw">
                        <a href="아이디 비밀번호 찾기 창으로 이동">아이디/비밀번호 찾기</a>
                     </div>
                     <button type="submit" class="LoginEnter" id="LoginEn" >로그인</button>  
               </form>
                  <div class="social-logins social-logins-o"> 
                     <a href="#" class="kakao " name="kakao"><span>카카오</span></a>
                     <a href="#" class="naver " name="naver"><span>네이버</span></a>
                     <a href="#" class="google " name="google"><span>구글</span></a>
                  </div>                                                                           <!-- 회원가입 창으로 이동 -->
                  <p class="loginBottom">더 많은 서비스를 누려보세요!&nbsp;&nbsp;&nbsp;<a href="/LoginHostUpdate/signUp/signUp.html">회원가입</a></p> 
               </main> 
            </div>
         </div>

</body>
</html>