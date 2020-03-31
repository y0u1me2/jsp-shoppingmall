<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/client/common/header.jsp"%>
<%@ page import="java.util.List,com.web.review.model.vo.Review" %>
<%-- <% 
	List<Review> list=(List)request.getAttribute("review");
	int count=(int)request.getAttribute("count");
%> --%>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

/* 리뷰 창 */
div.review-container {
	width: 1140px;
	margin: 0 10%;
}

/* 리뷰 상부 타이블/스위치 */
div.review-top {
	border-bottom: 2px solid rgba(0,0,0,0.5);
}

div.review-title {
	float: left;
	padding: 20px 0;
}
#reviewWriteBtn {
	margin:30px 0;
	border:none;
	cursor:pointer;
	background-color:transparent;
}
#reviewWrite {
	margin-right:20px;
}

div.review-selection {
	padding: 10px 0;
	display: flex;
	justify-content: flex-end;
}




div.review-toggle {
	display: inline-flex;
	padding: 10px 5px;
	margin : 0 15px;
}

div.review-toggle>button {
	background-color:transparent;
	width:550px;
	height:50px;
	cursor:pointer;
	border:none;
	outline:none;
}
div.review-toggle>button.selected {
	border-top:2px solid rgba(0,0,0,0.5);
	border-left:2px solid rgba(0,0,0,0.5);
	border-right:2px solid rgba(0,0,0,0.5);
	border-bottom:none !important;
	font-size:16px;
	font-weight:bold;
}
div.review-toggle>button.unselected {
	border-bottom:2px solid rgba(0,0,0,0.5) !important;
	border-top:none !important;
	border-left:none !important;
	border-right:none !important;
	font-size:13px;
}



/* 리뷰 중간부/내용 */

div.review-middle>div {
	display: inline-flex;
	justify-content: space-between;
}

.reviewImg {
	cursor: pointer;
	padding: 10px;
}

.reviewImg>img {
	width: 150px;
	height: 150px;
}

/* 리뷰창 상품이미지 */
img.review-product {
	width: 50px;
	height: 50px;
}

div.review-middle table tr td a {
	text-decoration: none;
	color: black;
}

div.review-middle table tr td {
	padding: 10px;
}

td.reviewProductImg {
	padding-top: 0px !important;
}
/* 별점 스타일  */
.checked {
	color: orange;
}



.reviewView-modal-back {
	display: none;
	z-index: 1;
	width: 100%;
	height: 100%;
	top: 0;
	position: fixed;
	background-color: rgba(0, 0, 0, 0.4);
}

.reviewView {
	width: 1024px;
	max-height: 650px;
	padding: 40px 0;
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	position: relative;
}
/* 리뷰미들 */
.reviewView-middle {
	display: inline-flex;
}

/* 리뷰보기 사진창(왼쪽) */
.reviewViewPhoto>ul {
	list-style: none;
	padding: 0 20px;
}

.reviewViewPhoto>ul>li>img {
	width: 624px;
	/* height: 768px; */
}
/* 리뷰보기 글창(오른쪽) */
.reviewViewRight {
	padding: 10px 20px;
}

.reviewViewWriter {
	margin-bottom: 10px;
}

.reviewViewStar {
	text-align: center;
	margin: 10px 0;
	display: inline-flex;
}

div.starOut {
	/* cursor: pointer; */
	width: 20px;
	height: 20px;
}
/* 별점 스타일 
        .checked {
            color: orange;
        } */
.reviewViewDate {
	margin: 10px 0;
}

