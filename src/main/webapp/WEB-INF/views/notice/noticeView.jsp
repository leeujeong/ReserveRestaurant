<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
<link href="<c:url value="/resources/css/notice.css"/>" rel="stylesheet">
<script src="<c:url value="/resources/js/notice.js"/>"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
	
 
<script type="text/javascript">
	$(document).ready(function() {
		fnDeleteNotice();
		
	});
	
	
	function fnReplyInsert() {
		$('#reply_btn').on('click', function () {
			if( $('#replyContent').val() == '' ) {
				alert('댓글 내용을 입력해주세요.');
			} else if ( $('#replyWriter').val() == '' ) {
				alert('로그인이 필요합니다.');
				location.href='/restaurant/user/loginPage';
			}
			
			$.ajax({
				url :'/restaurant/reply/addReply',
				type : 'post',
				contentType: 'application/json',
				data : JSON.stringify({
					replyWriter : $('#replyWriter').val(),
					replyContent : $('#replyContent').val(),
					noticeNo :$('#noticeNo').val()
					
				}),
				dataType : 'json',
				success : function (map) {
					if(map.result > 0){
					alert('성공');
						
					} else{
						
						alert('실패');
					}
				},
				error: function(xhr){
					if (xhr.status == 500) {
						alert(xhr.responseText);
					} else if (xhr.status == 501) {
						alert(xhr.responseText);
					}
				}
			});
		});
	}// fnreplyInsert
	
	
	
	function fnDeleteNotice() {
		$('#delete_btn').on('click', function () {
			if(confirm('삭제할까요?')){
				$('#f').attr('action', '/restaurant/notice/deleteNotice');
				$('#f').submit();
			}
		});
		
	}// fndeleteNotice
	
	
	
	
	 
</script>

<style>
	a{
	text-decoration: none;
	color: black;
}
h3{margin-left: 100px;}
.container{width: 1000px;}
#title_box{
	font-size: 22px;
	font-weight: bold;
}
.card{
	margin: 0 auto;
}
.top_btn{
	float: right;
}

#f{
	margin-top: 100px;
}

.mb-3{
	margin-top: 50px;
	border-bottom: 1px solid silver;
	border-top:  1px solid silver;
}
	
</style>

</head>
<body>
	
	  <header>
        <div class="wrap">
            <h1>
                <a href="/restaurant/">
                    <img src="/restaurant/resources/image/index/projectlogo.png">
                </a>
                
            </h1>
            <ul id="gnb">
            
            	<li><a href="/restaurant/admin/searchPage"><i class="fas fa-search fa-lg"></i></a></li> 
            
            	<c:if test="${loginUser == null}">
	                <li><a href="/restaurant/user/loginPage">LOGIN&nbsp;&nbsp;&nbsp;/</a></li>
	                <li><a href="/restaurant/user/join">JOIN&nbsp;&nbsp;&nbsp;</a></li>
            	</c:if>
            	
            	<!-- 사용자 state =1 -->
            	<c:if test="${loginUser.state == 1}">
            			<li>${loginUser.id} 님 환영합니다</li>
            		  <li><a href="/restaurant/user/logout">LOGOUT&nbsp;&nbsp;&nbsp;/</a></li>
            		  <li><a href="/restaurant/user/myPage">MYPAGE&nbsp;&nbsp;&nbsp;</a></li>
            	</c:if>
            	
            	<!-- 관리자 state 2 -->
            	<c:if test="${loginUser.state == 2}">
            		  <li>${loginUser.id} 님 환영합니다&nbsp;&nbsp;&nbsp;/</li>
            		  <li><a href="/restaurant/admin/adminPage">ADMIN PAGE</a></li>
            	</c:if>
            	
            	<!-- 사업자는 어떻게? -->
              <c:if test="${loginUser.state == 3}">
            		  <li>${loginUser.id} 님 환영합니다&nbsp;&nbsp;&nbsp;/</li>
            		  <li><a href="/restaurant/owner/logout">LOGOUT&nbsp;&nbsp;&nbsp;/</a></li>
            		  <li><a href="/restaurant/owner/managePage">OWNER PAGE</a></li>
            	</c:if>
                
                
            </ul>
        </div>
    </header>

    <div class="accordion">
        <div class="cate quickmenu">
            <span class="menu">
                <a href="#" class="menulink">Reservation</a>
                <a href="javascript:void(0);" class="subopen"></a>
            </span>
            <ul>
                <li><a href="/restaurant/admin/searchPage"> 식당검색  </a></li>
                <li><a href="식당검색페이지"> 할인되는식당</a></li>
                <li><a href="#"> 신규오픈 </a></li>
            </ul>
        </div>
        
        <div class="cate quickmenu">
            <span class="menu"> 
                <a href="#" class="menulink">Board</a>
                <a href="javascript:void(0);" class="subopen"></a>
            </span>
            <ul>
                <li><a href="/restaurant/notice/selectNoticeList"> 공지사항 </a></li>
                <li><a href="리뷰"> 리뷰 </a></li>
                <li><a href="리뷰"> Q&A </a></li>
            </ul>
        </div>
        
        <div class="cate quickmenu">
            <span class="menu">
                <a href="#" class="menulink">Magazines</a>
                <a href="javascript:void(0);" class="subopen"></a>
            </span>
            <ul>
                <li><a href="/restaurant/user/detail">다이닝 매거진</a></li>
            </ul>
        </div>
    </div>
	
	<div class="container">
			 <div style="width: 600px;">
	             <h2 class="ing_title">FindTable에서 알려드립니다 !</h2>
             </div>
	         <hr>
	         <div class="top_btn">
		         <input type="button" class="btn btn-danger" id="update_btn" value="수정" onclick="location.href='/restaurant/notice/noticeDetailByNo?noticeNo='+${notice.noticeNo}">
		         <input type="button" class="btn btn-danger" id="delete_btn" value="삭제">
     		     <input type="button" class="btn btn-danger" id="update_btn" value="목록" onclick="location.href='/restaurant/notice/selectNoticeList'">
	         </div>
			  <div class="row">
			    <div class="col-sm-8">
			     <input style="height: 50px; font-size:20px; width: 400px;"type="text" class="form-control" placeholder="${notice.noticeTitle}" aria-label="First name" id="title_box"readonly> 
			    </div>
			    <div class="col-sm-4"> <input style="height: 50px; width: 80px; border-right: none;"type="text" class="form-control" placeholder="조회:&nbsp;&nbsp;${notice.noticeHit}" aria-label="State" readonly > </div>
			  </div>
			  <div class="row">
			    <div class="col-sm">작성자 : ${notice.noticeWriter}</div>
			    <div class="col-sm"></div>
			    <div class="col-sm">등록일 : ${notice.noticeDate}</div>
			    
			    <div class="form-floating">
				  <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 300px" readonly >${notice.noticeContent}</textarea>
				  <label for="floatingTextarea2">내용</label>
				</div>
			  </div>
		
			<div>
		



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