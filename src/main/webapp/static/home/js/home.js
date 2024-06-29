//BUTTON SUBMIT 되는 문제 대응 처리
window.onload = function() {
	jQuery("button").attr("type", "button");
	
	jQuery(".mainBanner .bannerClose, .appBanner .bannerClose").on("click", function(){
		var isMainBannerTodayClose = jQuery("#todayCloseBtn").is(":checked");
		if(isMainBannerTodayClose){
			var sysCode = jQuery("#sysCode").val();
			setCookie(sysCode+"_banner","done", 1);
		}
		if(jQuery(this).closest(".mainBanner").length > 0){
			jQuery(".mainBanner").remove();
			jQuery(".wrapper").removeClass("topBanner");
		}
		if(jQuery(this).closest(".appBanner").length > 0){
			jQuery(".appBanner").remove();
			setCookie("APP_banner","done", 1);
		}
	});


}
jQuery(function(){
	//모든 input emoji replace
	jQuery(document).on("input","input[type='text'], textarea",function(){
		var regex = /([\u2700-\u27BF]|[\uE000-\uF8FF]|\uD83C[\uDC00-\uDFFF]|\uD83D[\uDC00-\uDFFF]|[\u2011-\u26FF]|\uD83E[\uDD10-\uDDFF])/g;

		if(regex.test(this.value)){
			var replaceStr = this.value.match(regex);
			alert("사용할 수 없는 문자가 포함되어 있습니다.("+replaceStr+")");
			this.value = this.value.replace(regex, '');

		}
	})
});
/**
 * 본인인증
 */
function gfncNameCert() {
	
	var PCC_window = window.open('', 'PCCWindow', 'width=430, height=560, resizable=1, scrollbars=no, status=0, titlebar=0, toolbar=0, left=300, top=200' );

    if(PCC_window == null){ 
		 alert(" ※ 윈도우 XP SP2 또는 인터넷 익스플로러 7 사용자일 경우에는 \n    화면 상단에 있는 팝업 차단 알림줄을 클릭하여 팝업을 허용해 주시기 바랍니다. \n\n※ MSN,야후,구글 팝업 차단 툴바가 설치된 경우 팝업허용을 해주시기 바랍니다.");
    }
    
    document.reqPCCForm.action = 'https://pcc.siren24.com/pcc_V3/jsp/pcc_V3_j10.jsp';
    document.reqPCCForm.target = 'PCCWindow';
    document.reqPCCForm.submit();
	
}


/**
 * 앱 접속 여부
 * @returns true or flase
 */
function gfncIsApp(){
	if(window.location.hostname.indexOf("app") > -1){
		return true;
	}else {
		return false;
	}
}

/**
 * 모바일 접속 여부
 * @returns true or flase
 */
function gfncIsMobile(){
	if(window.location.pathname.indexOf("/m/") > -1){
		return true;
	}else {
		return false;
	}
}
/**
 * 개발서버 접속 여부
 * @returns true or flase
 */
function gfncIsDevServer(){
	if(window.location.hostname.indexOf("dev") > -1){
		return true;
	}else {
		return false;
	}
}


//Date format
Date.prototype.format = function(f) {
    if (!this.valueOf()) return " ";
 
    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var d = this;
     
    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear();
            case "yy": return (d.getFullYear() % 1000).zf(2);
            case "MM": return (d.getMonth() + 1).zf(2);
            case "dd": return d.getDate().zf(2);
            case "E": return weekName[d.getDay()];
            case "HH": return d.getHours().zf(2);
            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
            case "mm": return d.getMinutes().zf(2);
            case "ss": return d.getSeconds().zf(2);
            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
            default: return $1;
        }
    });
};
 
String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
Number.prototype.zf = function(len){return this.toString().zf(len);};
String.prototype.escapeHtml = function(){
	  return this.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/\"/g, "&quot;");
};
String.prototype.unescapeHtml = function(){
	return this.replace(/&amp;/g, "&").replace(/&lt;/g, "<").replace(/&gt;/g, ">").replace(/&quot;/g, "\"");
};


