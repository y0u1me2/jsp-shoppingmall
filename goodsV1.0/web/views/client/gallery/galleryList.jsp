<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/client/common/header.jsp" %>

<style>
	section{
		text-align: center;
	}

	/* 공구게시판 스타일*/
        /* 게시판 제목 */
        #boardTitle {
            /* border: 2px solid rgb(221,221,221);  */
            margin-top: 30px;
            margin-bottom: 20px;
        }

        /* 카테고리 바깥 컨테이너 */
        #cgContainer1 {
            /* border:1px solid yellow; */
            width: 100%;
            height: auto;
            display: flex;
            justify-content: center;
        }

        /* 카테고리 안쪽 컨테이너 */
        #cgContainer2 {
            /* border: 1px solid black;  */
            width: auto;
            height: auto;
            display: inline-flex;
        }

        /* 카테고리들 */
        .category {
            /* border: 1px solid red;  */
            height: auto;
            width: 100px;
            margin-left: 30px;
            margin-right: 30px;
            text-align: center;
        }

        /* 카테고리 이미지 */
        .category img {
            max-width: 100%;
        }

        /* 검색창 부분 */
        #searchBox {
            /* border:1px solid black; */
            text-align: center;
            /* line-height: 50px; */
            display: flex;
            justify-content: space-evenly;
            margin-top: 30px;
        }

       

        #boardContainer {
            /* border: 1px solid red; */
            width: 100%;
            display: flex;
            flex-wrap: wrap;
            row-gap: 100px;
            justify-content: space-between;
        }

        .board {
            margin-top: 20px;
            margin-bottom: 20px;
            width: 30%;
            height: 350px;
            /* border: 1px solid black; */
            text-align: center;
        }

        .board img {
            max-width: 100%;
        }

        /* 페이징 부분(숫자) */
        #paging {
            /* border:1px solid black;  */
            text-align: center;
            line-height: 50px;
        }

        #paging a:link {
            color: black;
            text-decoration: none;
        }

        #paging a:visited {
            color: black;
            text-decoration: none;
        }

        #paging a:hover {
            color: blue;
            text-decoration: none;
        }

        
        /* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
}

/* Modal Content (image) */
.modal-content {
  margin: auto;
  display: block;
  width: 500px;
  height: 500px;
  background:white;
  border: 1px solid red;
}

/* Caption of Modal Image */
#caption {
  margin: auto;
  display: block;
  width: 80%;
  max-width: 700px;
  text-align: center;
  color: #ccc;
  padding: 10px 0;
  height: auto;
  border: 1px solid red;
}

/* Add Animation */
.modal-content, #caption {  
  -webkit-animation-name: zoom;
  -webkit-animation-duration: 0.6s;
  animation-name: zoom;
  animation-duration: 0.6s;
}

@-webkit-keyframes zoom {
  from {-webkit-transform:scale(0)} 
  to {-webkit-transform:scale(1)}
}

@keyframes zoom {
  from {transform:scale(0)} 
  to {transform:scale(1)}
}

/* The Close Button */
.close {
  position: absolute;
  top: 15px;
  right: 35px;
  color: #f1f1f1;
  font-size: 40px;
  font-weight: bold;
  transition: 0.3s;
}

.close:hover,
.close:focus {
  color: #bbb;
  text-decoration: none;
  cursor: pointer;
}

/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px){
  .modal-content {
    width: 100%;
  }
}

#pageBar {
	width: 80%;
	margin: 40px 0 40px 0;
	text-align: center;
}

#pageBar>a, #pageBar>span {
	width: 40px;
	height: 40px;
	text-align: center;
	line-height: 40px;
	border: 1px solid #eee;
	color: #999;
	background-color: #fff;
	margin: 0 2px;
	position: relative;
	font-size: 13px;
	font-family: "YoonGothicPro760";
	display: inline-block;
	vertical-align: top;
}
        
        
    </style>



<section style="border:1px solid red">
        
        <!-- 게시판 제목 -->
        <h1 id="boardTitle">갤러리</h1>
		<h3 style="margin-bottom:50px">마음에 드는 디자인을 골라 따라 만들어보세요!</h3>
		
        
        

        <!-- 게시물 검색창 -->
        <div id="searchBox">
        	<form action="" method="post">
        		<select style="vertical-align: middle;">
                    <option>전체</option>
                    <option>케이스</option>
                    <option>악세사리</option>
                    <option>생활용품</option>
                    <option>패션</option>
                </select>
                
        		<select style="vertical-align: middle;">
                    <option>정렬</option>
                    <option>인기순</option>
                    <option>조회순</option>
                    <option>최신순</option>
                </select>
        		<input type="submit" value="검색">
        	</form>   
            
        </div>

        


        <div id="galleryContainer">
            <!--한페이지에 보여지는 게시물 개수(기본 6개 2*3) -->
            <!--나중에 jstl c:forEach 구문이나 자바스크립트 for문으로 수정 필요-->
            <div class="board">
                <img src="<%=request.getContextPath() %>/images/product/airpods_white.png" id="myImg" alt="누구누구 님의 디자인">
            </div>
            <div class="board">
                <img src="<%=request.getContextPath() %>/images/2.jpg">
            </div>
            <div class="board">
                <img src="<%=request.getContextPath() %>/images/3.jpg">
            </div>
            <div class="board">
                <img src="<%=request.getContextPath() %>/images/4.jpg">
            </div>
            <!-- <div class="board"></div>
                <div class="board"></div>
                <div class="board"></div>
                <div class="board"></div>
                <div class="board"></div>
                <div class="board"></div>
                <div class="board"></div>
                <div class="board"></div>
                <div class="board"></div>
                <div class="board"></div>
                <div class="board"></div> -->
        </div>


		<!-- The Modal -->
<div id="myModal" class="modal">
  <span class="close" id="close">&times;</span>
  <img class="modal-content" id="img01">
  <div id="caption"></div>
  <button onclick="location.replace('<%=request.getContextPath()%>/gallery/imageDownload')">따라 만들기</button>
</div>










		<div id="pageBar">
			<%=request.getAttribute("pageBar")%>
		</div>
       

	

    </section>


<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the image and insert it inside the modal - use its "alt" text as a caption
var img = document.getElementById("myImg");
var modalImg = document.getElementById("img01");
var captionText = document.getElementById("caption");

img.onclick = function(){
  modal.style.display = "block";
  modalImg.src = this.src;
  captionText.innerHTML = this.alt;
  $('body').css("overflow", "hidden");
  
}

// Get the <span> element that closes the modal
var span = document.getElementById("close");

// When the user clicks on <span> (x), close the modal
span.onclick = function() { 
  modal.style.display = "none";
  $('body').css("overflow", "scroll");
}
</script>



<%@ include file="/views/client/common/footer.jsp" %>