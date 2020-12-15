<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/client/common/header.jsp"%>
<%@ page import="java.util.List,com.web.review.model.vo.Review" %>
<%-- <% 
	List<Review> reviewAllList=(List)request.getAttribute("reviewAllList");
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
	border-bottom: 3px solid rgba(0,0,0,0.5);
}

div.review-title {
	float: left;
	padding: 20px 0;
}

div.review-selection {
	padding: 10px 0;
	display: flex;
	justify-content: flex-end;
}

div.review-dropdown {
	margin-right: 20px;
}

select.review-select {
	margin: 30px 0;
	border: none;
	appearance: none;
}

div.review-toggle {
	display: inline-flex;
	padding: 30px 5px;
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

/* ====================포토리뷰 스위치================================== */
/* 토글 스위치 스타일 */
/* The switch - the box around the slider */
/* .switch {
	position: relative;
	display: inline-block;
	width: 50px;
	height: 20px;
	margin-left: 10px;
	vertical-align: middle;
}
 */
/* Hide default HTML checkbox */
/* .switch input {
	display: none;
} */

/* The slider */
/* .slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}
 */
/* .slider:before {
	position: absolute;
	content: "";
	height: 15px;
	width: 15px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #2196F3;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
} */

/* Rounded sliders */
/* .slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
} */

/* ====================포토리뷰 스위치================================== */
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
	width: 500px;
	height: 500px;
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

div#moreReviewList {
	margin:20px;
	padding:10px;
	font-size:17px;
	border:solid 1px rgb(190, 190, 196);
	cursor:pointer;
}
div#moreReviewList:hover {
   background: rgb(251, 251, 249);
   outline: none;
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
					고객리뷰 ( <span id="number-of-object"></span> )
				</h1>
			</div>
			<div class="review-selection">
				<div class="review-dropdown">
					<select class="review-select" name="reviewSelect">
						<option value="전체">모든 상품</option>
						<option value="케이스">케이스</option>
						<option value="악세사리">악세사리</option>
						<option value="생활용품">생활용품</option>
						<option value="패션">패션</option>
					</select>
				</div>
				<!-- <div class="review-toggle">
					<span style="margin: 0; font-size: 14px;">포토리뷰</span> 
					<label class="switch"> 
						<input type="checkbox"> 
						<span class="slider round"></span>
					</label>
				</div> -->
			</div>
		</div>
		<div class="review-middle" id="review-middle">
			<!-- 다시해야할듯........================div로 ======================= -->
			
			<!-- -============================================================================== -->
		</div>
		<div id="moreReviewList" style="text-align:center">
			더보기
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
						<li><img id="reviewImg">
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
</section>