/**
 * Date format
 * @param str : 날짜 형태의 문자열
 * @param dformat : yyyyMMdd 
 * ex) gfncDateFormat("2015-01-01", "yyyy-MM-dd");
 */
function gfncDateFormat(str, dformat) {
	
	if(!str || str.length < 8) {
		return "";
	}
	
	if(!dformat) {
		dformat = "yyyy-MM-dd";
	}
	
	if(str.length == 8) {
		str = str.substring(0,4) + "-" + str.substring(4,6) + "-" + str.substring(6);
	}
	return new Date(str).format(dformat);
}

/**
 * Date format
 * @param num : 금액
 * ex) fncComma("10000");
 */
function fncComma(num){
    var len, point, str; 
       
    if(num != ""){
	    num = num + ""; 
	    point = num.length % 3 ;
	    len = num.length; 
	   
	    str = num.substring(0, point); 
	    while (point < len) { 
	        if (str != "") str += ","; 
	        str += num.substring(point, point + 3); 
	        point += 3; 
	    } 
    }else{
    	str = "0";
    }
    return str;
 
}

/**
 * Number format
 * 콤마 제거
 * @param str : 숫자
 * @param format : #,### 
 */
function gfncUncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}


/**
 * 영문+숫자, 자릿수 검증 
 * @param str 검증 문자열
 * @param min 최소 자릿수
 * @param max 최대 자릿수
 * @returns {Boolean}
 */
/*
function gfncPatternCheck(str, min, max) {
	var reg_pwd = /^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[~`!@#$%^&*()-_+={}[\]:;"'<>,.?/]).*$/;
	
	if(reg_pwd.test(str)){
		if (str.length >= min && str.length <= max) {
			return true;			
		} else {
			return false;
		}
	}
	return false;
}
*/

