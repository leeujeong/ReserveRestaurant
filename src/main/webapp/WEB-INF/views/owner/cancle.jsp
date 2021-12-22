<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.css" integrity="sha512-4wfcoXlib1Aq0mUtsLLM74SZtmB73VHTafZAvxIp/Wk9u1PpIsrfmTvK0+yKetghCL8SHlZbMyEcV8Z21v42UQ==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<link href="<c:url value="/resources/css/index.css"/>" rel="stylesheet">
	<link href="<c:url value="/resources/css/owner.css"/>" rel="stylesheet">
	<script src="<c:url value="/resources/js/index.js"/>"></script>
	<script src="<c:url value="/resources/js/owner.js"/>"></script>
</head>
<body>
    <header>
        <div class="wrap">
            <h1>
                <a href="index.html">
                    <img src="/restaurant/resources/image/index/projectlogo.png">
                </a>
            </h1>
            <ul id="gnb">
                <li><a href="사용자페이지이동">LOGIN&nbsp;&nbsp;&nbsp;/</a></li>
                <li><a href="호스트로그인페이지이동">HOSTLOGIN</a></li>
                <li><a href="회원가입페이지이동">JOIN</a></li>
                <li><a href="찜목록페이지">FAVORITE</a></li>
                <li><a href="마이페이지이동">MYPAGE</a></li>
            </ul>
        </div>
    </header>

    <div class="container">
        <div class="row">
            <div class="col-4">
                <div class="menu_nav">
                    <h4 class="menu_title">나의 사업장</h4>
                    <ul>
                        <li><a href="addstore.html" class="menu_sub_title">등록하기</a></li>
                        <li><a href="cancel.html" class="menu_sub_title"> 사업장 관리</a></li>
                    </ul>
                </div>
                <div class="menu_nav">
                    <h4 class="menu_title">My 활동</h4>
                    <ul>
                        <li><a href="question.html">문의 내역</a></li>
                        <li><a href="#">리뷰 관리</a></li>
                    </ul>
                </div>
                <div class="menu_nav">
                    <h4 class="menu_title">내 정보</h4>
                    <ul>
                        <li><a href="info.html">내 정보 수정</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-6">
                <div class="section2">
                    <h4 class="ing_title">사업장 수정 / 삭제하기</h4>
                </div>
                <hr>
                  <div class="containers">
                    <div class="row">
                      <div class="col-sm-3">
                        <img src="../images/platter-g8605cb638_1920.jpg" class="store_img" >
                      </div>
                      <div class="col-sm-9">
                        <div class="row">
                          <div class="col-8 col-sm-6">
                            <h5>가게이름2</h5>
                            운영시간 랄랄랄랄랄
                            자세한 설명설명 설명설명
                          </div>
                          <div class="col-4 col-sm-6">
                            <input type="button" value="수정하기" id="update_btn" name="update_btn">
                            <input type="button" value="삭제하기" id="delete_btn" name="delete_btn">
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
            </div>    
        </div> 
        <script>
             $('#delete_btn').on('click',function(){
                if(confirm('[가게이름] 을 삭제할까요?')){
                alert('삭제했습니다.');
                }
            $('update_btn').on('click', function(){

            })
    });
        </script>      
    </div>
    <section id="bottom">
        <div class="wrap">
            <div class="footer">
                <div class="footer_inner">
                    <ul class="footer_link">
                        <li><a href="#" target="_blank" class="footer_item">이용약관&nbsp;|</a></li>
                        <li><a href="#" target="_blank" class="footer_item">개인정보처리방침&nbsp;|</a></li>
                        <li><a href="#" target="_blank" class="footer_item">책임의 한계와 법적고지&nbsp;|</a></li>
                        <li><a href="#" target="_blank" class="footer_item">회원정보 고객센터</a></li>
                    </ul>
                    <div class="footer_copy">
                        <a href="#" target="_blank">
                            <img src="/restaurant/resources/image/index/projectlogo.png" alt="logo">
                        </a>
                        <span class="text">Copyright</span>
                        <span class="corp" style="font-weight: 800;">&copy; FindTable Corp.</span>
                        <span class="text">All Rights Reserved.</span>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>