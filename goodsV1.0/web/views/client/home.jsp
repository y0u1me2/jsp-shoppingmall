<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/client/common/header.jsp" %>

<style>
 	a{
 		text-decoration:none;
 	} 
 	
    /* 날라오는 굿즈 이미지 */
    #goodslogo {
        animation: bounceInDown 4s;
        text-align: center;
        padding-left: 450px;
        width: 500px;
        right: 200px;
    }

    /* 타이핑 텍스트 */
    .typing-txt {
        display: none;
        font-size: 17px;
        position: relative;
        /* top: 200px; */
        font-weight: bold;
    }

    .typing>ul>li {
        color: rgb(26, 18, 23);
        position: relative;
        left: 200px;
        bottom: 30px;

    }

    .typing>ul {
        list-style: none;
        text-align: center;
    }

    .typing ul li {
        display: block;
    }

    .typing ul li.on {
        display: inline-block;
        animation-name: cursor;
        animation-duration: 0.3s;
        animation-iteration-count: infinite;
    }

    @keyframes cursor {
        0% {
            border-right: 1px solid #fff;
        }

        50% {
            border-right: 1px solid #000;
        }

        100% {
            border-right: 1px solid #fff;
        }
    }

    /* 날라오는 굿즈 애니메이션 */
    @keyframes bounceInDown {
        0% {
            opacity: 0;
            transform: translateY(150px);
        }

        100% {
            transform: translateY(0px);
        }
    }


    /* 메인 배경 */
    #star {
        width: 1366px;
        height: 700px;
    }

    /* 공구게시판 섹션  */
    .body1 {
        position: relative;
        text-align: center;
        height: 10px;
    }

    /* 공구상품 예시 이미지*/
    .goods {
        position: relative;
        top: 30px;
        width: 1366px;
        height: 600px;

    }

    /* 이미지들 첫번째줄 */
    .imgss {

        display: flex;
        font-size: 20px;
        font: bold;
        padding: 0px;
        text-align: left;
        position: relative;
        top: 100px;
    }


    #airpod {
        margin-right: 80px;
        margin-left: 140px;
    }

    /* 대량구매 이미지 */
    #sale {
        position: relative;
        bottom: 360px;
        left: 10px;
    }

    #phone {
        margin-right: 80px;
    }

    /* 이미지들 두번째줄 */
    .imgss2 {

        display: flex;
        font-size: 20px;
        font: bold;
        padding: 0px;
        text-align: left;
        position: relative;
        top: 100px;
        margin-top: 30px;

    }

    #badge {
        margin-right: 80px;
        margin-left: 140px;
    }

    #tee {
        margin-right: 80px;
    }

    /* 상품 만드는 과정 */
    .process {
        position: relative;
        top: 200px;
        height: 230px;
        background-color: rgb(250, 251, 251);
    }

    /* 손쉬운 제작 버튼 */
    #pbtn {

        height: 30px;
        width: 90px;
        background-color: rgb(250, 251, 251);
        border-radius: 20px;
        border: 1px solid rgb(209, 209, 205);
        font-size: 12px;
        color: rgb(83, 83, 82);
        position: relative;
        top: 30px;
        left: 60px;
    }

    .pro-text {
        display: flex;
        color: rgb(92, 91, 91);
        position: relative;
        left: 40px;
    }

    /* 상품선택 */
    .ptext1 {
        position: relative;
        left: 30px;
        top: 50px;

    }

    .ptext1>img {
        width: 50px;
    }

    /* 사진추가 */
    .ptext2 {
        position: relative;
        left: 120px;
        top: 50px;

    }

    .ptext2>img {
        width: 50px;
    }

    /* 장바구니 */
    .ptext3 {
        position: relative;
        left: 200px;
        top: 50px;

    }

    .ptext3>img {
        width: 50px;
    }

    /* 배송 */
    .ptext4 {
        position: relative;
        left: 270px;
        top: 50px;

    }

    .ptext4>img {
        width: 50px;
    }

    /* 인기공구 보러가기 버튼 */
    #btn {
        height: 40px;
        width: 150px;
        background: #313030;
        border-radius: 7px;
        border: 0;
        font-size: 15px;
        color: rgb(233, 233, 229);
        position: relative;
        top: 100px;
    }
    
     /* 풋터고정 */
     #line {
        top: 280px;
    } 

    .foot {
        top: 350px;
    }


</style>


