<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" 
 info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">

<title>로그인 | 엘리시안호텔</title>

<!-- S head css -->
<jsp:include page="/WEB-INF/views/user/common/head_css.jsp"></jsp:include>
<link href="http://localhost/hotel_prj/static/home/css/ko/pc/common_new.css" rel="stylesheet" type="text/css">
<link href="http://localhost/hotel_prj/static/home/css/ko/pc/contents.css" rel="stylesheet" type="text/css">
<!-- E head css -->

<!-- S head script -->
<jsp:include page="/WEB-INF/views/user/common/head_script.jsp"></jsp:include>
<!-- E head script -->
</head>

<body>

<div class="skip"><a href="#container">본문 바로가기</a></div>
<div class="wrapper ">

<script>
	jQuery(function(){
		jQuery.ajax({
			type : "GET",
			url : "/massPromotion/get.json",
			cache : false,
			dataType : "json",
			global : false,
			beforeSend: function() {
			},
			complete: function() {
			},
			success : function(data){
                var massPromtn = data.bean;
                //조회 결과에 따라 랜더링
                if(massPromtn != null && massPromtn != ""){
                    var url = getMassPromtnUrl();
                    var menuNm = massPromtn.promtnNm;
                    var sysCode = massPromtn.sysCode;
                    appendMassPromotionMenu(url, menuNm, sysCode);
                }
			},
			error:function(r, s, e){
			}
		});
	});

    function getMassPromtnUrl(){
        var url = "";
        var sysCode = jQuery("#sysCode").val();

        if(gfncIsApp()){
            //앱일 경우
            url = "/m/massPromotion/list.do";
        }else if(gfncIsMobile()){
            //모바일일 경우
            if(sysCode == "JOSUNHOTEL"){
                url = "/m/massPromotion/list.do";
            }else {
                if(gfncIsDevServer()){
                    url = "http://dev.josunhotel.com/m/massPromotion/list.do";
                }else {
                    url = "https://www.josunhotel.com/m/massPromotion/list.do";
                }
            }
        }else {
            //pc일 경우
            if(sysCode == "JOSUNHOTEL"){
                url = "/massPromotion/list.do";
            }else {
                if(gfncIsDevServer()){
                    url = "http://dev.josunhotel.com/massPromotion/list.do";
                }else {
                    url = "https://www.josunhotel.com/massPromotion/list.do";
                }
            }
        }
        return url;
    }

    function appendMassPromotionMenu(url, menuNm, sysCode){
        if(gfncIsApp()){
            //앱일 경우
            var menuHtml = '<div class="titArea"><li><a href="'+url+'">'+menuNm+'</a></li></div>';

            var pathname = window.location.pathname;
            if(pathname.indexOf("/app/main.do") == 0){
                jQuery(".gnbArea ul.toggleList > li > .titArea:contains('패키지')").closest("ul").append(menuHtml);
            }else {
                jQuery(".gnbArea ul.toggleList li:contains('PACKAGE')").closest("ul").append(menuHtml);
            }

            /*if(jQuery(".gnbArea ul.toggleList li:contains('패키지')").length > jQuery(".gnbArea ul.toggleList li:contains('PACKAGE')").length){
                jQuery(".gnbArea ul.toggleList li:contains('패키지')").closest("ul").append(menuHtml);
            } else {
                jQuery(".gnbArea ul.toggleList li:contains('PACKAGE')").closest("ul").append(menuHtml);
            }*/

        }else if(gfncIsMobile()){
            //모바일일 경우
            var menuHtml = '<div class="titArea"><li><a href="'+url+'">'+menuNm+'</a></li></div>';
            jQuery(".gnbArea ul.toggleList li:contains('PACKAGE')").closest("ul").append(menuHtml);
        }else{
            //pc일 경우
            if(sysCode == "JOSUNHOTEL" || sysCode == "JPY"){
                //해당 페이지가 HUB거나 JPY일 경우
                var menuHtml = '<li><a href="'+url+'">'+menuNm+'</a></li>';
                jQuery(".allMenu ul.menuDepth01 ul.menuDepth02 li:contains('PACKAGE')").closest("ul").append(menuHtml);
            }else {
                var menuHtml = '<li><a href="'+url+'">'+menuNm+'</a></li>';
                jQuery(".headArea .utilMenu .gnbDepth1 .gnbDepth2 li:contains('PACKAGE')").closest("ul").append(menuHtml);
            }
        }
    }