.reviewViewContent {
	margin: 20px 0;
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

.reviewView-top {
	text-align: center;
	font-weight: bolder;
	font-size: 16px;
}

/* 리뷰 작성 창 */
.reviewWrite-modal-back {
            display: none;
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

@
keyframes animatezoom {from { transform:scale(0)
	
}

to {
	transform: scale(1)
}
}
</style>


<section>

	<div class="review-container">
		<div class="review-top">
			<div class="review-title">
				<h1>
					나의리뷰 ( <span id="number-of-object"></span> )
				</h1>
			</div>
			<div class="review-selection">
				
				<div id="reviewWrite">
					<button type="button" id="reviewWriteBtn">리뷰쓰기</button>
				</div>
				
			</div>
			<div class="review-toggle">
						<button class="selected" id="writeAbleReview" type="button">작성 가능한 리뷰</button>
						<button class="unselected" id="writtenReview" type="button">작성한 리뷰</button>
			</div>
		</div>
		<div class="review-middle">
			<!-- 다시해야할듯........================div로 ======================= -->
			<%-- <%for(Review r : list) { %>
			<div id="writtenReviewList" style="border-bottom: 2px solid rgba(0, 0, 0, 0.2); width: 100%;">
				<input id="RvNo" type="hidden" value="<%=r.getRv_No()%>">
				<table>
					<tr>
						<td class="reviewProductImg" rowspan="3"><a href="#"> 
						<img class="review-product"
								src="http://blogfiles.naver.net/MjAyMDAyMjhfMjk1/MDAxNTgyODg3OTYxNTAx.65if9cw_x-J4nP-t9AUFic4VeVhf_V0mi88ZZ5XODUgg.XvjMwjsTpXdosK9tlxsm7nTTWE0YTYJtbc9Qq0pkXnMg.JPEG.momo7891/Description.jpg">
						</a></td>
						<td class="reviewTitle" colspan="3">
						<a href="#">
							상품이구요
						</a></td>
					</tr>
					<tr class="reviewTR">
						<td class="reviewStar">
						<%for(int i=0;i<r.getRv_Star();i++) { %>
							<span class="fa fa-star checked"></span>
						<%} %>
						<%for(int i=0;i<5-(r.getRv_Star());i++) { %>
							<span class="fa fa-star"></span>
						<%} %>
						
						<td class="reviewDate"><%=r.getRv_Date() %></td>
						<td class="reviewWriter"><%=r.getM_nickName() %></td>
					</tr>
					<tr>
						<td class="reviewContent" style="width:150px;" colspan="3"><%=r.getRv_Content() %></td>
					</tr>
				</table>
				<div class="reviewImg">
					<img
						src="https://s3.marpple.co/files/u_1206533/2020/3/900/18296301f2293ae1ec778c915db20e7aab4de4adc53c16b.jpg">
				</div>
			</div>
			<%} %> --%>
			<!-- -============================================================================== -->
		</div>
	</div>
	<!-- ============================================================================================ -->
	<div class="reviewView-modal-back">
		<div class="animate reviewView">
			<div class="reviewView-top">
				<!-- 로그인 창 X표시 -->
				<div class="close-btn">
					<span onclick="closeReviewView();" class="close"
						title="Close Modal">&times;</span>
				</div>
			</div>
			<div class="reviewView-middle">
				<div class="reviewViewPhoto">
					<ul>
						<li><img
							src="https://s3.marpple.co/files/u_1206533/2020/3/900/18296301f2293ae1ec778c915db20e7aab4de4adc53c16b.jpg">
						</li>
					</ul>
				</div>
				<div class="reviewViewRight">
					<div class="reviewViewWriter" id="reviewViewWriter"></div>
					<div class="reviewViewStar">
						<div class="starOut">
							<span id="starPoint" name="star[0]" class="fa fa-star"></span>
						</div>
						<div class="starOut">
							<span id="starPoint" name="star[1]" class="fa fa-star"></span>
						</div>
						<div class="starOut">
							<span id="starPoint" name="star[2]" class="fa fa-star"></span>
						</div>
						<div class="starOut">
							<span id="starPoint" name="star[3]" class="fa fa-star"></span>
						</div>
						<div class="starOut">
							<span id="starPoint" name="star[4]" class="fa fa-star"></span>
						</div>
					</div>
					<div class="reviewViewDate" id="reviewViewDate"></div>
					<div class="reviewViewContent" id="reviewViewContent"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- ================================리뷰 작성 창 ================================= -->
	<div class="reviewWrite-modal-back">
            <div class="animate reviewWrite">
                <form method="POST">
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
var writtenCount=0;
if($('#writtenReview').attr("class")=="selected") {
	$('.writtenReviewList').show();
	//============================여기 아이작스====================================
	/* 나의 리뷰 리스트 */
	$.ajax({
			url:'<%=request.getContextPath()%>/myReviewLoad',
			type:'post',
			dataType:"json",
			data:{myNo:<%=loginMember.getM_No()%>},
			success:function(data) {
				var reviewList=data.reviewList;
				$('.review-middle').html(data.reviewList);
				writtenCount=data.count;
				$('#number-of-object').html(data.count);
				$('div.reviewImg').click(function() {
					$('.reviewView-modal-back').show();
					var star=$('div.starOut>span');
					$.ajax({
						url:'<%=request.getContextPath()%>/reviewView',
						type:'post',
						data:{rvNo:$(event.target).parent().siblings('input').val()},
						success:function(data) {
							$('#reviewViewWriter').text(data.m_nickName);
							$('#reviewViewDate').text(data.rv_Date);
							$('#reviewViewContent').text(data.rv_Content);
							for(let i=0;i<5;i++) {
								$(star[i]).removeClass('checked');
							}
							for(let i=0;i<data.rv_Star;i++) {
								$(star[i]).addClass('checked');
							}
						}
					})
				})
			}
		})
		//============================여기 아이작스====================================
}else {	
		$('.writtenReviewList').hide();
}
	// 리뷰작성창 닫기
	function closeReviewView() {
		$('.reviewView-modal-back').css('display', 'none');
	}

	$('.reviewImg').click(function() {
		$('.reviewView-modal-back').show();
		var star=$('div.starOut>span');
		$.ajax({
			url:'<%=request.getContextPath()%>/reviewView',
			type:'post',
			data:{rvNo:$(event.target).parent().siblings('input').val()},
			success:function(data) {
				$('#reviewViewWriter').text(data.m_nickName);
				$('#reviewViewDate').text(data.rv_Date);
				$('#reviewViewContent').text(data.rv_Content);
				for(let i=0;i<5;i++) {
					$(star[i]).removeClass('checked');
				}
				for(let i=0;i<data.rv_Star;i++) {
					$(star[i]).addClass('checked');
				}
			}
		})
	})
	/* 작성모달창 */
	$('#reviewWriteBtn').click(function() {
		$('.reviewWrite-modal-back').css("display","block");
	})
	
	$('div.review-toggle>button').click(function() {
		$(this).addClass('selected');
		$(this).removeClass('unselected');
		$(this).siblings('button').addClass('unselected');
		$(this).siblings('button').removeClass('selected');
		if($(this).attr("id")=="writtenReview") {
			$('.writtenReviewList').show();
			//============================여기 아이작스====================================
			/* 나의 리뷰 리스트 */
			$.ajax({
					url:'<%=request.getContextPath()%>/myReviewLoad',
					type:'post',
					dataType:"json",
					data:{myNo:<%=loginMember.getM_No()%>},
					success:function(data) {
						var reviewList=data.reviewList;
						$('.review-middle').html(data.reviewList);
						$('#number-of-object').html(data.count);
						$('div.reviewImg').click(function() {
							$('.reviewView-modal-back').show();
							var star=$('div.starOut>span');
							$.ajax({
								url:'<%=request.getContextPath()%>/reviewView',
								type:'post',
								data:{rvNo:$(event.target).parent().siblings('input').val()},
								success:function(data) {
									$('#reviewViewWriter').text(data.m_nickName);
									$('#reviewViewDate').text(data.rv_Date);
									$('#reviewViewContent').text(data.rv_Content);
									for(let i=0;i<5;i++) {
										$(star[i]).removeClass('checked');
									}
									for(let i=0;i<data.rv_Star;i++) {
										$(star[i]).addClass('checked');
									}
								}
							})
						})
					}
				})
				//============================여기 아이작스====================================
		}else {	
				$('.writtenReviewList').hide();
		}
	})
	
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