<section>

    <!-- 카테고리 메뉴 선택시 나오는거 -->

    <div class="scstyle">
        <div>
            <div style="position: absolute;">
                <div style="position: relative; top: 10px; left: 10px;">
                    <img id="goodslogo" src="<%=request.getContextPath()%>/images/common/영문검정.png"></img>

                    <ul class="typing-txt">
                        <li>굿즈계의 떠오르는 샛별</li>
                        <li>G 굿즈를 만나보세요 </li>
                        <li>good goods</li>
                    </ul>

                    <div class="typing">
                        <ul>
                            <li></li>
                            <li></li>
                            <li></li>
                        </ul>
                    </div>
                    <!-- <h2 class="goodstext">굿즈계의 떠오르는 샛별<br>G 굿즈를 만나보세요<br>good goods</h2> -->
                </div>
            </div>
            <img id="star" src="<%=request.getContextPath()%>/images/common/이미지.jpg"></img>
        </div>
    </div>
   

    <div class="imgss">

        <div>
            <div id="airpod">
                <img src="<%=request.getContextPath()%>/images/product/airpods_thumbnail.jpg" width="300px" alt="">
                <br><br><a href="">에어팟 케이스</a>
                <br>
                <p style="font-size: 13px; color: rgb(110, 109, 109);  margin-top: 10px;">
                    매일매일 새로운 에어팟을 즐겨보세요.</p>
                <img id="sale" src="<%=request.getContextPath()%>/images/common/대량구매.png" width="50px">
            </div>
        </div>

        <div id="phone">
            <img src="<%=request.getContextPath()%>/images/product/smartphone_thumbnail.jpg" width="300px" alt="">
            <br><br> <a href="">핸드폰 케이스</a>
            <p style="font-size: 13px; color: rgb(110, 109, 109);  margin-top: 10px;">
                매일매일 바꿔끼고 싶은<br>특별한 케이스를 만들어보세요.</p>
        </div>

        <div id="key">
            <img src="<%=request.getContextPath()%>/images/product/keyring_thumbnail.jpg" width="300px" alt="">
            <br><br> <a href="">키링</a>
            <p style="font-size: 13px; color: rgb(110, 109, 109); margin-top: 10px;">
                요즘 인싸들의 대란템!<br>키링을 만나보세요.</p>
        </div>
    </div>

    <div class="imgss2">

        <div id="badge">
            <img src="<%=request.getContextPath()%>/images/product/badge_thumbnail.jpg" width="300px  margin-top: 10px;">
            <br><br><a href="">뱃지</a>
            <br>
            <p style="font-size: 13px; color: rgb(110, 109, 109);  margin-top: 10px;">
                세상에서 하나뿐인 나만의 디자인을<br>뱃지로 만들어보세요.</p>
        </div>

        <div id="tee">
            <img src="<%=request.getContextPath()%>/images/product/tshirt_thumbnail.jpg" width="300px" alt="">
            <br><br> <a href="">티셔츠</a>
            <p style="font-size: 13px; color: rgb(110, 109, 109);  margin-top: 10px;">
                친구들과 함께<br>커스텀 티셔츠를 만들어보세요.</p>
        </div>

        <div id="bag">
            <img src="<%=request.getContextPath()%>/images/product/ecobag_thumbnail.jpg" width="300px" alt="">
            <br><br><a href="">에코백</a>
            <br>
            <p style="font-size: 13px; color: rgb(110, 109, 109);  margin-top: 10px;">
                최애의 사진, 기억하고싶은 사진들을<br>가방에 담아 나만의 가방을 만들어보세요.</p>
        </div>

    </div>


    <!-- 상품 만드는 과정  -->
    <div class="process">
        <div style="position: relative; left:200px">
            <button id="pbtn">손쉬운 제작</button>

            <div class="pro-text">
                <div class="ptext1">
                    <img src="<%=request.getContextPath()%>/images/common/상품선택.png" alt="">
                    <p style="font-weight: bold;">01. 상품 선택</p><br>
                    <p style="font-size: 13px;">만들고 싶은 상품을<br>
                        선택해주세요.</p>
                </div>

                <div class="ptext2">
                    <img src="<%=request.getContextPath()%>/images/common/사진저장.png" alt="">
                    <p style="font-weight: bold;">02. 사진 추가</p><br>
                    <p style="font-size: 13px;">사진 영역에 원하시는 사진을<br>
                        추가해주세요.</p>
                </div>

                <div class="ptext3">
                    <img src="<%=request.getContextPath()%>/images/common/cart.png" alt="">
                    <p style="font-weight: bold;">03. 장바구니 저장</p><br>
                    <p style="font-size: 13px;">내맘대로 사진을 편집하고,<br>
                        장바구니 클릭하면 끝!</p>
                </div>

                <div class="ptext4">
                    <img src="<%=request.getContextPath()%>/images/common/배송.png" alt="">
                    <p style="font-weight: bold;">04. 굿즈빠른배송</p><br>
                    <p style="font-size: 13px;">지금 주문하면 내일 출고 예정!<br>
                </div>
            </div>

        </div>

    </div>

</section>


<script>
    // 로고 밑에 타이핑 되는 테스트

    var typingBool = false;
    var typingIdx = 0;
    var liIndex = 0;
    var liLength = $(".typing-txt>li").length;

    // 타이핑될 텍스트를 가져온다 
    var typingTxt = $(".typing-txt>li").eq(liIndex).text();
    typingTxt = typingTxt.split(""); // 한글자씩 자른다. 
    if (typingBool == false) { // 타이핑이 진행되지 않았다면 
        typingBool = true;
        var tyInt = setInterval(typing, 100); // 반복동작 
    }

    function typing() {
        $(".typing ul li").removeClass("on");
        $(".typing ul li").eq(liIndex).addClass("on");
        if (typingIdx < typingTxt.length) { // 타이핑될 텍스트 길이만큼 반복 
            $(".typing ul li").eq(liIndex).append(typingTxt[typingIdx]); // 한글자씩 이어준다. 
            typingIdx++;
        } else {
            if (liIndex < liLength - 1) {
                //다음문장으로  가기위해 인덱스를 1증가
                liIndex++;
                //다음문장을 타이핑하기위한 셋팅
                typingIdx = 0;
                typingBool = false;
                typingTxt = $(".typing-txt>li").eq(liIndex).text();

                //다음문장 타이핑전 1초 쉰다
                clearInterval(tyInt);
                //타이핑종료

                setTimeout(function () {
                    //1초후에 다시 타이핑 반복 시작
                    tyInt = setInterval(typing, 100);
                }, 700);
            } else if (liIndex == liLength - 1) {

                //마지막 문장까지 써지면 반복종료
                clearInterval(tyInt);
            }
        }
    }
</script>

<%@ include file="/views/client/common/footer.jsp" %>