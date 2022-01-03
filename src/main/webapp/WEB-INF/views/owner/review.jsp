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
	</style>
	<script>
	/* $(document).ready(function(){

    		$('#ondisplay').click(function(){
    			if($('#reply_form').css("display") == "none"){
    				$('#reply_form').show();
    			}
    		});
  
    	
    		$('#offdisplay').click(function(){
    			if($('#reply_form').css("display") != "none"){
    				$('#reply_formt').hide();
    			}
    		});
    
		
	}); */
    	
    	
    </script>
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
                <li><a href="/restaurant/owner/managePage">MYPAGE</a></li>
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
                    <table class="question_table">
                        <thead>
                            <tr>
                                <td>번호</td>
                                <td>작성자</td>
                                <td>식당명</td>
                                <!-- <td>내용</td> -->
                                <td>사진</td>
                                <td>리뷰 내용</td>
                                <td>작성일자</td>
                                <td>조회수</td>
                                <td></td>
                            </tr>
                        </thead>
                       <tbody>
							<c:if test="${empty reviewlist}">
								<tr>
									<td colspan="7">등록된 리뷰 없음</td>
								</tr>
							</c:if>
							<c:if test="${not empty reviewlist}">
								<c:forEach var="review" items="${reviewlist}">
								<%-- 	<c:if test="${review.state == 0}"> --%>
										<tr>
											<td>${review.reviewNo}</td>				
											<td>${review.get("REVIEW_WRITER")}</td>
											<td>${review.get("RES_NAME")}</td>
											<%-- <td>
												<div class="replyinput">
													<!-- depth만큼 들여쓰기 -->
													<c:forEach begin="1" end="${review.depth}">&nbsp;</c:forEach>
													
													<!-- 댓글(depth 1 이상) ㄴ -->
													<c:if test="${review.depth >= 1}">ㄴ</c:if>
													
													<!-- 20자 이내는 그대로 표시 -->
													<c:if test="${review.content.length() < 20}">
														<a href="view.review?fNo=${review.fNo}">${review.content}</a>&nbsp;&nbsp;&nbsp;
													</c:if>
													
													<!-- 20자 넘어가면 20자만 표시 -->
													<c:if test="${review.content.length() >= 20}">
														<a href="view.review?fNo=${review.fNo}">${review.content.substring(0, 20)}</a>&nbsp;&nbsp;&nbsp;
													</c:if>
													
													<a class="reply_link">댓글달기</a>
													
												</div>
											</td> --%>
											<td>
												<img alt="${review.get('REVIEW_ORIGIN')}" src="/restaurant/${review.get('REVIEW_PATH')}/${review.get('REVIEW_SAVED')}" class="reviewimg">
											</td>
											<td>${review.reviewContent}</td>
											<td><input type="text" value="${review.get('REVIEW_DATE')}" class="dateinput"></td>
											<td>${review.reviewHit}</td>
											<td><button onclick="ondisplay">댓글달기</button><button onclick="offdisplay">댓글 숨기기</button></td>				
										</tr>
											<tr id="reply_form">
												<td colspan="6">
													<form action="insertReply/review" method="post">
														<!-- 원글의 DEPTH, GROUPNO, GROUPORD를 넘겨줌. -->
														<input type="hidden" name="depth" value="${review.depth}">
														<input type="hidden" name="groupNo" value="${review.groupNo}">
														<input type="hidden" name="groupOrd" value="${review.groupOrd}">
														<input type="text" name="writer" value="${loginUser.id}" readonly>
														<input type="text" name="content" placeholder="내용">
														<button>댓글달기</button>
													</form>
												</td>
											</tr>
										
								<%-- 	</c:if> --%>
									
								</c:forEach>
							<</c:if> 
						</tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
<!--     <script>
    	function ondisplay(){
    		$('#form').show();
    	}
    	function offdisplay(){
    		$('#form').hide();
    	}   
    </script> -->
       <form id="f" method="post">
         <div class="card mb-2" style="width: 1000px;">
            <div class="card-header bg-light">
                    <i class="fa fa-comment fa"></i> 댓글
            </div>
            <div class="card-body">
               <ul class="list-group list-group-flush">
                   <li class="list-group-item">
                  <div class="form-inline mb-2" style="display: flex">
                     <label for="replyId"><i class="fa fa-user-circle-o fa-2x"></i></label>
                     <input type="text" class="form-control ml-2" placeholder="로그인유저 이름" id="replyId" style="width: 100px; margin-right: 710px;" value="${loginUser.name}" >
                     <input type="text" class="form-control ml-2" placeholder="등록일" id="" style="width: 120px;" value="${notice.noticeDate}" >
                  </div>
                  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                  <input type="button" class="btn btn-dark mt-3" value="댓글작성하기">
                   </li>
               </ul>
            </div>
         </div>
      </form>
    
    
    
    
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
