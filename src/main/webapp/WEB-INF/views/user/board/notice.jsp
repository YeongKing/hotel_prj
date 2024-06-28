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
            $(document).on("click",".headArea .btnMenu",function(){
                if(jQuery(this).hasClass("menuOn")){
                    var expsrCount = 3;
                    var $loungeList = jQuery(".menuDepth-add .gnb-thum li");
                    var randomArray = generateRandomNumberArray(expsrCount, $loungeList.length);
                    $loungeList.addClass("hidden");
                    $loungeList.each(function(index){
                        if(randomArray.indexOf(index) > -1){
                            $(this).removeClass("hidden");
                        }
                    });
                }
            })
        </script>
        
        
        <script>
            $(document).ready(function(){
/*             	//json데이터로 화면구성 --> 임시로 구성해놨음 수정필요!!
            	$.getJSON('notice.json',function(data){
            		
            		
            		var noticeList = '';
            		$.each(data, function(key, value){
            	          noticeList += '<li>' +
                          '<div class="titArea">' +
                              '<strong class="listTit">' + value.category + '</strong>' +
                              '<span class="opValue">' + value.question + '</span>' +
                          '</div>' +
                          '<button type="button" class="btnToggle">' +
                              '<span class="hidden">상세내용 보기</span>' +
                          '</button>' +
                          '<div class="toggleCont">' +
                              '<div class="toggleInner">' + value.answer + '</div>' +
                          '</div>' +
                         '</li>';
            		});
                    $('.toggleList').html(noticeList);
                   
                    // Toggle 기능 추가
                    $('.btnToggle').click(function() {
                        var $toggleCont = $(this).next('.toggleCont');
                        if ($toggleCont.is(':visible')) {
                            $toggleCont.slideUp();
                        } else {
                            $('.toggleCont').slideUp(); // 다른 열려 있는 답변 닫기
                            $toggleCont.slideDown();
                        }
                    });
            	}); */
            	
            	//상단 카테고리 클릭시 이벤트
                $("#tabArea > li").click(function(){
                    if(!$(this).hasClass("on")){
                        $(this).addClass("on");
                    }
                
                });
            });

        </script>
        
        <script>


function fncKeyEvent(){
    if(event.keyCode == 13){
    	var ctgry = jQuery("#searchCtgry").val();
    	 fncSearch(ctgry);
    }
}

function fncPage(page){
    jQuery("#page").val(page);
    jQuery("#form").attr("action", "http://localhost/hotel_prj/user/notice.do");
    jQuery("#form").attr("method", "get");
    jQuery("#form").submit();	
}


function fncGoView(noticeNum,num){
    jQuery("#noticeNum").val(noticeNum);
    jQuery("#num").val(num);
    jQuery("#form").attr("action", "http://localhost/hotel_prj/user/noticeDetail.do");
    jQuery("#form").attr("method", "get");
    jQuery("#form").submit();	

}

function fncSearch(ctgry) {
    jQuery("#page").val(1);
    jQuery("#searchCtgry").val(ctgry);
    jQuery("#form").attr("action", "http://localhost/hotel_prj/user/notice.do");
    jQuery("#form").attr("method", "get");
    jQuery("#form").submit();	
}



</script>
        
        
        
        
        
        
        
        
        
<form action="http://localhost/hotel_prj/user/notice.do" method="get" id="form">

<input type="hidden" name="noticeNum" id="noticeNum" />
<input type="hidden" name="page" id="page" value="${nVO.page}" />
<input type="hidden" name="num" id="num" value="" />

<div id="container" class="container membership">
	<!-- 컨텐츠 S -->
	<h1 class="hidden">통합 멤버십</h1>
	<div class="topArea">
		<div class="topInner">
			<h2 class="titDep1">News</h2>
			<p class="pageGuide">조선호텔앤리조트 멤버를 위한 다양한 소식을 만나보세요.</p>
		</div>
	</div>
	<!-- //topArea -->
	<div class="searchBox package">
		<div class="inner">
						<div class="searchOp">
				<div class="selectWrap" style="width:296px">

					<select name="searchCtgry" id="searchCtgry" class="form-control"  style="height:150px;"  >
					<option value="Title" >제목</option>
					</select>
				</div>
				<div class="intWord">
					<span class="intArea">
						<input type="text" style="width:873px" id="searchDataValue" name="searchDataValue" title="검색어 입력" placeholder="검색어를 입력해주세요." onkeypress="fncKeyEvent();" value="${nVO.searchDataValue }"/>
					</span>
					<button type="button" class="btnSC btnM" onclick="fncPage(1); return false;">조회</button>
				</div>
			</div>
		</div>
	</div>







				<div class="inner">
				
				
		<table class="tblH">
			<colgroup>
			<col style="width:10%">
			<col style="width:60%">
			<col style="width:16%">
			<col style="width:auto">
			</colgroup>
			<caption>멤버십 뉴스 목록</caption>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">등록일</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>
			<tbody>
				
							<c:if test="${totalPage==0}">
								<tr>
									<td colspan="4" class="tcenter">검색된 결과가 존재하지 않습니다.</td>
								</tr>
							</c:if>
				<c:forEach var="nna" items="${noticeList}" varStatus="i">
					<tr>
						<td>${(nVO.page * 10)-9 + i.index}</td>
						<td class="tcenter">
							<a href="#none" onclick="fncGoView('${nna.noticeNum}',${(nVO.page * 10)-9 + i.index}); return false;">
								${nna.noticeTitle}
							</a>
						</td>
						<td class="date">${nna.noticeInputdate}</td>
						<td>${nna.noticeViewCnt}</td>
					</tr>
				</c:forEach>
	
			</tbody>
		</table>
		<div class="pagination">
							<c:if test="${totalPage==0}">
								<span class="current"><span class="hidden">현재페이지</span>1</span>
							</c:if>
							<c:forEach var="page" begin="1" end="${totalPage}"
								varStatus="status">
								<c:choose>
									<c:when test="${page == nVO.page}">
										<span class="current"><span class="hidden">현재페이지</span>${page}</span>
									</c:when>
									<c:otherwise>
										<a href="javascript:fncPage(${page});">${page}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
		
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

