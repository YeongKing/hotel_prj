<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.231/spring_mvc/common/favicon.ico">
<!-- bootstrap 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!-- bootstrap 끝 -->
<!--sist스타일시트 시작-->
<link rel="stylesheet" href="http://192.168.10.231/spring_mvc/common/css/main.css" type="text/css" media="all" />
<link rel="stylesheet" href="http://192.168.10.231/spring_mbv/common/css/board.css" type="text/css" media="all" />
<!--sist스타일시트 끝-->
<!-- JQUERY CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--JQUERY CDN 끝-->
<style type="text/css">
	
</style>

<script type="text/javascript">
	$(function(){
		
	
	}); //ready
</script>
</head>
<body>
<div>
<div class="timeWrap"><!-- 221221 div 넣음 / 단체일때 display:none  -->
                                <strong class="timeTit">점심</strong><!-- 점심 -->
                                <div class="timeSel morning"><!--  221206 class추가 -->
                                    <ul class="frmList" id="timeUlAm"><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오전 6:00</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오전 6:30</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오전 7:00</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오전 7:30</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오전 8:00</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오전 8:30</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오전 9:00</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오전 9:30</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오전 10:00</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오전 10:30</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오전 11:00</label></li><li class="frmRadio"><input type="radio" id="time0" name="frmRdo" data-ampm="am" data-token="H4sIAAAAAAAA_wEYAef-QvL05tkzx0dfR9LSmbbJQ6ZwJhPJeuFciJ5aOhG5aiLBeOGYUxBNKa1DP-wHLJ0-xjgZruWGWpZUt1PaKqQuTjS0KlVf7E8ohjXKiL554sulKR3aiyy2RuK2cEtQUgQYhsde23jfIL2nOCJ58Zu1PkLszUfpyCanCBe080mFQkMu0zcK5179cQDy4hn6eoQl9d_oD69XLjl9WGiJrLdXN3n6SCU3AZdE4tMtJgZpUwrNgDMNufs_qn6FN49Tz0_Q3mmc6Wjfsl0zNqLISbMuVRFYhka64db9ukWXl9rATf1ICxv5H8OY4T_r1fGW8qwbFn9tFTkhFrwKtxytNVmIuapIpdmaZPFu7RYr5p1i6YtjdCBPH7PXlU-g_icYAQAA" onclick="fncSelectTime(this);"><label for="time0">오전 11:30</label></li><li class="frmRadio"><input type="radio" id="time1" name="frmRdo" data-ampm="pm" data-token="H4sIAAAAAAAA_wEYAef-gfosQgSLhI3K1U327C5eNIinp4gXLe_K9sHHQadmf67BjnwSenLy3BhbT_o7n886kk5l50L_JSddaBQX5GMOE798RNaX0lxqXHkWQ_hLrAWjwoNSQEoEWQpMdKAti_4tC7H1rVYzXx5_rJYdZh2U7vwJmEYyVhZokuijq_y2IA1v4-KBnYwUlHyA2Cm9W_bPuMwoWIf2OsypuCgQo48sjxOxbWAsxQmvSGipwrf2aC6Kb_PHRbwb4JKH-IukBmYNzVu-PWaTssrSxALZrj2NsDjroq0JhEQmYk7iUK5ODStVlbBQ7k7liuvcLU_CVEql5DTFn1VpX5jjA_kQbp_jQdbOJc5Ntxt-dj5ovM4L1DH56MYv98yH7f-wlxoYAQAA" onclick="fncSelectTime(this);" data-gtm-form-interact-field-id="0"><label for="time1">오후 12:00</label></li><li class="frmRadio"><input type="radio" id="time2" name="frmRdo" data-ampm="pm" data-token="H4sIAAAAAAAA_wEYAef-d35vNDpZLC1dHjRM4dwDAkQhHp6WOMLc2loMZu7h7roX2WeeuZOMf1N2lr1lqAVOXVu-QHIV0q0vAPrYziIysu-icOJkZGB_NPq_79vK7zWFBUf6IUhuIivjQHcr4bco4saGco98mpGcQYVMmHR5Y29dZk2BoUymbsiF3S17vkXXH7WCDgVY1YsQylWbsidt5LTP4y1XboYR4B0Eup3ti9bIbZSMsGHfeNszIY9stQXwcWZbG0aavdqxRCdSOD2EU2jHewAJM_5Nso951NLYUsC3UnloT31utumTVRhYwGxtpNK-M8uPMt0MFF1H7MxHCTu5chVJj26w0uKLXExhLppKVMkYAdHWcvT1yaE8SMzM48ARgrYgwzxNG5AYAQAA" onclick="fncSelectTime(this);" data-gtm-form-interact-field-id="1"><label for="time2">오후 12:30</label></li><li class="frmRadio"><input type="radio" id="time3" name="frmRdo" data-ampm="pm" data-token="H4sIAAAAAAAA_wEYAef-P1o8UdYm3u14hoyhqe5EvdtEdTtXH7HuCCcTFsQhlllk3a3vX2feGKKDZK_g3fQN0LagdqC6nwbV0flZ80TiGlX6xshI4lYbbvrIycOU2YERPe7K2e_BGH-DmAaNLsmm2ypJArnTLTm4f75q17_DFgqAAtqXd42MyIiiMfwEoUUbq9jr9kNlbD__S2HDbwKsZf_2IlvnwDEFppRBkmClX7GUioYHvzB_hVyo04b3mqBvrdNc8UnlK99n27-aZiSH-Bgf9fNQNpTX_pHISKu6BH1iGbJHCy0lzBGh8_5MhtRb8gssDFfzjLydQaw9Tmrn95BfvTFIXGiITAqy8HRta9tetbllpQIyr1Wl5nH95O54f7r512bkFzH1aKwYAQAA" onclick="fncSelectTime(this);" data-gtm-form-interact-field-id="3"><label for="time3">오후 1:00</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오후 1:30</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오후 2:00</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오후 2:30</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오후 3:00</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오후 3:30</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오후 4:00</label></li><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오후 4:30</label></li></ul>
                                </div>
                                <strong class="timeTit">저녁</strong><!-- 저녁 -->
                                <div class="timeSel afternoon"><!--  221206 class추가 -->
                                    <ul class="frmList" id="timeUlPm"><li class="frmRadio" style=""><input type="radio" name="frmRdo" disabled=""><label for="time0">오후 5:00</label></li><li class="frmRadio"><input type="radio" id="time4" name="frmRdo" data-ampm="pm" data-token="H4sIAAAAAAAA_wEYAef-Iz__zh1UlVirrKdR9NBcypXEtgvq21WWxEQnMSydzz9pT7_kwuuHZa1_g9Y1r5HZFmkNnphH8OlNO5nKjFlG_Q1o0r9EfGpp9sUH2iKbwcBQK42BOiFflYts_QFEk772XQoi7JT0yGMfIv0wrNJr92MoBpSbuLg5Q3uLheok2KnvqUr-xX5kSvH8tNsiXAZ6Me9JNyKYN3iyHkvL-rGJvy0HyCD9hv8xi6Z1eZkrhU2xXOfpnrevl-l5uISVPlVYjjd_v9Zj1j8EtIYxj96LQz65gn2r7mkunDyE-SzKH0ZEtfgzcFyJ6Tm-CqNnYtBKOiK9s5iqzmFDkPavQVyKPQwTlOMJ1TgrapDpSTCvSgQHumxwTCObT_K27JEYAQAA" onclick="fncSelectTime(this);"><label for="time4">오후 5:20</label></li><li class="frmRadio"><input type="radio" id="time5" name="frmRdo" data-ampm="pm" data-token="H4sIAAAAAAAA_wEYAef-jgCtmJ71z68DXrK-OZYASYU72_kjbPi4xFbOXi6UkG7-MZC5z2KPmdMdz6Bw7gSMbm-iywkkI_1g6Hfp4JBX79n9yvaMxtlhsh00paBH6sH8ZYMLWCKEnYNcQy31x1-4JiFE9Pn1M_XndH70hYP12tHRZD6PycRj-nGFpHa5zJTupYC62LJNco4daxPIHIbYNlHYX9jhx1uzFZIVzbQfxPfucEkB9OvIhPQRM9adVOvT661774NADJ3DUEVm7dgdNjfXUifNGTObvyf8Ng7TC5OmOnUrTqxePbA4nol51t9rYgpHuVSd49PLp6ooQAnpL7SNANCqD6qyjrF7DWo_UAx-oxrZewl8IaaRX6sEkUZrmp8tdcqvqpkqXIIYAQAA" onclick="fncSelectTime(this);"><label for="time5">오후 5:30</label></li><li class="frmRadio"><input type="radio" id="time6" name="frmRdo" data-ampm="pm" data-token="H4sIAAAAAAAA_wEYAef-A9fgcTrUsfuPOQcNm80BHxMDZMk4FzZ-gf2gRW3KzZhyeVMefFRFwfhAOOFAUuBpTtPjFbYctuwwW1gYEfCtjoz5VvG0W_26L7iVI3OHkTo59lHctYXdjj2NLWo1591N9TJzeci9eQGiRNo7-LSXks14SyginUBA-fe6-cAVn1J41_H4fo5T7-2HZS-Qbvn7UhGBpj_5yae3iB66mH3d2mWbikFItreMnG2Oe-bIUxrVeqFzMNqfEj_4k0xgwQUWNwuqrXOabHVW2A9u7QqeyhtaodlDCuTMj4meNFj7uQS4BGaMcAAI1lzDmGC2IJgjZxTCtdgiYAJC_I2L9qNVvdAmE6q5ugJxKXfewp8ik1Y7QcfEz-P2pUMJAC4YAQAA" onclick="fncSelectTime(this);"><label for="time6">오후 7:50</label></li><li class="frmRadio"><input type="radio" id="time7" name="frmRdo" data-ampm="pm" data-token="H4sIAAAAAAAA_wEYAef-seOMtZ8srrDj0nPolTE96UjsEFtOqVCUoY9U5GBnndHbR07enSVdP0Z2urD0CSVX3XQrq4RaNl-Kp7dIyT41Ii88WVfFRk8YTL651QPo1OiWm47wGYRZk6-2GMNbW3NHq2Za-rOGSBoOKZ5G5zmvYDKaIARFLUhIjn5PBk3e6TillrM3lwLcMh1YXhVWK4mb8I70dhnn8GMXHygJNhVoEURJ8k7JP5y8NbRQLKqUJshR6UevRswejVJbYUjh3rJa32LNSbUBJ9rtjD6lWQTvIwfc3H6PzZQ6mg1Ppavm4AWrnv4Z8U6omqYvmvXziED3WTYbO8Sf4tOmclPIbmUvYjalCIB4DcRpdMNeQnDJ8yyfHUoRaim9mLSICo0YAQAA" onclick="fncSelectTime(this);"><label for="time7">오후 8:00</label></li></ul>
                                </div>
                            </div>
</div>
</body>
</html>