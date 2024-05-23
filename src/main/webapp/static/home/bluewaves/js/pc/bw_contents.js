
/**
 *  각 호텔 메인페이지 오른쪽 하단 고정버튼 적용
 *  @param el (String)
 *  @param enterText (String)
 */ 

function handleChangeBtnText(el, enterText) {

    var leaveText;

    var initText = document.querySelector(".btnArr").innerText;

    leaveText = initText;

    var goBtn = document.querySelector(el);
    var goBtnText = goBtn.querySelector(".btnArr");


    goBtn.addEventListener("mouseenter", function() {
        goBtnText.innerText = enterText;
    })

    goBtn.addEventListener("mouseleave", function() {
        goBtnText.innerText = leaveText;
    })
}


/**
 *  메인페이지 호텔 선택
 *  HUMA1000M.html
 *  @param el (String)
 *  @param activeText (String)
 * 
 */ 
function handleActiveAnchor(el, activeText) {   

    var ACTIVE_CLASS = "on";
    var anchors = document.querySelectorAll(el);

    anchors.forEach(function(anchor) {
        
        
        var initAnchorTit = anchor.querySelector(".hotelTit").innerText;
        var anchorTit = anchor.querySelector(".hotelTit");

        anchor.addEventListener('mouseenter', function() {
            
            anchorTit.innerText = activeText;
            anchorTit.classList.add(ACTIVE_CLASS)

        })
        anchor.addEventListener('mouseleave', function() {

            anchorTit.innerText = initAnchorTit;
            anchorTit.classList.remove(ACTIVE_CLASS)

        })

    })

}