</script>

<script>
        //2022-05-23 조선라운지 추가
        //헤더 메뉴 버튼 클릭 이벤트
        jQuery(document).on("click",".headArea .btnMenu" ,function(){

            //메뉴 펼쳐질때 라운지 list 3가지 무작위 노출
            if(jQuery(this).hasClass("menuOn")){
                var expsrCount = 3;
                var $loungeList = jQuery(".menuDepth-add .gnb-thum li");
                var randomArray = generateRandomNumberArray(expsrCount, $loungeList.length);

                $loungeList.addClass("hidden");
                $loungeList.each(function(index){
                    if(randomArray.indexOf(index) > -1){
                        jQuery(this).removeClass("hidden");
                    }
                });
            }
        })
</script>
 <!--S header  -->
<jsp:include page="/WEB-INF/views/user/header.jsp"></jsp:include>
 <!--E header  -->
<!--(페이지 URL)-->

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
    var kakaoLoginUser;
    var kakaotoken;
    var kakaoid;
    //카카오 브러우저 일떄 동작 로그인 회원가입 -> 싱크 로직
    $(document).ready(function(){
        if(!Kakao.isInitialized()){
            Kakao.init('6b46493c83ce90781124d07fb15e6156');
        }

        //카카오 인앱 브라우저 확인
        //오류로 잠시 주석처리
        /*var agent = navigator.userAgent.toUpperCase();
        if (agent.indexOf('KAKAO') >= 0) {
            kakaoLoginUser = sessionStorage.getItem('kakaoLoginUser');
            if(kakaoLoginUser == null){
                kakaoAutoLogin();
            }
            //햄버거메뉴 로그인 btn
            $($(".btnAccount").children()[0]).attr("href", "#none");
            $($(".btnAccount").children()[1]).attr("href", "#none");
            $($(".btnAccount").children()[0]).attr('onClick','kakaoStart()');
            $($(".btnAccount").children()[1]).attr('onClick','kakaoStart()');
        }*/
    })

    /* 카카오 싱크 자동로그인*/
    function kakaoAutoLogin() {
        Kakao.Auth.login({
            success : function(authObj) {
                kakaotoken = authObj.access_token
                Kakao.API.request({
                    url : '/v2/user/me',
                    success : function(result) {
                        kakao = result.kakao_account;
                        kakaoid = result.id
                        //회원가입 api요청
                        jQuery.ajax({
                            type : "POST",
                            url : "/m/sns/kakaoSyncAutoLogin.do",
                            cache : false,
                            data : {
                                token:kakaotoken,
                                kName:kakao.profile.nickname,
                                email:kakao.email,
                                sex:kakao.gender,
                                birthdayH:kakao.birthyear+kakao.birthday,
                                ciNo:kakao.ci,
                                cellNo:kakao.phone_number,
                                snsKey:kakaoid
                            },
                            dataType: "text",
                            success : function(data) {
                                if (data == "ok") {
                                    frm_userid = kakaoid; // 입력된 아이디
                                    frm_userpw = kakaoid; 		// 입력된 비밀번호
                                    frm_snsTyCode='KAKAO';
                                    var param = {loginSeCode:'SNS',loginId:frm_userid,loginPassword:frm_userpw,snsTyCode:frm_snsTyCode};
                                    /****************************
                                     * post 날리기 전에 요청전과 후의 동작을 정의
                                     ****************************/
                                    $.ajaxSetup({
                                        beforeSend: function(xhr, settings){
                                        }
                                        ,complete: function(xhr, textStatus){

                                        }
                                    });

                                    /**********************************
                                     * post 요청
                                     **********************************/
                                    $.post("/login/api/login.json",param,function(data,status,xhr){
                                        console.log('startPageProtocol(mobile)==> https');
                                        //로그인 실패시
                                        if(data.loginYn=="N") {
                                            alert("자동 로그인 수행중 서버 오류가 발생하였습니다.1");
                                            //로그인 성공시
                                        }else{
                                            sessionStorage.setItem('kakaoLoginUser', 'yes');
                                            location.href = location.href;
                                        }
                                    },"json")

                                        // error handling
                                        .fail(function(xhr, status, error) {
                                            alert("자동 로그인 수행중 서버 오류가 발생하였습니다.2");
                                        });
                                } else {
                                    sessionStorage.setItem('kakaoLoginUser', 'no');
                                }
                            },
                            error:function(request,status,error){
                                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                            }
                        });

                    },
                    fail : function(error) {
                        alert("카카오와 연결에 실패하였습니다. 관리자에게 문의하세요");
                    },
                })
            },
            fail : function(error) {
                alert("카카오와 연결에 실패하였습니다. 관리자에게 문의하세요");
            },
        });
    }

    /* 카카오 싱크 */
    function kakaoStart() {
        Kakao.Auth.login({
            success : function(authObj) {
                kakaotoken = authObj.access_token
                Kakao.API.request({
                    url : '/v2/user/me',
                    success : function(result) {
                        kakao = result.kakao_account;
                        kakaoid = result.id
                        //회원가입 api요청
                        jQuery.ajax({
                            type : "POST",
                            url : "/sns/joinInsertKakaoSync.do",
                            cache : false,
                            data : {
                                token:kakaotoken,
                                kName:kakao.profile.nickname,
                                email:kakao.email,
                                sex:kakao.gender,
                                birthdayH:kakao.birthyear+kakao.birthday,
                                ciNo:kakao.ci,
                                cellNo:kakao.phone_number,
                                snsKey:kakaoid
                            },
                            dataType : "json",
                            success : function(data) {

                                if (data.statusR == 200) {
                                    if(data.messageR == "yesId"){
                                        winSize = 'width=120,height=120';
                                        lnkUrl = "/sns/kakaoLogin.do?callbackType=login&fromPageType=LOGIN";
                                        window.open(lnkUrl,'popupSnsLoginWin',winSize+ ',scrollbars=no,toolbar=no,menubar=no');
                                        sessionStorage.setItem('kakaoLoginUser', 'yes');
                                    }else if(data.messageR == "muchId"){
                                        alert("등록된 아이다가 여러개입니다. 관리자에게 문의하세요");
                                    }else{
                                        alert("카카오 싱크 회원가입이 완료 되었습니다.");
                                        winSize = 'width=450,height=550';
                                        lnkUrl = "/sns/kakaoLogin.do?callbackType=login&fromPageType=LOGIN";
                                        window.open(lnkUrl,'popupSnsLoginWin',winSize+ ',scrollbars=no,toolbar=no,menubar=no');
                                        sessionStorage.setItem('kakaoLoginUser', 'yes');
                                    }
                                } else {
                                    alert("카카오싱크 가입이 실패 하였습니다. 관리자에게 문의하세요");
                                }
                            },
                            error : function() {
                                alert("관리자에게 문의하세요");
                            }
                        });

                    },
                    fail : function(error) {
                        alert("카카오와 연결에 실패하였습니다. 관리자에게 문의하세요");
                    },
                })
            },
            fail : function(error) {
                alert("카카오와 연결에 실패하였습니다. 관리자에게 문의하세요");
            },
        });
    }


    //app login에서 사용하는 func
    function appKakaoStart(returnUrl) {
        Kakao.Auth.login({
            success : function(authObj) {
                kakaotoken = authObj.access_token
                Kakao.API.request({
                    url : '/v2/user/me',
                    success : function(result) {
                        kakao = result.kakao_account;
                        kakaoid = result.id
                        //회원가입 api요청
                        jQuery.ajax({
                            type : "POST",
                            url : "/sns/joinInsertKakaoSync.do",
                            cache : false,
                            data : {
                                token:kakaotoken,
                                kName:kakao.profile.nickname,
                                email:kakao.email,
                                sex:kakao.gender,
                                birthdayH:kakao.birthyear+kakao.birthday,
                                ciNo:kakao.ci,
                                cellNo:kakao.phone_number,
                                snsKey:kakaoid
                            },
                            dataType : "json",
                            success : function(data) {
                                if (data.statusR == 200) {
                                    if(data.messageR == "yesId"){
                                        location.href = returnUrl;
                                    }else if(data.messageR == "muchId"){
                                        alert("등록된 아이디가 여러개입니다. 관리자에게 문의하세요");
                                    }else{
                                        alert("카카오 싱크 회원가입이 완료 되었습니다.");
                                        location.href = returnUrl;
                                    }
                                } else {
                                    alert("카카오싱크 가입이 실패 하였습니다. 관리자에게 문의하세요");
                                }

                            },
                            error : function() {
                                alert("관리자에게 문의하세요");
                            }
                        });

                    },
                    fail : function(error) {
                        alert("카카오와 연결에 실패하였습니다. 관리자에게 문의하세요");
                    },
                })
            },
            fail : function(error) {
                alert("카카오와 연결에 실패하였습니다. 관리자에게 문의하세요");
            },
        });
    }