<script>
	/* var check = $("input[type='checkbox']");
	check.click(function() {
		
	}); */

	// 리뷰작성창 닫기
	function closeReviewView() {
		$('.reviewView-modal-back').css('display', 'none');
	}
	
	if($('.review-select').val()=='전체') { //페이지 로드후 카테고리가 "전체"일때
		$.ajax({
			url:'<%=request.getContextPath()%>/reviewCategory', 
			type:'post',										/* 방식은 post */
			dataType:"json",									/* 데이터의 저장 형식은 json */
			data:{p_Category:$('.review-select').val()},		/* 키 : p_Category에 select의 값을 넣는다 */
			success:function(data) {		
				var reviewList=data.reviewList;					/* 변수 reviewList에 서블릿에서 받아온 reviewList를 넣는다. */
				$('#review-middle').html(data.reviewList);		/* id값 review-middle(리뷰 리스트가 들어갈 곳)에 html형식으로 reviewList를 넣는다. */
				$('#number-of-object').html(data.totalReview);		/* id값number-of-object(리뷰 수가 들어갈 곳)에 html형식으로 count를 넣는다. */
			
				//더보기 누를때 이벤트 ㅋㅋㅋ
				$("#moreReviewList").click(function(){
					$.ajax({
						url:'<%=request.getContextPath()%>/reviewCategory',
						type:'post',
						dataType:"json",
						data:{p_Category:$('.review-select').val(), contentsCount:$('#review-middle>div').length},
						success:function(data2) {
							$('#review-middle').append(data2.reviewList);
							if(data2.totalMoreReview==data2.totalReview) {
								$('#moreReviewList').css("display","none");
							}
						}
					})
				})
				//리뷰리스트 불러오기 성공시 상세보기 이벤트
				$('div.reviewImg').click(function() {			/* reviewImg의 div태그를 클릭하면 이하 로직을 실행한다. (review상세보기 기능) */
					$('.reviewView-modal-back').show();			/* reivew 상세보기 모달창을 보여준다. */
					var star=$('div.starOut>span');										/* 변수 star에 starOut의 div태그 아래의 span태그를 저장 */
					$.ajax({
						url:'<%=request.getContextPath()%>/reviewView',					
						type:'post',
						data:{rvNo:$(event.target).parent().siblings('input').val()},	/* 키: rvNo : hidden된 input의 값을 넣는다 (리뷰번호) */
						success:function(data) {
							console.log(data);
							$('#reviewViewWriter').text(data.m_nickName);				/* 각 id의 태그에 text형식으로 서블릿에서 온 data를 입력한다. */
							$('#reviewViewDate').text(data.rv_Date);
							$('#reviewViewContent').text(data.rv_Content);
							$('#reviewImg').attr('src','<%=request.getContextPath()%>/upload/review/'+data.rv_Re_Name);
							for(let i=0;i<5;i++) {										/* 새로운 리뷰 별점을 위하여 기존에 있던 별점을 삭제하고  */
								$(star[i]).removeClass('checked');						/* 해당 리뷰의 별점을 기준으로 checked 클래스를 추가한다. */
							}
							for(let i=0;i<data.rv_Star;i++) {
								$(star[i]).addClass('checked');
							}
						}
					})
				})
			}
		})
	} 
	
	$('select.review-select').change(function(){
		$.ajax({
			url:'<%=request.getContextPath()%>/reviewCategory', 
			type:'post',										/* 방식은 post */
			dataType:"json",									/* 데이터의 저장 형식은 json */
			data:{p_Category:$('.review-select').val()},		/* 키 : p_Category에 select의 값을 넣는다 */
			success:function(data) {		
				var reviewList=data.reviewList;					/* 변수 reviewList에 서블릿에서 받아온 reviewList를 넣는다. */
				$('#review-middle').html(data.reviewList);		/* id값 review-middle(리뷰 리스트가 들어갈 곳)에 html형식으로 reviewList를 넣는다. */
				$('#number-of-object').html(data.totalReview);		/* id값number-of-object(리뷰 수가 들어갈 곳)에 html형식으로 count를 넣는다. */
				
				//더보기 누를때 이벤트 ㅋㅋㅋ
				$("#moreReviewList").click(function(){
					$.ajax({
						url:'<%=request.getContextPath()%>/reviewCategory',
						type:'post',
						dataType:"json",
						data:{p_Category:$('.review-select').val(), contentsCount:$('#review-middle>div').length},
						success:function(data2) {
							$('#review-middle').append(data2.reviewList);
							if(data2.totalMoreReview==data2.totalReview) {
								$('#moreReviewList').css("display","none");
							}
						}
					})
				})
				//리뷰리스트 불러오기 성공시 상세보기 이벤트
				$('div.reviewImg').click(function() {			/* reviewImg의 div태그를 클릭하면 이하 로직을 실행한다. (review상세보기 기능) */
					$('.reviewView-modal-back').show();			/* reivew 상세보기 모달창을 보여준다. */
					var star=$('div.starOut>span');										/* 변수 star에 starOut의 div태그 아래의 span태그를 저장 */
					$.ajax({
						url:'<%=request.getContextPath()%>/reviewView',					
						type:'post',
						data:{rvNo:$(event.target).parent().siblings('input').val()},	/* 키: rvNo : hidden된 input의 값을 넣는다 (리뷰번호) */
						success:function(data) {
							$('#reviewViewWriter').text(data.m_nickName);				/* 각 id의 태그에 text형식으로 서블릿에서 온 data를 입력한다. */
							$('#reviewViewDate').text(data.rv_Date);
							$('#reviewViewContent').text(data.rv_Content);
							for(let i=0;i<5;i++) {										/* 새로운 리뷰 별점을 위하여 기존에 있던 별점을 삭제하고  */
								$(star[i]).removeClass('checked');						/* 해당 리뷰의 별점을 기준으로 checked 클래스를 추가한다. */
							}
							for(let i=0;i<data.rv_Star;i++) {
								$(star[i]).addClass('checked');
							}
						}
					})
				})
			}
		})
	})
</script>


<%@ include file="/views/client/common/footer.jsp"%>