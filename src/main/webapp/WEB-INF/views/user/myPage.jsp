<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        img {
            vertical-align: top;
        }
        
        body {
            font-family: 'nanumsquare';
        }
        
        .wrap {
            margin: 50px;
            position: relative;
        }
        
        .wrap:after, ul:after,.cl:after,a:after {
            content: "";
            clear: both;
            display: block;
        }
        
        .blind {
            position: absolute;
            left: -9999px;
            width: 0;
            height: 0;
            font-size: 0;
            overflow: hidden;
        }
        
        header {
            height: 120px;
        }
        
        header h1 {
            padding: 25px 0;
        }
        
        .input_box #input_search #f {
            position: absolute;
            top: 50px;
            left: 180px;
            width: 200px;
            height: 30px;
            border-radius: 3px;
            border: 1px solid silver;
            line-height: 120px;
            margin-left: 40px;
            background: #222;
        }
        
        .input_box {
            position: absolute;
            top: 50px;
            left: 180px;
            width: 200px;
            height: 30px;
            border-radius: 3px;
            border: 1px solid silver;
            line-height: 120px;
            margin-left: 40px;
        }
        
        #search_btn {
            position: absolute;
            top: 50px;
            left: 250px;
            width: 15px;
            height: 15px;
            line-height: 120px;
            cursor: pointer;
        }
        
        header #gnb {
            position: absolute;
            right: 0;
            top: 50px;
        }
        
        header #gnb li {
            float: left;
            margin-right: 20px;
        }
        
        header #gnb li:last-child {
            margin-right: 0;
        }
        
        body {
            font-family: 'nanumsquare';
        }
        
        @font-face {
            font-family: 'NanumSquare';
            font-weight: 400;
            src: url(NanumSquareR.eot);
            src: url(NanumSquareR.eot?#iefix) format('embedded-opentype'), url(NanumSquareR.woff) format('woff'), url(NanumSquareR.ttf) format('truetype');
        }
        
        @font-face {
            font-family: 'NanumSquare';
            font-weight: 700;
            src: url(NanumSquareB.eot);
            src: url(NanumSquareB.eot?#iefix) format('embedded-opentype'), url(NanumSquareB.woff) format('woff'), url(NanumSquareB.ttf) format('truetype');
        }
        
        @font-face {
            font-family: 'NanumSquare';
            font-weight: 800;
            src: url(NanumSquareEB.eot);
            src: url(NanumSquareEB.eot?#iefix) format('embedded-opentype'), url(NanumSquareEB.woff) format('woff'), url(NanumSquareEB.ttf) format('truetype');
        }
        
        @font-face {
            font-family: 'NanumSquare';
            font-weight: 300;
            src: url(NanumSquareL.eot);
            src: url(NanumSquareL.eot?#iefix) format('embedded-opentype'), url(NanumSquareL.woff) format('woff'), url(NanumSquareL.ttf) format('truetype');
        }
        
        ul,li {
            list-style-type: none;
        }
        
        a {
            text-decoration: none;
            color: black;
        }
        
        a:hover {
            cursor: pointer;
        }
        
        .row {
            display: flex;
            margin: 30px 10px;
        }
        
        .col-4 {
            width: 200px;
            height: 600px;
            margin: 30px;
            padding: 30px 10px;
        }
        
        .menu_nav {
            padding: 0 0 30px 0;
        }
        
        .menu_title {
            padding: 5px;
        }
        
        .menu_nav li {
            padding: 5px;
        }
        
        .col-6 {
            width: 900px;
        }
        
        .ing_title {
            padding-bottom: 10px;
        }
        
        .ing_menu ul {
            display: flex;
            padding: 10px;
        }
        
        .ing_menu li {
            padding-right: 25px;
        }
        
        .empty_box {
            width: 100%;
        }
        
        .empty_img {
            margin: 100px 0 0 120px;
        }
        
        .empty_comment {
            width: 100%;
            margin: 0 0 0 140px;
        }
        .myInfo{
           width: 100%;
           padding: 0 80px;
        }
        .myInfo input{
           width:300px;
           padding:10px;
           margin:5px;
        }
        #updatePw_btn{
           background-color: lightgreen;
           border: none;
           color: white;
        }
    </style>
    <script>
       $(document).ready(function(){
          fnIngReserve();
          fnPresentPwCheck();
          fnPwCheck();
          fnPw2Check();
          fnUpdatePw();
          fnUpdateMember();
       });
       
       //진행중인 예약조회
       function fnIngReserve(){
          $('body').on('click', function(){
             $.ajax({
                
             });
          });
       }// end fnIngReserve
       
       // 현재 비밀번호 확인 
       let presentPwPass = false;
       function fnPresentPwCheck() {
          $('#pw0').keyup(function(){
             $.ajax({
                url: 'presentPwCheck',
                type: 'post',
                data: $('#f').serialize(),
                dataType: 'json',
                success: function(map){
                   if (map.result) {
                      presentPwPass = true;
                   } else {
                      presentPwPass = false;
                   }
                }
             });
          });
       }  // end fnPresentPwCheck
       
       // 새 비밀번호 입력 검증
       let pwPass = false;
       function fnPwCheck() {
          let regPw = /^[0-9]{1,10}$/; 
          $('#pw').keyup(function(){         
             if ( regPw.test($('#pw').val()) == false ) {
                pwPass = false;
             } else {
                pwPass = true;
             }
          });
       }  // end fnPwCheck
       
       // 새 비밀번호 입력 확인 변수와 함수
       let pwPass2 = false;
       function fnPw2Check(){
          $('#pw2').keyup(function(){         
             if ($('#pw').val() != $('#pw2').val()) {
                pwPass2 = false;
             } else {
                pwPass2 = true;
             }
          });
       }  // end fnPw2Check
       
       // 비밀번호 변경 함수
       function fnUpdatePw() {
          $('#updatePw_btn').click(function(){
             if ( presentPwPass == false ) {
                alert('현재 비밀번호를 확인하세요.');
                return;
             }
             else if ( pwPass == false || pwPass2 == false ) {
                alert('새 비밀번호 입력을 확인하세요.');
                return;
             }
             $('#f').attr('action', '/restaruant/user/updatePw');
             $('#f').submit();
          });
       }  // end fnUpdatePw
       
       // 이메일 중복체크 변수와 함수
       let emailPass = false;
       function fnEmailCheck() {
          if ( $('#email').val() == '${loginUser.email}' ) {
             emailPass = true;
             return;
          }
          let regEmail = /^[a-zA-Z0-9-_]+@[a-zA-Z0-9]+([.][a-zA-Z]{2,}){1,2}$/;
          if ( regEmail.test($('#email').val()) == false ) {
             alert('이메일 형식을 확인하세요.');
             emailPass = false;
             return;
          }
          $.ajax({
             url: '/restaruant/user/emailCheck',
             type: 'post',
             data: 'email=' + $('#email').val(),
             dataType: 'json',
             success: function(map){
                if (map.result == null) {
                   emailPass = true;
                } else {
                   alert('이미 사용 중인 이메일입니다. 다른 이메일을 입력하세요.');
                   emailPass = false;
                }
             },
             error: function(){
                emailPass = false;
             }
          });
       }  // end fnEmailCheck
       
       
       // 회원정보 변경 함수
       function fnUpdateMember() {
          fnEmailCheck();
          $('#updateMember_btn').click(function(){
             if ( $('#name').val() == '${loginUser.name}' && 
                 $('#email').val() == '${loginUser.email}' ) {
                alert('변경할 내용이 없습니다.');
                return;
             }
             else if ( emailPass == false ) {
                return;
             }
             $('#f').attr('action', '/restaruant/user/updateUser');
             $('#f').submit();
          });
       }  // end fnUpdateMember
       
       
       </script>
</head>
<body>
    <header>
        <div class="wrap">
            <!-- <div class="hamburger">


                </div> -->
            <h1>
                <a href="index.html">
                    <img src="image/projectlogo.png">
                </a>
            </h1>

            <!-- <div class="input_box">
                <form id="f">
                    <input type="text" value="식당을 검색하세요." id="input_search">
                    <input type="button" value="검색">
                </form>
            </div> -->

            <ul id="gnb">
                <li><a href="로그인페이지이동">로그인</a></li>
                <li><a href="#">회원가입</a></li>
                <li><a href="#">찜목록</a></li>
                <li><a href="myPage">마이페이지</a></li>
            </ul>
        </div>
    </header>
    <div class="container">
        <div class="row">
            <div class="col-4">
                <div class="menu_nav">
                    <h2 class="menu_title">예약내역</h2>
                    <ul>
                        <li><a href="ingReserve" class="menu_sub_title">진행중</a></li>
                        <li><a href="endReserve" class="menu_sub_title"> 완료</a></li>
                        <li><a href="cancleReserve" class="menu_sub_title">취소 / 환불</a></li>
                    </ul>
                </div>
                <div class="menu_nav">
                    <h2 class="menu_title">My 활동</h2>
                    <ul>
                        <li><a href="#">문의 내역</a></li>
                        <li><a href="#">My 관심상품</a></li>
                    </ul>
                </div>
                <div class="menu_nav">
                    <h2 class="menu_title">내 정보</h2>
                    <ul>
                        <li><a href="#">내 정보 수정</a></li>
                        <li><a href="#"> 본인 인증 / 재인증</a></li>
                    </ul>
                </div>
            </div>
            
            <div class="col-6">
                 
                <div>
                    <h2 class="ing_title">진행중인 예약</h2>
                </div>
                <hr>
                <div class="ing_menu">
                    <ul>
                        <li><a href="#">전체</a></li>
                        <li><a href="# ">승인 결제</a></li>
                        <li><a href="# ">실시간 결제</a></li>
                    </ul>
                </div> 
                <table>
                     <tbody>
                     <c:forEach var="reserve" items="ingReserve">
                        <tr>
                           <td>
                              <div id="paging"></div>
                           </td>
                        </tr>
                     </c:forEach>
                     </tbody> 
               </table>
            
                 
                <!-- 완료
                   <div>
                       <h2 class="ing_title">완료된 예약</h2>
                   </div>
                   <hr>
                   <table>
                        <tbody>
                        <c:forEach var="reserve" items="endReserve">
                           <tr>
                              <td>
                                 <div id="paging"></div>
                              </td>
                           </tr>
                        </c:forEach>
                        </tbody> 
                  </table>
                 
                 --> 
                 
                <!-- 취소/ 환불
                   <div>
                       <h2 class="ing_title">취소 / 환불</h2>
                   </div>
                  <div class="ing_menu">
                       <ul>
                           <li><a href="#">취소</a></li>
                           <li><a href="# ">환불</a></li>
                       </ul>
                   </div> 
                   <table>
                        <tbody>
                        <c:forEach var="reserve" items="cancleReserve">
                           <tr>
                              <td>
                                 <div id="paging"></div>
                              </td>
                              <td>
                                 <input type="button" value="취소하기" id="cancle_btn"> //취소하면 바로 환불?
                              </td>
                           </tr>
                        </c:forEach>
                        </tbody> 
                  </table>
                 
                 -->
                
                  <!--
                <div>
                    <h2 class="ing_title">내 정보 수정</h2>
                </div>
                <hr>
                <div class="ing_menu">
                    <ul>
                        <li><a href="#">정보 수정</a></li>
                        <li><a href="# ">본인인증 / 재인증</a></li>
                    </ul>
                </div> 
                <div>
                   <form id="f" method="post">
                      <input type="hidden" name="no" id="no" value="${loginUSer.no}">
                      <input type="hidden" name="id" id="id" value="${lpginUser.id}">
                      <div class="myInfo">
                         회원번호 : ${loginUser.no}<br><br>
                         
                         아이디: ${loginUser.id}<br><br>
                         
                     이름<br>
                     <input type="text" name="name" id="name" value="${loginUser.name}"><br><br>
                     
                     현재 비밀번호<br>
                     <input type="password" name="pw0" id="pw0" placeholder="현재비밀번호를 입력하세요"><br>
                     
                     새 비밀번호<br>
                     <input type="password" name="pw" id="pw" placeholder="변경할비밀번호를 입력하세요"><br>
                     <span id="pw_result"></span><br>
                     
                     비밀번호 확인<br>
                     <input type="password" name="pw2" id="pw2" placeholder="변경할 비밀번호를 한번더 입력하세요">
                     <span id="pw2_result"></span><br>
   
                     이메일<br>
                     <input type="text" name="email" id="email" value="${loginUser.email}"><br>
                     
                     <input type="button" value="수정하기" id="updatePw_btn" ><br>
                      </div>
                   </form>
                
                </div>
                 내정보 수정 -->    
                    
                 
                
                <div>
                    <div class="empty_box">
<<<<<<< HEAD
                        <img class="empty_img" src="/restaruant/resources/image/myPage/mangirl.png " width="200px" height="200px" alt="빈사진 ">
=======
                        <img class="empty_img" src="/restaruant/resources/image/myPage/mangirl.png " width="200 " height="200 " alt="빈사진 ">
>>>>>>> branch 'main' of https://github.com/leeujeong/ReserveRestuarant.git
                    </div>
                    <div class="empty_comment">
                           예약이 비어있습니다.
                    </div>
                </div>
              
            </div>
        </div>
     </div>
</body>
</html>