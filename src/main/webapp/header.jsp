<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" 
 info="" %>

			<div class="header"> <!-- 메뉴 열리면 gnbOn 클래스 추가 -->
			<!-- header type02 추가 되는 경우 mainArea02, mainArea03, mainArea05  -->
			<div class="headArea">
				<strong class="logo"><a href="http://localhost/hotel_prj/index.jsp">JOSUN HOTELS & RESORTS</a></strong>
				<button type="button" class="btnMenu">메뉴 열기</button> <!-- 클릭하면 menuOn 클래스 추가, 메뉴 닫기 텍스트 변경 -->
				<!-- 20200709 수정 / gnbUtil 안에 있던 호텔찾기, 다국어 영역 위치 변경  -->
				<div class="topUtil">
					<!-- <a href="#none" class="hotelFind" onClick="commonJs.popShow($('#hotelFindLayer'))">호텔찾기</a> -->
                    <a href="http://localhost/hotel_prj/package/list.jsp" class="hotelFind" >상품찾기</a>
					<div class="langArea">
						<div class="dropdown_list" aria-expanded="false">
							<div class="dropdown_value">
								<input type="text" role="combobox" value="KR" aria-expanded="false" tabindex="-1" readonly>
								<button type="button" aria-label="목록열기" class="btn_opener"></button>
							</div>
							<ul class="item_list" role="listbox">
								<li role="option" class="langKr"><a href="javascript:fncChangeLang('ko');">KR</a></li>
								<li role="option" class="langEn"><a href="javascript:fncChangeLang('en');">EN</a></li>
								<li role="option" class="langCn"><a href="javascript:fncChangeLang('zh');">CN</a></li>
								<li role="option" class="langJp"><a href="javascript:fncChangeLang('ja');">JP</a></li>
							</ul>
						</div>
					</div>
				</div>
				
				<!-- //20200709 수정 -->
				<div class="allMenu"> <!-- 화면 높이값 계산 height:적용, body:overflow:hidden -->
					<div class="inner">

    
    
                <!-- 프로모션 배너 -->
                
                    <div class="promotionBanner">
                        <a href="https://www.josunhotel.com/esgPromotion/main.do">
                            <img src="http://localhost/hotel_prj/static/home/images/ko/pc/common/pc_img_promotion_banner.jpg" alt="">
                        </a>
                    </div>
                

						<ul class="menuDepth01">
						
						
							
						
							
								
								
                                <li  >ABOUT US
									
										<ul class="menuDepth02">
																					
											
												
													<li><a href="/about/hotel.do">JOSUN HOTELS &amp; RESORTS</a>
													
													
														<ul class="menuDepth03">
															
                                                                
																    <li><a href="/about/hotel.do">기업소개</a></li>
                                                                
															
                                                                
																    <li><a href="/about/history.do">연혁</a></li>
                                                                
															
                                                                
																    <li><a href="/about/awards.do">수상내역</a></li>
                                                                
															
                                                                
																    <li><a href="/about/esg.do">ESG경영</a></li>
                                                                
															
                                                                
																    <li><a href="/about/accounts.do">결산공고</a></li>
                                                                
															
                                                                
																    <li><a href="/about/location.do">오시는길</a></li>
                                                                
															
                                                                
															
														</ul>
													
													</li>
												
											
												
													<li><a href="/press/actReport.do">NEWS</a>
													
													
														<ul class="menuDepth03">
															
                                                                
																    <li><a href="/press/actReport.do">주요소식</a></li>
                                                                
															
                                                                
															
                                                                
																    <li><a href="/press/social.do">소셜 미디어</a></li>
                                                                
															
														</ul>
													
													</li>
												
											
												
													<li><a href="/recruit/employment.do">RECRUIT</a>
													
													
													</li>
												
											
										</ul>
									
								</li>
							
						
							
								
								
                                <li  >HOTELS
									
										<ul class="menuDepth02">
																					
											
												
													<li><a href="/hotel/JosunPalace.do">조선 팰리스</a>
													
													
													</li>
												
											
												
													<li><a href="/hotel/westinSeoul.do">웨스틴 조선 서울</a>
													
													
													</li>
												
											
												
													<li><a href="/hotel/westinBusan.do">웨스틴 조선 부산</a>
													
													
													</li>
												
											
												
													<li><a href="/hotel/grandBusan.do">그랜드 조선 부산</a>
													
													
													</li>
												
											
												
													<li><a href="/hotel/grandJeju.do">그랜드 조선 제주</a>
													
													
													</li>
												
											
												
													<li><a href="/hotel/lescape.do">레스케이프 호텔</a>
													
													
													</li>
												
											
												
													<li><a href="/hotel/pangyo.do">그래비티 서울 판교</a>
													
													
													</li>
												
											
												
													<li><a href="/hotel/fpbsSeoul.do">포포인츠 바이 쉐라톤 조선 서울역</a>
													
													
													</li>
												
											
												
													<li><a href="/hotel/fpbsMyeongdong.do">포포인츠 바이 쉐라톤 조선, 서울 명동</a>
													
													
													</li>
												
											
												
													<li><a href="/hotel/parasparaSeoul.do">파라스파라 서울</a>
													
													
													</li>
												
											
												
													<li><a href="/hotel/Corallo.do">코랄로 바이 조선</a>
													
													
													</li>
												
											
										</ul>
									
								</li>
							
						
							
								
								
                                <li  >OFFERS
									
										<ul class="menuDepth02">
																					
											
												
													<li><a href="/package/list.do">PACKAGE</a>
													
													
													</li>
												
											
												
											
												
													<li><a href="/event/list.do">EVENT</a>
													
													
													</li>
												
											
										</ul>
									
								</li>
							
						
							
								
								
                                <li  >MEMBERSHIP
									
										<ul class="menuDepth02">
																					
											
												
													<li><a href="/membership/ed2_product.do">CLUB JOSUN</a>
													
													
													</li>
												
											
												
											
												
													<li><a href="/membership/event.do">EVENT</a>
													
													
													</li>
												
											
												
													<li><a href="/membership/news.do">NEWS</a>
													
													
													</li>
												
											
										</ul>
									
								</li>
							
						
							
								
								
                                <li  >MY PAGE
									
										<ul class="menuDepth02">
																					
											
												
													<li><a href="/mypage/main.do">MY PAGE</a>
													
													
													</li>
												
											
												
													<li><a href="/mypage/myPointForm.do">MY POINT</a>
													
													
													</li>
												
											
												
													<li><a href="/mypage/myCouponaForm.do">MY COUPON</a>
													
													
													</li>
												
											
												
													<li><a href="/mypage/myGoodsForm.do">멤버십확인</a>
													
													
													</li>
												
											
												
													<li><a href="/cnfirm/mber/room/reserveList.do">예약확인</a>
													
													
													</li>
												
											
												
													<li><a href="/mber/interest/roomList.do">관심리스트</a>
													
													
													</li>
												
											
												
													<li><a href="/mypage/myInfoForm.do">개인정보관리</a>
													
													
													</li>
												
											
												
											
												
											
										</ul>
									
								</li>
							
						
							
								
								
                                <li  >RETAIL BUSINESS
									
										<ul class="menuDepth02">
																					
											
												
													<li><a href="/retail/homurang.do">Restaurants</a>
													
													
														<ul class="menuDepth03">
															
                                                                
																    <li><a href="/retail/homurang.do">호무랑</a></li>
                                                                
															
                                                                
																    <li><a href="/retail/hokyungjeon.do">호경전</a></li>
                                                                
															
                                                                
																    <li><a href="/retail/jaju.do">자주 테이블</a></li>
                                                                
															
                                                                
																    <li><a href="/retail/mott32seoul.do">MOTT 32 SEOUL</a></li>
                                                                
															
														</ul>
													
													</li>
												
											
												
													<li><a href="/product/kyukmul.do">PRODUCT</a>
													
													
														<ul class="menuDepth03">
															
                                                                
																    <li><a href="/product/kyukmul.do">격물공부</a></li>
                                                                
															
                                                                
																    <li><a href="/product/kimchi.do">조선호텔 김치</a></li>
                                                                
															
                                                                
																    <li><a href="/product/janePacker.do">제인패커</a></li>
                                                                
															
														</ul>
													
													</li>
												
											
												
													<li><a href="/office/stateTower.do">OFFICE MANAGEMENT SERVICES</a>
													
													
														<ul class="menuDepth03">
															
                                                                
																    <li><a href="/office/stateTower.do">스테이트 타워</a></li>
                                                                
															
                                                                
																    <li><a href="/office/centerfield.do">센터필드</a></li>
                                                                
															
														</ul>
													
													</li>
												
											
												
											
										</ul>
									
								</li>
							
						
							
								
								
                                <li class="gnb-customer" >CUSTOMER SERVICE
									
										<ul class="menuDepth02">
																					
											
												
													<li><a href="/voc/cstmrOpinionForm.do">Q&amp;A</a>
													
													
													</li>
												
											
												
													<li><a href="/customer/faq.do">FAQ</a>
													
													
													</li>
												
											
												
													<li><a href="/customer/giftCard.do">GIFT CARD</a>
													
													
													</li>
												
											
										</ul>
									
								</li>
							
						
							
						
							
						
							
						
							
						
							
						
							
						
							
						
							
						
							
						
                        </ul>
        
        <ul class="menuDepth-add">
            <li>JOSUN LOUNGE
                <ul class="gnb-thum">
                    
                        <li class="hidden">
                            <a href="https://lounge.josunhotel.com/04/suite-jeju-sweet-journey/" target="_blank">
                                <img src="util/file/download.do?fileSn=2010120&sysCode=JOSUNHOTEL" alt="그랜드 조선 제주 스위트룸">
                                <span>Suite Tour</span>
                            </a>
                        </li>
                    
                        <li class="hidden">
                            <a href="https://lounge.josunhotel.com/04/wedding-must-go-on/" target="_blank">
                                <img src="util/file/download.do?fileSn=2010127&sysCode=JOSUNHOTEL" alt="웨스틴 조선 서울 웨딩">
                                <span>Commentary</span>
                            </a>
                        </li>
                    
                        <li class="hidden">
                            <a href="https://lounge.josunhotel.com/04/mindful-stay-to-mindful-picnic/" target="_blank">
                                <img src="util/file/download.do?fileSn=2010184&sysCode=JOSUNHOTEL" alt="ESG">
                                <span>Behind</span>
                            </a>
                        </li>
                    
                        <li class="hidden">
                            <a href="https://lounge.josunhotel.com/04/josun-hotel-heritage-quiz/" target="_blank">
                                <img src="util/file/download.do?fileSn=2010189&sysCode=JOSUNHOTEL" alt="조선 헤리티지">
                                <span>Q&amp;A</span>
                            </a>
                        </li>
                    
                        <li class="hidden">
                            <a href="https://lounge.josunhotel.com/04/the-legendary-hokyungjeon/" target="_blank">
                                <img src="util/file/download.do?fileSn=2010215&sysCode=JOSUNHOTEL" alt="호경전">
                                <span>Explore</span>
                            </a>
                        </li>
                    
                        <li class="hidden">
                            <a href="https://lounge.josunhotel.com/04/its-picnic-season/" target="_blank">
                                <img src="util/file/download.do?fileSn=2010225&sysCode=JOSUNHOTEL" alt="조선호텔 피크닉">
                                <span>Recommend</span>
                            </a>
                        </li>
                    
                </ul>
            </li>
        </ul>
						<button type="button" class="btnClose" onclick="commonJs.popClose($('#layerPop1'))">닫기</button>
					</div>
				</div>
				<!-- //allMenu -->
				<div class="gnbUtil">
					
						<ul>
							<li><a href="/hotel_prj/membership/ed2_product.do" id="membership">멤버십</a></li>
							<li><a href="/hotel_prj/login/loginForm.jsp" id="login">로그인</a></li>
							<li><a href="/hotel_prj/identify/identifyIntro.jsp" id="join">회원가입</a></li>
							<li><a href="/hotel_prj/login/noMbrLoginForm.do" id="confirmReserv">예약확인</a></li>
						</ul>
					
					
					<!-- 20200723 수정 / 버튼에서 드롭다운으로 변경 -->
					<div class="resvBtn">
						<div class="dropdown_list" aria-expanded="false">
							<div class="dropdown_value">
								<input type="text" role="combobox" value="RESERVATION" aria-expanded="false" tabindex="-1" readonly>
								<button type="button" aria-label="목록열기" class="btn_opener"></button>
							</div>
							<ul class="item_list" role="listbox">
								<li role="option"><a href="/hotel_prj/resve/room/step0.jsp" id="roomSearchGNB">ROOM</a></li>
                                
      								<li role="option"><a href="/resve/dining/resveForm.do?searchSysCode=TWC&searchDiningCode=003" id="diningSearchGNB">DINING</a></li>                             
                                
								<li role="option"><a href="/mypage/myCouponaForm.do">MEMBERSHIP</a></li>
							</ul>
						</div>
					</div>
					<!-- //20200723 수정 -->
				</div>
				<!-- //gnbUtil -->
			</div>
		</div>