function gfncPatternCheck(str){

    var checkNumber = str.search(/[0-9]/g);
    var checkEnglish = str.search(/[a-z]/ig);
    var checkExp = str.search(/[~!@#$%^&*()_+|<>?:{}]/gi);
 
    if(!/^(?=.*[a-zA-Z])(?=.*[~!@#$%^&*()_+|<>?:{}])(?=.*[0-9]).{8,12}$/.test(str)){            
        return false;
    }else if(checkNumber < 0 || checkEnglish < 0 || checkExp < 0){
        return false;
    }else{
    	return true;
    }
}

/**
 * replaceAll
 * @author 최병욱
 * @param date
 * 
 */
function replaceAll(str, searchStr, replaceStr) {
   return str.split(searchStr).join(replaceStr);
}
/**
 * 쿠키 저장
 * @param name
 * @param value
 * @param expirdays
 * @returns
 */
function setCookie(name, value, expirdays){
	var date = new Date();
	date.setDate(date.getDate() + 1);
	date.setHours(0,0,0,0);
	date.toString();
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + date.toString() + ";"
}

/**
 * 쿠키 가져오기
 * @param name
 * @returns
 */
function getCookie(name) {
    var cookiedata = document.cookie;
    if(cookiedata.indexOf(name+"=done") > -1 ){
    	if(name.indexOf("_banner") > -1){
	    	jQuery(".mainBanner").remove();
	    	jQuery(".wrapper").removeClass("topBanner");
    	}
    	if(name.indexOf("_popUp") > -1){
    		jQuery(".mainPopLayer").remove();
    	}
    }
}

/**
 * 객실 관심 상품 담기
 * @param name
 * @returns
 */
function fncAddInterestRoom(roomCode, _this){
	
	if("" != roomCode ){
		
		var param = {"roomCode" : roomCode}
		
		jQuery.ajax({
			type : "POST",
			url : "/mber/interest/addPackageInterest.json",
			chache : false,
			dataType : "json",
			data : param,
			global : false,
			success : function(data){
				var resultCode = data.resultCode;
				var resultMsg = data.resultMsg;
				if(resultCode == "SUCCESS"){
					
					alert(resultMsg); /* 나의 관심 상품이 추가되었습니다. */
					jQuery(_this).attr("onclick", "fncDelInterestRoom('"+roomCode+"', this)");
					jQuery(_this).prop("checked", true);
				}else{
					//비 로그인 시
					if(resultCode == 'FAIL_NOTLOGIN'){
						if(confirm(data.resultMsg)){
						  location.href = "/login/loginForm.do?nextURL="+location.href;
						}
						jQuery(_this).prop("checked", false);
					}else if(resultCode == 'FAIL'){
						alert(resultMsg);//이미 추가된 상품입니다.
						jQuery(_this).attr("onclick", "fncDelInterestRoom('"+roomCode+"', this)");
						jQuery(_this).prop("checked", true);
					}else{
						alert(data.resultMsg);
						jQuery(_this).prop("checked", false);
						return false;
					}
				}
			},
			error:function(r, s, e){
				alert('<blabMessage:value key="comm.ajax.error"/>'.replace("{1}", r.status).replace("{2}", r.responseText));
			}
		});
	}	
}

/**
 * 객실 관심 상품 빼기
 * @param name
 * @returns
 */
function fncDelInterestRoom(roomCode, _this){
		
	jQuery.ajax({
		type : "GET",
		url : "/mber/interest/delPackageInterest.json",
		chache : false,
		dataType : "json",
		data : {
			"roomCode" : roomCode
		},
		global : false,
		beforeSend: function() {
			commonJs.showLoadingBar(); //로딩바 show
     	},
        complete: function() {
			commonJs.closeLoadingBar(); //로딩바 hide
        },
		success : function(data){
			
			var resultCode = data.resultCode;
			var resultMsg = data.resultMsg;
			if(resultCode == "SUCCESS"){
				alert(resultMsg); /* 나의 관심 상품이 삭제되었습니다. */
				jQuery(_this).attr("onclick", "fncAddInterestRoom('"+roomCode+"', this)");
				jQuery(_this).prop("checked", false);
			}else{
				if(resultCode == 'FAIL_NOTLOGIN'){
					if(confirm(data.resultMsg)){
					  location.href = "/login/loginForm.do?nextURL="+location.href;
					}
					jQuery(_this).prop("checked", false);
				}else{
					alert(data.resultMsg);
					jQuery(_this).prop("checked", true);
					return false;
				}
			}
		},
		
		error:function(r, s, e){
			
		}
	 });
}


/**
 * textarea 입력 Byte 수 체크 제한
 * @param obj 		textarea object
 * @param maxByte 	최대 byte 수
 * @param nowByte 	현재 byte 수를 노출할 Object ID
 */
function fnChkByte(obj, maxByte, nowByteObj) {

	var str = obj.value;
	var str_len = str.length;

	var rbyte = 0;
	var rlen = 0;
	var one_char = "";
	var str2 = "";

	for (var i = 0; i < str_len; i++) {

		one_char = str.charAt(i);
		if (escape(one_char).length > 4) {
			rbyte += 3; 	// 한글3Byte

		} else {
			rbyte++; 		// 영문 등 나머지 1Byte

		}

		if (rbyte <= maxByte) {
			rlen = i + 1; 	// return할 문자열 갯수
		}
	}

	if (rbyte > maxByte) {
		//alert("한글 " + toPrice(maxByte / 3) + "자 / 영문 " + toPrice(maxByte) + "자를 초과 입력할 수 없습니다.");
		str2 = str.substr(0, rlen); 	// 문자열 자르기
		obj.value = str2;
		fnChkByte(obj, maxByte, nowByteObj);

	}
}

/**
 * 게시판 list 조회시 날짜 필드로 요소 제거
 * @param list 		게시글 조회 list
 * @param startFieldId 	게시 시작일 필드명
 * @param endFieldId 	게시 종료일 필드명
 */
function removeItemByDateField(list, startFieldId, endFieldId){
	if(list.length){
		for(var i=list.length-1; i >= 0; i--){
			var today = new Date();
			var removeFlag = list[i].addFieldList.some(function(addField){
				var flag = false;
				var startDt = "";
				var endDt = "";

				if(addField.fieldId == endFieldId){
                    if(addField.fieldContents){
                        var splitDateField = addField.fieldContents.split("-");
                        var year = parseInt(splitDateField[0]);
                        var month = parseInt(splitDateField[1]) - 1;
                        var day = parseInt(splitDateField[2]);
                        endDt = new Date(year, month, day);
                        endDt.setDate(endDt.getDate() + 1);
                        if(today > endDt){
                            flag = true;
                        }
                    }else {
                        flag = true;
                    }

				}

				return flag;
			});
			if(removeFlag){
				list.splice(i, 1);
			}
		}
	}
}

/**
 * 게시판 list 조회시 추가 필드로 요소 제거
 * @param list 		게시글 조회 list
 * @param separator
 * Ex) removeItemBySeparatorField(list , "appOnlyYn", "Y");
 * appOnlyYn 필드의 값이 Y인 경우 요소 제거
 */
function removeItemBySeparatorField(list, fieldId, separator){
	if(list.length > -1){
		for(var i=list.length-1; i >= 0; i--){
			var removeFlag = list[i].addFieldList.some(function(addField){
				var flag = false;
				if(addField.fieldId == fieldId && addField.fieldContents != ""){
					if(addField.fieldContents == separator){
						flag = true;
					}
				}
				return flag;
			});
			if(removeFlag){
				list.splice(i, 1);
			}
		}
	}
}

function gfncOnlyKorNm(obj){
    obj.value = obj.value.replace(/([^가-힣ㄱ-ㅎㅏ-ㅣㆍᆢ\x20])/i, '').toUpperCase();
}


/**
 * 중복없이 랜덤 배열 생성 반환
 * @param arrLength array 배열 길이
 * @param maxNumber 랜덤 최대값
 */
function generateRandomNumberArray(arrLength, maxNumber){

    if(isNaN(arrLength) || isNaN(maxNumber)){
        return new Array();
    }

    //무한 루프 방지
    if(arrLength > maxNumber){
        return new Array();
    }

    var set = new Set();
    while(set.size < arrLength){
        var num = Math.floor(Math.random() * maxNumber);
        set.add(num);
    }
    //set을 array로 변환
    return Array.from(set);
}

/**
 * 이메일 형식 검증
 * @param String email
 */
function gfncVaildateEmail(email){
    var reg_email = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    return reg_email.test(email);
}

/**
 * input 숫자만 입력
 * @param input obj
 */
function gfncOnlyNumber(obj){
    obj.value = obj.value.replace(/[^0-9]/g, '');
}

function gfncCheckFileMaxSize(fileObj){
    if(fileObj.files && fileObj.files[0]){
        //10mb
        var maxSize = 10 * 1024 * 1024;
        var fileSize = fileObj.files[0].size;
        if(fileSize > maxSize){
            alert("첨부 파일 사이즈는 최대 10MB 이내로 등록 가능합니다. ");
            $(fileObj).val('');
            return false;
        }else {
            return true;
        }
    }
}

/**
 * 멤버십 구매 완료시 SEO data push
 * */
function gfncPushVipGoodsSeoData(transaction_id, value, item_id, item_name, price) {

    window.dataLayer = window.dataLayer || [];

    dataLayer.push({
        "event":  "purchase",
        "ecommerce":  {
            "currency": "KRW",
            "value": value, //결제 금액
            "transaction_id": transaction_id,
            "items": [{
                "item_name": item_name,     //상품 명
                "item_id": item_id,         //상품 코드
                "price": price,             //판매 금액
                "item_brand": 'JHR'
            }]
        }
    });
}

/**
 * 상품 자세히 보기 클릭 SEO data push
 *  OFFERS > PACKAGE
 * */
function gfncPushOffersDetailViewSeoData(item_id, item_name, item_brand) {
    window.dataLayer = window.dataLayer || [];

    dataLayer.push({
        "event":  "view_item",
        "ecommerce":  {
            "items": [{
                "item_id": item_id,                 //상품 id
                "item_name": item_name,     //클릭한 상품 명
                "item_brand": item_brand            //호텔 코드
            }]
        }
    });
}

/**
 * 관심상품 담기 클릭 SEO data push
 *  OFFERS > PACKAGE , EVENT 게시물
 * */
function gfncPushInterestAddSeoData(item_id, item_name, item_brand, index) {

    window.dataLayer = window.dataLayer || [];

    if (index == undefined) {
        index = null;
    }

    dataLayer.push({
        "event":  "add_to_wishlist",
        "ecommerce":  {
            "items": [{
                "item_id" : item_id,
                "item_name": item_name,                     //클릭한 상품 명
                "item_brand": item_brand                   //호텔 코드
            }]
        }
    });
}


/**
 * 관심상품 삭제 클릭 SEO data push
 *  OFFERS > PACKAGE , EVENT 게시물
 * */
function gfncPushInterestDelSeoData(item_id, item_name, item_brand, index) {
    window.dataLayer = window.dataLayer || [];

    if (index == undefined) {
        index = null;
    }

    dataLayer.push({
        "event":  "remove_wishlist",
        "ecommerce":  {
            "items": [{
                "item_id": item_id,
                "item_name": item_name,                     //클릭한 상품 명
                "item_brand": item_brand                   //호텔 코드
            }]
        }
    });
}

/**
 * 객실 예약 완료 클릭 SEO data push
 * */
function gfncPushRoomResveSeoData(transaction_id, tax, value,items) {

    window.dataLayer = window.dataLayer || [];

    dataLayer.push({
        "event":  "purchase",
        "ecommerce":  {
            "currency": "KRW",
            "value": value,           //총액
            "tax": tax,
            "transaction_id": transaction_id,
            "coupon": "",
            "items" : items
        }
    });

}

/**
 * 객실 예약 취소 클릭 SEO data push
 * */
function gfncPushRoomCancelSeoData(transaction_id) {

    window.dataLayer = window.dataLayer || [];

    dataLayer.push({
    "event":  "refund",
        "ecommerce":  {
            "transaction_id": transaction_id, //예약 번호
            "items": []
        }
    });
}

//다이닝 예약 완료 data push
function gfncPushDiningResveSeoData(hotel_property, dine_name, dine_detail ) {

    window.dataLayer = window.dataLayer || [];
	dataLayer.push({
        event: 'dine_book',  			// 이벤트의 이름
        hotel_property: hotel_property, 		//해당 업장이 속한 호텔 프로퍼티 코드( EX ) GJJ , GJB)
        dine_name: dine_name,           // 'RUBRICA',		다이닝 업장 이름 (EX)RUBRICA)
        dine_detail: dine_detail,       // '2023.03.31(금) 오후12:00 방문인원 2명'
    });

}

// app 외부 링크 열기
function gfncOpenAppLink(link){
	location.href = "josunhotel://outLink?link="+encodeURI(link);
}

// 연속된 동일한 문자열 개수
function containsSameCharMaxCnt(src) {
	let localMaxCnt = 0;
	let globalMaxCnt = 0;
	let dummy = '';
	for(var i=0; i<src.length; i++) {
		if(src[i] == dummy) {
		localMaxCnt++;
		globalMaxCnt = Math.max(globalMaxCnt, localMaxCnt);
	} else {
		localMaxCnt = 0;
	}
	dummy = src[i];
		}
	  return globalMaxCnt+1;
}

// 연속된 문자열 개수
function containsContinuosCharMaxCnt(src) {
	let checkTarget = [
	"ABCDEFGHIJKLMNOPQRSTUVWXYZ",
	"abcdefghijklmnopqrstuvwxyz",
	"01234567890"];

	let localMaxCnt = 0;
	let globalMaxCnt = 0;
	let dummy = '';
	let hasContinuos = false;

	for(var i=0; i<src.length; i++) {
		const currentChar = src[i];
	for(var j=0; j<checkTarget.length; j++) {
		const targetIndex =  checkTarget[j].indexOf(currentChar)
		if(targetIndex > -1) {
			if(dummy == checkTarget[j][targetIndex-1]) {
				localMaxCnt++;
				globalMaxCnt = Math.max(globalMaxCnt, localMaxCnt);
				hasContinuos = true;
				 continue;
			}
		}
	}
	
	if(!hasContinuos) {
		localMaxCnt = 0;
	}
	hasContinuos = false;
	dummy = src[i];
	}
	return globalMaxCnt+1;
}