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
<link href="<c:url value="/resources/css/index.css"/>" rel="stylesheet">
<script src="<c:url value="/resources/js/index.js"/>"></script>


</head>
<body>
	
	<header>
        <div class="wrap">
            <div class="hamburger">

            </div>
            <h1>
                <a href="index.html">
                    <img src="/restaurant/resources/image/index/projectlogo.png">
                </a>
            </h1>

            <!-- <div class="input_box">
                <form id="f">
                    <input type="text" value="식당을 검색하세요." id="input_search">
                    <input type="button" value="검색">
                </form>
            </div> -->

            <ul id="gnb">
                <li><a href="로그인페이지이동">Login</a></li>
                <li><a href="#">Join</a></li>
                <li><a href="#">Favorite</a></li>
                <li><a href="user/myPage">Mypage</a></li>
            </ul>
        </div>
    </header>

    <div class="accordion">
        <div class="cate">
            <span class="menu">
                   <a href="#" class="menulink">Reservation</a>
                   <a href="javascript:void(0);" class="subopen"></a>
            </span>
            <ul>
                <li><a href="식당검색페이지">식당검색하러가기</a></li>
                <li><a href="식당검색페이지">놓치면 안되는 혜택 가득!</a></li>
                <li><a href="식당검색페이지">New 예약 오픈</a></li>
            </ul>
        </div>
        <div class="cate">
            <span class="menu"> 
                  <a href="#" class="menulink">Notice&Review</a>
                  <a href="javascript:void(0);" class="subopen"></a>
            </span>
            <ul>
                <li><a href="공지사항">공지사항</a></li>
                <li><a href="리뷰">리뷰</a></li>
            </ul>
        </div>
        <div class="cate">
            <span class="menu">
                <a href="#" class="menulink">Magazines</a>
                <a href="javascript:void(0);" class="subopen"></a>
             </span>
            <ul>
                <li>다이닝 매거진</li>
            </ul>
        </div>
    </div>
    <a href="addPage">사업자 페이지로 이</a>
    <a href="managePage">수정페이지로 이</a>




    <section class="main">
        <div class="wrap">
            <div id="frame">
                <ul class="slide">
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                </ul>
            </div>
            
            <a href="#none" class="prev">
                <img src="/restaruant/resources/image/index/prev.png" alt="이전">
            </a>
            <a href="#none" class="next">
                <img src="/restaruant/resources/image/index/next.png" alt="다음">
            </a>
            <ul class="page">
                <li class="num">3</li>
                <li>/ 3</li>
            </ul>
        </div>
    </section>

    <section id="location">
        <div class="wrap">
            <h3 class="h3_text">어디로 갈까요?</h3>
            <div class="location_wrap">
                <ul class="location_ul">
                    <li class="location_img">
                        <a href="해당페이지"><img src="/restaruant/resources/image/index/location.jpeg"></a>
                    </li>
                    <h3>위치검색</h3>
                    <p></p>
                </ul>
                <ul class="location_ul">
                    <li class="location_img">
                        <a href="해당페이지"><img src="/restaruant/resources/image/index/jamsil.jpg"></a>
                    </li>
                    <h3>잠실</h3>
                    <p></p>
                </ul>
                <ul class="location_ul">
                    <li class="location_img">
                        <a href="해당페이지"><img src="/restaruant/resources/image/index/yeouido.jpeg"></a>
                    </li>
                    <h3>여의도</h3>
                    <p></p>
                </ul>
                <ul class="location_ul">
                    <li class="location_img">
                        <a href="해당페이지"><img src="/restaruant/resources/image/index/busan.jpeg"></a>
                    </li>
                    <h3>부산</h3>
                    <p></p>
                </ul>
                <ul class="location_ul">
                    <li class="location_img">
                        <a href="해당페이지"><img src="/restaruant/resources/image/index/sokcho.jpeg"></a>
                    </li>
                    <h3>속초</h3>
                    <p></p>
                </ul>
                <ul class="location_ul">
                    <li class="location_img">
                        <a href="해당페이지"><img src="/restaruant/resources/image/index/jejudo.jpeg"></a>
                    </li>
                    <h3>제주도</h3>
                    <p></p>
                </ul>

            </div>
        </div>
    </section>

    <section id="new">
        <div class="wrap">
            <h3 class="h3_text"> <span style="color: crimson;">New </span>신규 오픈 식당!</h3>
            <ul>
                <li>
                    <a><img src="/restaruant/resources/image/index/rest1.jpg"></a>
                    <h3>몽탄</h3>
                    <p>맛있어요</p>
                </li>
                <li>
                    <a><img src="/restaruant/resources/image/index/rest2.jpg"></a>
                    <h3>몽탄</h3>
                    <p>맛있어요</p>
                </li>
                <li>
                    <a><img src="/restaruant/resources/image/index/rest3.jpg"></a>
                    <h3>몽탄</h3>
                    <p>맛있어요</p>
                </li>
                <li>
                    <a><img src="/restaruant/resources/image/index/rest4.jpg"></a>
                    <h3>몽탄</h3>
                    <p>맛있어요</p>
                </li>
            </ul>
        </div>
    </section>

    <section id="review">
        <div class="wrap">
            <h3 class="h3_text"> <span style="color: crimson;">New </span>리얼 리뷰 Pick!</h3>
            <div class="box-wrap">
                <div class="box">
                    <div class="img">
                        <a href="해당식당으로이동">
                            <img src="/restaruant/resources/image/index/rest2.jpg" alt="Hover Effect">
                        </a>
                    </div>
                    <div class="info">
                        <h3>연우식당</h3>
                        <p>고향이 생각나는 그리운 맛이예요.</p>
                    </div>
                </div>
                <div class="box">
                    <div class="img">
                        <a href="해당식당으로이동">
                            <img src="/restaruant/resources/image/index/rest3.jpg" alt="Hover Effect">
                        </a>
                    </div>
                    <div class="info">
                        <h3>골목짬뽕</h3>
                        <p>해장으로 딱 입니다.</p>
                    </div>
                </div>
                <div class="box">
                    <div class="img">
                        <a href="해당식당으로이동">
                            <img src="/restaruant/resources/image/index/rest1.jpg" alt="Hover Effect">
                        </a>
                    </div>
                    <div class="info">
                        <h3>츠키마</h3>
                        <p>일식이 생각날떈 여기로 올 것 같아요!</p>
                    </div>
                </div>
                <div class="box">
                    <div class="img">
                        <a href="해당식당으로이동">
                            <img src="/restaruant/resources/image/index/rest4.jpg" alt="Hover Effect">
                        </a>
                    </div>
                    <div class="info">
                        <h3>몽탄</h3>
                        <p>기대가 크면 실망도 큽니다..</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section id="bottom">
        <div class="wrap">
            <div class="footer">
                <div class="footer_inner">
                    <ul class="footer_link">
                        <li><a href="#" target="_blank" class="footer_item">이용약관</a></li>
                        <li><a href="#" target="_blank" class="footer_item">개인정보처리방침</a></li>
                        <li><a href="#" target="_blank" class="footer_item">책임의 한계와 법적고지</a></li>
                        <li><a href="#" target="_blank" class="footer_item">회원정보 고객센터</a></li>
                    </ul>
                    <div class="footer_copy">
                        <a href="#" target="_blank">
                            <span class="footer_logo">
                                <span class="blind" style="display: none;">파인드테이블</span>
                            </span>
                        </a>
                        <span class="text">Copyright</span>
                        <span class="corp">&copy; FindTable Corp.</span>
                        <span class="text">All Rights Reserved.</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

	
	
</body>
</html>