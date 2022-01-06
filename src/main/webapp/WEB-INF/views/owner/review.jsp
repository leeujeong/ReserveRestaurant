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
	
	
	
	
	<style>
		.reviewimg{
			width:200px;
			height:100px;
		}
		.dateinput{
			border:none;
			outline:none;
		}
		.reviewContent{
			display:flex;
			margin:5px;
		}
		.reviewContentbox{
			margin:50px;
		}
		.reviewDetail{
			margin:5px;
		}
		.reviewMultiple{
			display:flex;
			margin:10px;
		}
		
		.showhideBtn{
			width: 100px;
		    border: 2px solid red;
		    color: red;
		    padding: 5px;
		    border-radius: 10px;
		}
		#noneDiv{
			margin:30px;
		}
	</style>
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
                <li><a href="/restaurant/owner/logout">LOGOUT</a></li>
                <li><a href="/restaurant/owner/bookPage">MYPAGE</a></li>
            </ul>
        </div>
    </header>
    
    <div class="container">
        <div class="row">
            <div class="col-4">
                <div class="menu_nav">
                    <h4 class="menu_title">나의 사업장</h4>
                    <ul>
                        <li><a href="addPage" class="menu_sub_title">등록하기</a></li>
                        <li><a href="managePage" class="menu_sub_title"> 사업장 관리</a></li>
                        <li><a href="bookPage" class="menu_sub_title"> 예약 관리</a></li>
                    </ul>
                </div>
                <div class="menu_nav">
                    <h4 class="menu_title">My 활동</h4>
                    <ul>
                        <li><a href="questionPage">문의 내역</a></li>
                        <li><a href="reviewPage">리뷰 관리</a></li>
                    </ul>
                </div>
                <div class="menu_nav">
                    <h4 class="menu_title">내 정보</h4>
                    <ul>
                        <li><a href="modifyOwner?ownerNo=${loginUser.ownerNo}">내 정보 수정</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-6">
                <div class="section2">
                    <h4 class="ing_title">리뷰 관리</h4>
                </div>
                <hr>
                <div>
	               <c:if  test="${empty reviewlist}">
			 			<div>
			 				작성된 리뷰가 없습니다.
			 			</div>
			 		</c:if>
			 		<c:if test="${not empty reviewlist}">
				 		<c:forEach var="review" items="${reviewlist}">
				 		<input type="hidden" value="${review.get('REVIEW_NO')}">
			            	<div>
			            		<h3>${review.get("RES_NAME")}</h3>
			            		<img alt="${review.get('REVIEW_ORIGIN')}" src="/restaurant/${review.get('REVIEW_PATH')}/${review.get('REVIEW_SAVED')}" class="reviewimg">
			                    <div class="reviewContent">
			                        <div class="reviewdaterate">
				                        <p style="margin:5px;">${review.get("REVIEW_WRITER")}</p>
				                        <span><input type="text" class="dateinput" value="${review.get('REVIEW_DATE')}"></span>
				                        <span style="margin:0 5px; color:red; " >${review.get("REVIEW_RATE")}</span>
			                        </div>
			                        <p style="margin:0 5px;">${review.get("REVIEW_CONTENT")}</p>
			                    </div>
			            	</div>
			            	<input type="button" value="댓글달기" onclick="location.href='/restaurant/owner/reviewReply?reviewNo='+'${review.get('REVIEW_NO')}'">
			            </c:forEach>
			 		</c:if>
                         
               </div>
            </div>
        </div>
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