</script>

<script>

 $(document).ready(function(){
	 
    var userInputId = getLoginCookie("userInputId");//저장된 쿠기값 가져오기
    
    $("#frm_userid").val(userInputId); 
     
    if($("#frm_userid").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
                                           // 아이디 저장하기 체크되어있을 시,
        $("#idSaveCheck").prop("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 발생시
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("#frm_userid").val();
            setLoginCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteLoginCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#frm_userid").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("#frm_userid").val();
            setLoginCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
    
});
 
function setLoginCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteLoginCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getLoginCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
</script>

<script type="text/javascript">
 
	document.domain = "josunhotel.com";
	
	var PageScript = function() {

	}

	PageScript.prototype = {
		init : function() {
			
			this.bindSnsLinkEvent();
		}
		,validate:function(){
				
			var bResult = true;
			
			/*
			사용자 입력정보 VALIDATION 체크
			해당 열  input, select 박스가 하나라도 미기재 된 경우 validation false
			최초 미입력 된 element로 focus 이동됨
			*/
			var frstIdx = "";
			$(".membersLogin p").each(function(){
				var $this = $(this);
				$this.find("input[type='text'],input[type='password']").each(function(idx){
					var validYn = true;
					var value = jQuery(this).val();
					var id = jQuery(this).attr("id");
					if(value == "" && id != "emailType"){
						validYn = false;
						if(frstIdx == ""){
							frstIdx = jQuery(this);
						}
					}
					if(!validYn){
						$this.addClass("error");
						$this.find(".alertMessage").show();
					}else{
						$this.removeClass("error");
						$this.find(".alertMessage").hide();
					}
				});
				
			});
			if(frstIdx != ""){
  				bResult = false;
				frstIdx.focus();
				return false;
			}
			return bResult;
		}	
		,fncLogin:function(param_loginSeCode) {
			var frm_userid = "";
			var frm_userpw = "";
			var param_nextUrl = decodeURIComponent("/intro.do");

			
			// 아이디 로그인시
			if (param_loginSeCode != "SNS") {
				
				if(PageScript.validate()){
					
					frm_userid = jQuery("#frm_userid").val(); // 입력된 아이디
					frm_userpw = jQuery("#frm_userpw").val(); // 입력된 비밀번호
					
					var param = {
							loginSeCode : param_loginSeCode
							,loginId : frm_userid
							,loginPassword : frm_userpw
							,fromPageType : 'LOGIN'
							,nextURL : param_nextUrl
						}

						/****************************
						 * post 날리기 전에 요청전과 후의 동작을 정의
						 ****************************/
						$.ajaxSetup({
							beforeSend : function(xhr, settings) {
							},
							complete : function(xhr, textStatus) {
							}
						});

						/**********************************
						 * post 요청
						 **********************************/
						$.post("/login/api/login.json", param, function(data, status, xhr) {

							//로그인 실패시
							if (data.loginYn == "N") {
								
								switch (data.apiRtnCd) {
								case 'FC1004':
										$('#frm_userpw').val("");
										
										if(data.nextURL != null && data.nextURL != '' && data.apiRtnCd == 'FC1004'){
											
											if(confirm(data.msg)){
												
												location.href = data.nextURL;
												
											}								
											
										}else{
											
											alert(data.msg);
											
										}
									
									break;
								case 'FC1003':
									// /identify/releaseIdentifyIntro.do
									$("#releaseIdentifyForm").find("input[name='loginId']").val(frm_userid);
                                    //외국인의 경우 email이 id
                                    $("#releaseIdentifyForm").find("input[name='email']").val(frm_userid);
									$("#releaseIdentifyForm").attr("action", data.nextURL);
									$("#releaseIdentifyForm").submit();
									break;
								case 'FC1006':
									alert(data.msg);	
									break;
								case 'E00007':
									alert(data.msg);	
									break;

								default:
									console.log(data.msg);
									break;
								}

							//로그인 성공시	
							} else {
								location.href = data.nextURL;	
							}

						}, "json")

						// error handling
						.fail(function(xhr, status, error) {
							alert('로그인 수행중 서버 오류가 발생하였습니다.');
						});					
				}			

			}

		}
		, bindSnsLinkEvent : function() {
			$('.snsLogin > a').each(
					function() {

						$(this).bind('click', function() {

											var lnkType = $(this).attr('class');
											var winSize = '';
											var lnkUrl = '';
											switch (lnkType) {
											case "google":
												winSize = 'width=750,height=850';
												lnkUrl = "/sns/googleLogin.do?fromPageType=LOGIN";
												break;
											case "facebook":
												winSize = 'width=750,height=850';
												lnkUrl = "/sns/facebookLogin.do?fromPageType=LOGIN";
												//alert('준비중입니다.');
												//return;
												break;
											case "naver":
												winSize = 'width=750,height=850';
												lnkUrl = "/sns/naverLogin.do?callbackType=login&fromPageType=LOGIN";
												break;
											case "kakao":
												winSize = 'width=750,height=850';
												lnkUrl = "/sns/kakaoLogin.do?callbackType=login&fromPageType=LOGIN";
												break;
											case "apple":
												winSize = 'width=750,height=850';
												lnkUrl = "/sns/appleLogin.do?fromPageType=LOGIN";
												break;

											default:
												break;
											}

											window.open(lnkUrl,'popupSnsLoginWin',winSize+ ',scrollbars=no,toolbar=no,menubar=no');

										});

					});

		}

	}

	$(document).ready(function() {

		PageScript = new PageScript();
		PageScript.init();

	});

	
	function redirectNextPage(nextURL) {
		window.location.href = nextURL;
	}
	
	function redirectPage() {
		var nextURL = decodeURIComponent("/intro.do");
		
		if (nextURL != '') {
			window.location.href = nextURL;
		} else {
			window.location.href = 'main.do';
		}
	}

	function noMbrLoginPage() {
		$('#form').attr('action', "/login/noMbrLoginForm.do");
		$('#form').attr('target', "_self");
		$('#form').attr('method', "post");
		$('#form').submit();

	}

    function checkOrigin(origin){
        /*const devDomain = "";*/
        const josunhotelDomain = "https://josunhotel.com";
        const josunhotelwwwDomain = "https://www.josunhotel.com";
        const appDomain = "https://app.josunhotel.com";

        if(origin === josunhotelDomain
            || origin === josunhotelwwwDomain
            || origin === appDomain){
            return true;
        }
        return false;
    }

    window.addEventListener('message', function(e) {
		//fbevents.js 에러로 객체 메세지 수신 가능성 있으므로, 예약 번호인 String 타입으로 받음
		if(typeof e.data == "string"){
			//메세지 origin 체크
			if(checkOrigin(e.origin)){
				if(e.data == ""){
                    redirectPage();
				}else {
                    redirectNextPage(e.data);
				}
			}else {
                alert("허용되지 않은 도메인");
			}
		}
	})
</script>

<!-- 휴면해제 본인인증 page form -->
<form id="releaseIdentifyForm" name="releaseIdentifyForm" method="post">
	<input type="hidden" name="loginId" value="">
    <input type="hidden" name="email" value="">
</form>

<form id="form" name="form">
	<input type="hidden" id="loginId" name="loginId" value="" /> 
	<input type="hidden" id="loginPassword" name="loginPassword" value="" /> 
	<input type="hidden" id="loginSeCode" name="loginSeCode" value="" /> 
	<input type="hidden" id="nextURL" name="nextURL" value="/intro.do" /> 
	<input type="hidden" id="hotlSysCode" name="hotlSysCode" value="" />
		<!-- //header -->
		<div id="container" class="container login">
			<!-- 컨텐츠 S -->
			<h1 class="hidden"><entry key="comm.login.page.msg.0010"></h1>
			<div class="topArea">
				<div class="topInner">
					<h2 class="titDep1">Sign In</h2>
					<p class="pageGuide">
					머무는 모든 순간이 특별해집니다.<!-- 머무는 모든 순간이 특별해집니다. -->
					</p>
				</div>
			</div>
			<div class="inner">
				<ul class="tabType01 tabType02">
					<li class="on"><a href="#">
					아이디 로그인<!-- 아이디 로그인 -->
					</a></li>
					<li><a href="javascript:return false;" target="_self"
						onclick="noMbrLoginPage()">
						비회원 예약확인<!-- 비회원 예약확인 -->
						</a></li>
				</ul>
				<!-- tabCont(아이디 로그인) -->
				<div id="tab01" class="tabCont" style="display: block">
					<h3 class="hidden">
					아이디 로그인<!-- 아이디 로그인 -->
					</h3>
					<div class="loginBox">
						<div class="membersLogin">
							<p class="loginFrm">
								<!-- 필수입력서식에 미입력 발생 시, error 클래스 추가 alertMessage 노출, 포커스가 가면 error 클래스 제거 -->
								<span class="alertMessage">
								아이디를 입력해주세요.<!-- 아이디를 입력해주세요. -->
								</span> 
								<label class="hidden" for="frm_userid">아이디</label> 
								<input type="text" id="frm_userid" placeholder="아이디" aria-required="true" /><!-- 아이디 -->
							</p>
							<p class="loginFrm">
								<span class="alertMessage">비밀번호를 입력해주세요.<!-- 비밀번호를 입력해주세요. --></span> 
								<label class="hidden" for="frm_userpw">비밀번호</label><!-- 비밀번호 --> 
								<input type="password" id="frm_userpw" placeholder="비밀번호" aria-required="true" onkeydown="javascript:if(event.keyCode == 13){PageScript.fncLogin('ID');}" /><!-- 비밀번호 -->
							</p>
							<!-- 20200528 수정 : 아이디저장(추가) -->
							<span class="frm"> 
								<input type="checkbox" id="idSaveCheck">
								<label for="idSaveCheck">아이디 저장<!-- 아이디 저장 --></label>
							</span>
							<!-- //20200528 수정 : 아이디저장(추가) -->
							<button type="button" class="btnSC btnL active btnFull" onclick="PageScript.fncLogin('ID'); return false;">로그인<!-- 로그인 --></button>
							
							<div class="loginLink">
							    <a href="http://localhost/hotel_prj/user/join.do" class="btnS icoArr">회원가입<!-- 회원가입 --></a>
							    <a href="http://localhost/hotel_prj/user/findIdentifyIntro.do" class="btnS icoArr">아이디 / 비밀번호 찾기<!-- 아이디 / 비밀번호 찾기 --></a>
							</div>
						</div>
						<div class="snsLogin">
                            
                            
							<a href="javascript:void(0);" class="google">구글 로그인<!-- 구글 로그인 --></a> 
							<a href="javascript:void(0);" class="facebook">페이스북 로그인<!-- 페이스북 로그인 --></a> 
							
								<a href="javascript:void(0);" class="naver">네이버 로그인<!-- 네이버 로그인 --></a>
                                <!-- 싱크 추가로 주석처리 -->
                                
								<a href="javascript:void(0);" class="kakao">카카오톡 로그인<!-- 카카오톡 로그인 --></a>
							
							<a href="javascript:void(0);" class="apple">애플 로그인<!-- 애플 로그인 --></a>
							<!-- 20200528 수정 : 애플로그인(추가) -->
						</div>
					</div>
				</div>
				<ul class="txtGuide">
					<li>이용자 비밀번호 5회 연속 오류시 계정이 잠기게 됩니다.<!-- 이용자 비밀번호 5회 연속 오류시 계정이 잠기게 됩니다. --></li>
					<li>오프라인 회원의 경우 온라인 회원가입 후 계정연동 가능합니다.<!-- 오프라인 회원의 경우 온라인 회원가입 후 계정연동 가능합니다. --></li>
                    <li>유선 혹은 여행사를 통한 예약은 온라인 조회가 불가하오니 예약실로 문의 부탁드립니다.<!--유선 혹은 여행사를 통한 예약은 온라인 조회가 불가하오니 예약실로 문의 부탁드립니다. --></li>
					<li>메리어트 호텔에서 예약하신 경우, 메리어트 사이트에서만 예약 확인이 가능합니다.<!-- 메리어트 호텔에서 예약하신 경우, 메리어트 사이트에서만 예약 확인이 가능합니다. --></li>
                    
                        <li>카카오페이 간편가입 및 신세계 면세점 동시가입 회원은 '계정활성화' 버튼을 통해 서비스 이용이 가능합니다.<!-- 카카오페이 간편가입 및 신세계 면세점 동시가입 회원은 '계정활성화' 버튼을 통해 서비스 이용이 가능합니다.--></li>
                    
                    
                    
					<!-- 20200528 수정 : 가이드(문구변경) -->
				</ul>
				<!-- //tabCont(아이디/카드번호 로그인) -->
			</div>
			<!-- //inner -->
			<!-- 컨텐츠 E -->
		</div>
		<!-- //container -->

</form>
<div class="dimmed" style="display: none"></div>
<!--- //Login(Layer Popup) -->
		<!-- //container -->
		
		
		
		
       <!--S footer  -->
		<jsp:include page="/WEB-INF/views/user/footer.jsp"></jsp:include>
 		<!--E footer  -->
 		
 		
 		
 		
	</div>
	<!-- //wrapper -->

<!-- 호텔 찾기 Layer -->
<div id="hotelFindLayer" class="layerPop">
	<div class="layerCont">
		<div class="hotelFindPop">
			<h2>호텔 찾기</h2>
			<ul class="hotelSelect">
								<li>
					<a href="https://jpg.josunhotel.com/main.do" target="_blank" title="새창열림">		
						<span class="hotelLogo palace">
						</span>
						<span class="hotelTit">조선 팰리스<!-- 조선 팰리스 --></span>
					</a>
				</li>
				<li>
					<a href="https://www.marriott.co.kr/hotels/travel/selwi-the-westin-chosun-seoul" target="_blank" class="js-active" title="새창열림">
						<span class="hotelLogo westinSeoul">
						</span>
						<span class="hotelTit">웨스틴 조선 서울</span>
					</a>
				</li>
				<li>
					<a href="https://www.marriott.co.kr/hotels/travel/puswi-the-westin-chosun-busan" target="_blank" class="js-active" title="새창열림">
						<span class="hotelLogo westinBusan">
						</span>
						<span class="hotelTit">웨스틴 조선 부산</span>
					</a>
				</li>
				<li>
					<a href="https://gjb.josunhotel.com/main.do" target="_blank" title="새창열림">
						<span class="hotelLogo grandBusan">
						</span>
						<span class="hotelTit">그랜드 조선 부산</span>
					</a>
				</li>
				<li>
					<a href="https://gjj.josunhotel.com/main.do" target="_blank" title="새창열림">
						<span class="hotelLogo grandJeju">
						</span>
						<span class="hotelTit">그랜드 조선 제주</span>
					</a>
				</li>
				<li>
					<a href="https://lescapehotel.com/main" target="_blank" title="새창열림">
						<span class="hotelLogo lescape">
						</span>
						<span class="hotelTit">레스케이프 호텔</span>
					</a>
				</li>
				<li>
					<a href="https://grp.josunhotel.com/main.do" target="_blank" title="새창열림">
						<span class="hotelLogo gravityPangyo">
						</span>
						<span class="hotelTit">그래비티 서울 판교</span>
					</a>
				</li>
				<li>
					<a href="https://www.marriott.co.kr/hotels/travel/selfp-four-points-seoul-namsan" target="_blank" class="js-active" title="새창열림">
						<span class="hotelLogo sheratonSeoulstation">
						</span>
						<span class="hotelTit">포포인츠 바이 쉐라톤 조선 서울역</span>
					</a>
				</li>
				<li>
					<a href="https://www.marriott.co.kr/hotels/travel/selfd-four-points-seoul-myeongdong" target="_blank" class="js-active" title="새창열림">
						<span class="hotelLogo sheratonMyeongdong">
						</span>
						<span class="hotelTit">포포인츠 바이 쉐라톤 조선, 서울 명동</span>
					</a>
				</li>
			</ul>
		</div>
		<button type="button" class="btnClose" onclick="commonJs.popClose($('#hotelFindLayer'))">닫기</button>
	</div>
</div>
<!-- //호텔 찾기 Layer -->
<div class="dimmed"></div>
</body>
</html>

