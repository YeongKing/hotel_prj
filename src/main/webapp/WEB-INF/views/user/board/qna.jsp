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
    <title>예약내역 - 객실 예약 내역 | 엘리시안호텔</title>
    <link rel="shortcut icon" type="text/css" href="http://localhost/hotel_prj/static/home/images/ko/pc/common/favicon.ico">
    <link href="http://localhost/hotel_prj/static/home/css/ko/pc/common_josunhotel.css" rel="stylesheet" type="text/css">
    <link href="http://localhost/hotel_prj/static/home/css/ko/pc/contents.css" rel="stylesheet" type="text/css">
    <link href="http://localhost/hotel_prj/static/home/bluewaves/css/pc/contents.css" rel="stylesheet" type="text/css"> 
    <link href="http://localhost/hotel_prj/static/home/css/ko/pc/swiper.css" rel="stylesheet" type="text/css"> 
    <script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/pubPlugin.js"></script>
    <script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/pubCommon_contents.js"></script>
    <script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/pubCommon_josunhotel.js"></script>
    <script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/selectbox.js"></script> 
    <script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/ko/pc/swiper.min.js"></script> 
    <script type="text/javascript" src="http://localhost/hotel_prj/static/home/js/home.js"></script>
    <script type="text/javascript" src="http://localhost/hotel_prj/static/home/bluewaves/js/pc/bw_contents.js"></script>
</head>
<body>
    <noscript>
        <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NP6NJMP" height="0" width="0" style="display:none;visibility:hidden"></iframe>
    </noscript>
    <div class="skip"><a href="#container">본문 바로가기</a></div>
    <div class="wrapper">
         <!--S header  -->
<jsp:include page="/user/header.jsp"></jsp:include>
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
            	//json데이터로 화면구성 --> 임시로 구성해놨음 수정필요!!
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
            	});
            	
            //상단 카테고리 클릭시 이벤트
            $("#tabArea > li").click(function(){
               if(!$(this).hasClass("on")){
                   $(this).addClass("on");
                    }
                
                });
            });
            //엔터 이벤트
            function fncKeyEvent(){
                if(event.keyCode == 13){
                }
            }
            //페이지 이동 이벤트
            function fncPage(page){
              
            }
            //검색 이벤트
            function fncSearch() {
               	
            }
        </script>
        <form action="/customer/faq.do" method="get" id="form">
            <input type="hidden" name="_method" id="_method">
            <input type="hidden" value="253105" name="bbsMstrSn">
            <input type="hidden" name="bbsSn" id="bbsSn">
            <input type="hidden" name="deleteYn" id="deleteYn" value="N">
            <input type="hidden" name="page" id="page" value="1">
            <input type="hidden" name="searchDataType" value="77">
            <div id="container" class="container mypage ctmService">
                <h1 class="hidden">고객센터</h1>
                <div class="topArea">
                    <div class="topInner">
                        <h2 class="titDep1">Customer Service</h2>
                        <p class="pageGuide">호텔 이용과 관련된 궁금한 사항을 남겨주시면 신속하게 답변 드리겠습니다.<br>항상 고객의 소리에 귀 기울이는 조선호텔앤리조트가 되겠습니다.</p>
                    </div>
                </div>
                <div class="inner">
                    <div class="lnbArea">
                        <ul class="lnb ctmType">
                            <li><a href="notice.jsp">공지사항</a></li>
                            <li class="on"><a href="#none">FAQ</a></li>
                        </ul>
                    </div>
                    <div class="myContents">
                        <h3 class="titDep2">FAQ</h3>
                        <h4 class="titDep3 hidden">FAQ</h4>
                        <div class="searchBox">
                            <div class="searchOp">
                                <span class="hidden">검색</span>
                                <div class="selectWrap" style="width:220px">
                                    <select name="searchCtgry" id="searchCtgry" class="form-control" style="height:150px;">
                                        <option value="">전체</option>
                                        <option value="F01">멤버십 계정</option>
                                        <option value="F02">카드</option>
                                        <option value="F03">포인트</option>
                                        <option value="F04">전환회원</option>
                                        <option value="F05">바우처</option>
                                        <option value="F06">기타</option>
                                    </select> 
                                </div>
                                <div class="intWord">
                                    <span class="intArea">
                                        <input type="text" id="searchDataValue" name="searchDataValue" style="width:675px" title="검색어 입력" placeholder="검색어를 입력해주세요." onkeypress="fncKeyEvent();" value="">
                                    </span>
                                </div>                     
                            </div>
                            <div class="btnWrap">
                                <a href="#search" class="btnSC btnM" role="button" onclick="fncSearch(); return false;">검색</a>
                            </div>
                        </div>
                        <ul class="tabType01 tabType02 tabToggle" id="tabArea">
                            <li id="F00" class="on"><a href="#tab01-F00">전체</a></li>
                            <li id="F01"><a href="#tab01-F01">멤버십 계정</a></li>
                            <li id="F02"><a href="#tab01-F02">카드</a></li>
                            <li id="F03"><a href="#tab01-F03">포인트</a></li>
                            <li id="F04"><a href="#tab01-F04">전환회원</a></li>
                            <li id="F05"><a href="#tab01-F05">바우처</a></li>
                            <li id="F06"><a href="#tab01-F06">기타</a></li>
                        </ul>
                        <div id="tab01-F00" class="tabCont" style="display:block">
                            <h3 class="hidden">전체</h3>
                            <div class="tabFaqType">
                                <ul class="toggleList rsvList">
                                    
                                </ul>
                            </div>
                        </div>
                        <div id="tab01-F01" class="tabCont">
                            <h3 class="hidden">멤버십 계정</h3>
                            <div class="tabFaqType">
                                <ul class="toggleList rsvList">
                                
                                </ul>
                            </div>
                        </div>
                        <div id="tab01-F02" class="tabCont">
                            <h3 class="hidden">카드</h3>
                            <div class="tabFaqType">
                                <ul class="toggleList rsvList"></ul>
                            </div>
                        </div>
                        <div id="tab01-F03" class="tabCont">
                            <h3 class="hidden">포인트</h3>
                            <div class="tabFaqType">
                                <ul class="toggleList rsvList"></ul>
                            </div>
                        </div>
                        <div id="tab01-F04" class="tabCont">
                            <h3 class="hidden">전환회원</h3>
                            <div class="tabFaqType">
                                <ul class="toggleList rsvList">
                                    
                                </ul>
                            </div>
                        </div>
                        <div id="tab01-F05" class="tabCont">
                            <h3 class="hidden">바우처</h3>
                            <div class="tabFaqType">
                                <ul class="toggleList rsvList">
                                
                                </ul>
                            </div>
                        </div>
                        <div id="tab01-F06" class="tabCont">
                            <h3 class="hidden">기타</h3>
                            <div class="tabFaqType">
                                <ul class="toggleList rsvList">
                                    
                                </ul>
                            </div>
                        </div>
                        <div class="pagination">
                            <span class="current"><span class="hidden">현재페이지</span>1</span>
                            <a href="javascript:fncPage(2);">2</a>
                            <a href="javascript:fncPage(3);">3</a>
                            <a href="javascript:fncPage(4);">4</a>
                        </div>
                    </div>
                </div>
            </div>
        </form>
      
<!--S footer  -->
<jsp:include page="/user/footer.jsp"></jsp:include>
<!--E footer  -->
        
    </div>
    
</body>
</html>

