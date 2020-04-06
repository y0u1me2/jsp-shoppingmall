<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/client/common/header.jsp"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
        .reviewWrite-modal-back {
            display: block;
            z-index: 1;
            width: 100%;
            height: 100%;
            top: 0;
            position: fixed;
            background-color: rgba(0, 0, 0, 0.4);
        }

        .reviewWrite {
            width: 400px;
            max-height: 650px;
            padding: 40px 20px;
            background-color: #fefefe;
            margin: 5% auto 15% auto;
            position: relative;
        }

        .reviewWriterStar {
            text-align: center;
            margin: 0 39% 50px 39%;
            display: inline-flex;
        }

        div.starOut {
            cursor: pointer;
            width: 20px;
            height: 20px;
        }

        /* 닫기버튼(X) */
        .close-btn {
            position: absolute;
            top: 0;
            right: 0;
            width: 50px;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .close-btn>.close {
            position: relative;
            font-size: 20px;
            cursor: pointer;
        }

        .close:hover {
            color: red;
        }

        .reviewWrite-top {
            text-align: center;
            font-weight: bolder;
            font-size: 16px;
        }

        /* 리뷰 내용 */
        .reviewContent {
            text-align: center;
        }

        /* 첨부파일 div */
        div.reviewPhoto {
            text-align: center;
        }

        /* 첨부파일 인풋 */
        div.reviewPhoto>input {
            border: 1px dotted black;
        }

        /* 별점 스타일  */
        .checked {
            color: orange;
        }

        /* 하단부 */
        .reviewWrite-bottom {
            text-align: center;
            padding-top: 50px;
        }

        .reviewWrite-bottom>button {
            width: 100px;
        }

        /* Add Zoom Animation 
        팝업시 줌 애니메이션*/
        .animate {
            animation: animatezoom 0.6s
        }

        @keyframes animatezoom {
            from {
                transform: scale(0)
            }

            to {
                transform: scale(1)
            }
        }
    </style>
<section>
        <div class="reviewWrite-modal-back">
            <div class="animate reviewWrite">
                <form method="POST" onsubmit="return ">
                    <div class="reviewWrite-top">
                        <h2 style="margin: 0 0 20px 0">리뷰쓰기</h2>
                        <!-- 로그인 창 X표시 -->
                        <div class="close-btn">
                            <span onclick="closeReviewWrite();" class="close" title="Close Modal">&times;</span>
                        </div>
                    </div>
                    <div class="reviewWrite-middle">
                        <h3 style="text-align: center; margin: 40px 0 20px 0">상품은 만족하셨나요?</h3>
                        <div class="reviewWriterStar">
                            <div class="starOut">
                                <span name="star[0]" class="fa fa-star"></span>
                            </div>
                            <div class="starOut">
                                <span name="star[1]" class="fa fa-star"></span>
                            </div>
                            <div class="starOut">
                                <span name="star[2]" class="fa fa-star"></span>
                            </div>
                            <div class="starOut">
                                <span name="star[3]" class="fa fa-star"></span>
                            </div>
                            <div class="starOut">
                                <span name="star[4]" class="fa fa-star"></span>
                            </div>
                            <input type="hidden" name="starPoint">
                        </div>
                        <div class="reviewContent">
                            <h3>어떤 점이 좋았나요?</h3>
                            <textarea rows="5" cols="50" name="content" placeholder="최소 10자 이상 입력해주세요"></textarea>
                        </div>
                        <div class="reviewPhoto">
                            <h3></h3>
                            <input type="file" name="up_file">
                        </div>
                    </div>
                    <div class="reviewWrite-bottom">
                        <button type="button" onclick="closeReviewWrite();">취소</button>
                        <button type="submit">등록</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
<script>
        // 리뷰작성창 닫기
        function closeReviewWrite() {
            $('.reviewWrite-modal-back').css('display', 'none');
        }
        //별점호버
        var star = $('div.starOut');
        for (let i = 0; i < star.length; i++) {
            $(star[i]).mouseenter(function () {//마우스가 별안에 들어오면
                for (let k = 0; k < star.length; k++) {
                    $(star[k]).children('span').removeClass('checked');
                }
                for (let j = 0; j < i + 1; j++) {
                    $(star[j]).addClass('checked');
                    $(star[i]).mouseleave(function () {
                        $(star[j]).removeClass('checked');
                    })
                }
            })
            $(star[i]).click(function () {
                console.log(this);
                for (let j = 0; j < i + 1; j++) {//마우스로 별점 클릭했을때
                    $(star[j]).children('span').addClass('checked');//별점 유지
                }
                console.log($(this).children('span'));
                console.log($(this).children('span').attr('name','star[0]'));
                console.log($(this).children('span')==$(this).children('span').attr('name','star[0]'));
            })
        }
        

    </script>

<%@ include file="/views/client/common/footer.jsp"%>