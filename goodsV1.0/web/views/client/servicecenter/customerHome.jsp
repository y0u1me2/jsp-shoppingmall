<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/client/common/header.jsp" %>
 <style>
 
        section {
            position: relative;
            left: 10%;
            display: inline-flex;
            /* border: 1px solid blue; */
            width: 80%;
          /*  height: 50%;  */
        }

        /*CONTACT US 고객센터 번호 및 이메일 휴일안내 */
        .goto {
            position: relative;
            bottom: 382px;
            left: 600px;
        }
/* 
        .box {
            border: 1px solid red;
        } */

        /*고객센터Home , 공지사항 등 */
        .aside {
            /* border: 1px solid yellow; */
            width: 20%;
            height: 100%;
            line-height: 130%;
        }

        /* */
        .content {
            /* border: 1px solid green; */
            width: 80%;
            height: 100%;
            line-height: 200%;

        }

        .line {
            border-bottom: 1px solid silver;
            text-align: left;
             
        }
        .line2{
            border-bottom:1px solid silver;
            text-align: left;
        }
            /*고객센터 링크 색상 바꾸기*/
            .senter{
            text-decoration: none;
            color: black;
        }
        /*고객센터 목록 앞에보이는 것*/
        .lnb_list a {
    padding-top: 3px;
    padding-left: 13px;
    line-height: 25px;
    font-size: 16px;
    color: #949494;
    background: transparent url(https://s3-ap-northeast-2.amazonaws.com/redprintingweb.common/2017/img/icon/menu_arrow.svg) no-repeat left 6px;
}
        .senter>li>a{
            text-decoration: none;
            color: black;
        }
        ul{
            list-style:none;
        }
        h2{
color:#5F5D5D;
}
h5{
color:#5F5D5D;
}
    </style>
    
    <section>
        <!-- HOME // CONTACT -->
        <div class="aside">
            <h5 style='line-height:400%'>&nbsp&nbsp HOME // CONTACT US</h5>
            <h2 style='line-height:300%'>&nbsp&nbsp고객센터</h2>

            <ul class="lnb_list">
                <!-- 고객센터 목록 -->
                <li><a href="<%=request.getContextPath() %>/schome" style="color: #0E0E0E; font-weight: bolder;">고객센터 Home</a></li><br />
                <li><a href="<%=request.getContextPath()%>/notice/noticeList">공지사항</a></li><br />
                <li><a href="<%=request.getContextPath() %>/faqPay?cg=FAQ_1">FAQ</a></li><br />
                <li><a href="">이벤트</a></li><br />
                <li><a href="">이용안내</a></li><br />
                <li><a href="">제작 가이드</a></li><br />
                <li><a href="<%=request.getContextPath() %>/privacy">개인정보 보호정책</a></li><br />
                <li><a href="<%=request.getContextPath() %>/tou">이용약관</a></li><br />
                <li><a href="">회사소개</a></li><br />
            </ul>
        </div>


        <div class="content">
            <h2 style="text-align: center;">CONTACT US</h2>
            <table style="width:100%; font-weight: bold;">
                <!--G 굿즈 고객센터 전화번호 등-->
                <tr>
                    <td colspan=2 style="font-weight:bolder; border-bottom: 1px solid black;">굿굿즈 고객센터</td>
                </tr>

                <tr>
                    <td class="line"><img style="margin:0px 15px 0px 140px;" src="<%=request.getContextPath()%>/images/servicehome/phone.svg">전화번호</td>
                    <td class="line2">1544-0000</td>
                </tr>
                <tr>
                    <td class="line"><img style="margin:0px 15px 0px 140px;" src="<%=request.getContextPath()%>/images/servicehome/clock.svg">근무시간 및 휴뮤안내</td>
                    <td class="line2">평일 9:30 ~ 18:30(식사시간:12:30~13:30)<br />토/일/공휴일 휴무</td>
                </tr>
                <tr>
                    <td class="line"><img style="margin:0px 15px 0px 140px;" src="<%=request.getContextPath()%>/images/servicehome/email.svg">이메일</td>
                    <td class="line2">Ggoods@Ggoods.co.kr</td>
                </tr>
                <tr>
                    <td class="line">&nbsp</td>
                    <td class="line">&nbsp</td>
                </tr>
                <tr>
                    <td colspan=2 style="font-weight:bolder;border-bottom: 1px solid silver">입금 계좌안내</td>
                </tr>
                <tr>
                    <td class="line"><img style="margin:0px 15px 0px 140px;" src="<%=request.getContextPath()%>/images/servicehome/comment.svg">IBK기업은행</td>
                    <td class="line2">123-456789-01-123 (예금주: 주식회사 굿굿즈)</td>
                </tr>
                <tr>
                    <td colspan=2 style="font-weight:bolder; border-bottom: 1px solid black;">
                        <h2>오시는 길</h2>
                    </td>
                </tr>
                <tr>
                    <td colspan=2 style="font-weight:bolder;color: #0E0E0E;">사무실 [방문 수령처] : (월~금) 저녁7시까지</td>
                </tr>
                <tr>
                    <td style="font-size: 13px;">연락처 / 1544-0000</td>
                </tr>
                <tr>
                    <td style="font-size: 13px;">지번 / 서울 강남구 xx동2가 278-33</td>
                </tr>
                <tr>
                    <td style="font-size: 13px;">도로명 / 서울 강남구 xx로11가길 6</td>
                </tr>
                <tr>
                    <td style="font-size: 13px; color:slategray;">강남역1번출구에서 G 굿즈 오시는 길 / (도보7분)</td>
                </tr>
            </table>


            <!-- * 카카오맵 - 지도퍼가기 -->
            <!-- 1. 지도 노드 -->
            <div id="daumRoughmapContainer1580542946944" class="root_daum_roughmap root_daum_roughmap_landing"></div>

            <!--
	2. 설치 스크립트
	* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
-->
            <script charset="UTF-8" class="daum_roughmap_loader_script"
                src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

            <!-- 3. 실행 스크립트 -->
            <script charset="UTF-8">
                new daum.roughmap.Lander({
                    "timestamp": "1580542946944",
                    "key": "wtgs",
                    "mapWidth": "860",
                    "mapHeight": "400",
                }).render();
            </script>
    </section>




<%@ include file="/views/client/common/footer.jsp" %>