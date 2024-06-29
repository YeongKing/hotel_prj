<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    info="공지사항" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">

<title>공지사항 - 공지사항 목록 | 엘리시안호텔</title>

<!-- S head css -->
<jsp:include page="/WEB-INF/views/user/common/head_css.jsp"></jsp:include>
<link href="http://localhost/hotel_prj/static/home/css/ko/pc/contents.css" rel="stylesheet" type="text/css">
<!-- E head css -->

<!-- S head script -->
<jsp:include page="/WEB-INF/views/user/common/head_script.jsp"></jsp:include>
<!-- E head script -->

<script async src="https://www.googletagmanager.com/gtag/js?id=UA-173355219-1"></script>
 </head>
 <body>
    <noscript>
        <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NP6NJMP" height="0" width="0" style="display:none;visibility:hidden"></iframe>
    </noscript>
    <div class="skip"><a href="#container">본문 바로가기</a></div>
    <div class="wrapper">
         <!--S header  -->
<jsp:include page="/WEB-INF/views/user/header.jsp"></jsp:include>
 <!--E header  -->


<script>
function fncGoList(ctgry){
	jQuery("#_method").val("list");
	jQuery("#searchCtgry").val(ctgry);
    jQuery("#form").attr("action", "http://localhost/hotel_prj/user/notice.do");
    jQuery("#form").attr("method", "get");
    jQuery("#form").submit();
}

function fncGoView(noticeNum,num){
    jQuery("#noticeNum").val(noticeNum);
    
    jQuery("#page").val(Math.ceil(num / 10));
    jQuery("#num").val(num);
    jQuery("#form").attr("action", "http://localhost/hotel_prj/user/noticeDetail.do");
    jQuery("#form").attr("method", "get");
    jQuery("#form").submit();
}
</script>

<form action="/board/list.do" method="get" id="form">
<input type="hidden"name="noticeNum" id="noticeNum" value="" />

<input type="hidden" id="num" name="num" value="${num}" />
<input type="hidden" id="page" name="page" value="${nVO.page}" />
<input type="hidden" id="searchDataValue" name="searchDataValue" value="${nVO.searchDataValue }" />


<div id="container" class="container membership">
	<h1 class="hidden">통합 멤버십</h1>
	<div class="inner">
		<div class="mbsDetailCont">
			<div class="detailView">
				<h2 class="tit">${nd.noticeTitle}</h2>
				<ul class="infoData">
					<li>엘리시안 서울</li>
					<li>${nd.noticeInputdate}</li>
					<li>조회수 : ${nd.noticeViewCnt}</li>
				</ul>
				<div class="txtBox">
					${nd.noticeContent}
				</div>
				<ul class="shortList"> 
				    <c:if test="${prevND != null}">
				        <li class="prev">
				            <span>이전 글</span>        
				            <a href="#none" onclick="fncGoView('${prevND.noticeNum}',${num+1}); return false;" class="ellipsis">
				                ${prevND.noticeTitle}
				            </a>
				        </li>
				    </c:if>    
				    <c:if test="${prevND == null}">
				        <li class="prev">
				            <span>이전 글</span>
				            이전 글이 없습니다.
				        </li>
				    </c:if>
				    <c:if test="${nextND != null}">
				        <li class="next">
				            <span>다음 글</span>        
				            <a href="#none" onclick="fncGoView('${nextND.noticeNum}',${num-1}); return false;" class="ellipsis">
				                ${nextND.noticeTitle}
				            </a>
				        </li>
				    </c:if>    
				    <c:if test="${nextND == null}">
				        <li class="next">
				            <span>다음 글</span>
				            다음 글이 없습니다.
				        </li>
				    </c:if>
				</ul>
				<div class="btnArea">
					<a href="#none" onclick="fncGoList();" class="btnSC btnL">목록</a>
				</div>
			</div>
		</div>
	</div>
</div>
</form>
<!--S footer  -->
<jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
<!--E footer  -->
        
    </div>
    
</body>
</html>


