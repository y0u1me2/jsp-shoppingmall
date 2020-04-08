<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List, com.web.gallery.model.vo.Gallery"%>
<%
	List<Gallery> list = (List)request.getAttribute("list");

%>

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

       

        #galleryContainer {
            /* border: 1px solid red; */
            width: 100%;
            display: flex;
            flex-wrap: wrap;
            row-gap: 100px;
            
        }

        .board {
            margin-top: 20px;
            margin-bottom: 20px;
            width: 450px;
            height: 450px;
            text-align: center;
        }

        .board img {
            max-width: 100%;
            height:350px;
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
  background-color: rgba(0,0,0,0.5); /* Black w/ opacity */
}

#modal-container {
	margin: auto;
	width: 800px;
	height: 600px;
	overflow: scroll;
	background-color: white;
}

/* Modal Content (image) */
.modal-content {
  display: block;
  width: 400px;
  height: 400px;
}

/* Caption of Modal Image */
#caption {
  display: block;
  width: 100%;
  text-align: center;
  color: rgb(95,93,93);
  padding: 10px 0;
  height: auto;
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
	width: 100%;
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
	text-decoration: none;
}

#pageBar .cPage {
	color: black;
	font-weight: bold;
} 
        
</style>



<section>
        
        <!-- 게시판 제목 -->
        <h1 id="boardTitle">갤러리</h1>
		<h3 style="margin-bottom:50px">마음에 드는 디자인을 골라 따라 만들어보세요!</h3>
		
        
        

        <!-- 게시물 검색창 -->
        <div id="searchBox">
        	<form id="frm1">
        		<select name="sort" style="vertical-align: middle;">
                    <option value="" disabled selected hidden>정렬</option>
                    <option value="down_cnt">다운로드순</option>
                    <option value="view_cnt">조회순</option>
                    <option value="g_enroll_date">최신순</option>
                </select>
                
                <select id="select1" name="category" style="vertical-align: middle;">
                    <option value="" disabled selected hidden>카테고리</option>
                    <option value="케이스">케이스</option>
                    <option value="악세사리">악세사리</option>
                    <option value="생활용품">생활용품</option>
                    <option value="패션">패션</option>
                </select>
                
                <select id="select2" name="pName" style="vertical-align: middle; display: none;">
                </select>
        		
        		<button type="button" id="btn1">검색</button>
        	</form>   
            
        </div>



		<div id="galleryContainer">
		<%for(Gallery g : list){ %>
		      <div class="board">
		      		
		      	  <img src="<%=request.getContextPath() %>/upload/custom/<%=g.getFilename() %>" class="myImg" alt="<%=g.getmNickname()%> 님의 디자인">
		          <input name="gNo" type="hidden" value="<%=g.getgNo()%>">
		          <p>다운로드수: <%=g.getDownCnt()%></p>
		          <p>조회수: <%=g.getViewCnt()%></p>
		          <p>등록일: <%=g.getEnrollDate()%></p>
		      
		      
		          <%-- <img src="<%=request.getContextPath() %>/upload/custom/<%=g.getFilename() %>" class="myImg" alt="<%=g.getmNickname()%> 님의 디자인">
		          <input name="gNo" type="hidden" value="<%=g.getgNo()%>">
		          <p>
		          	<span style="display:inline-block; margin: 0 15;"><img src="<%=request.getContextPath() %>/images/common/download_icon.png" style="width:20px; height:20px;"> <%=g.getDownCnt()%></span>
		          	<span style="display:inline-block; margin: 0 15;"><img src="<%=request.getContextPath() %>/images/common/views_icon.png" style="width:20px; height:20px;"> <%=g.getViewCnt()%></span>
		          </p>
		          <p>등록일: <%=g.getEnrollDate()%></p> --%>
		      </div>
		<%} %>
		      
		<div id="pageBar">
			<%=request.getAttribute("pageBar")%>
		</div>

</div>


<!-- The Modal -->
<div id="myModal" class="modal">
	<span class="close" id="close">&times;</span>
	
	<div id="modal-Container">
		<img class="modal-content" id="img01">
		<span id="caption"></span>
		
		<button type="button" id="modalBtn">이미지 다운로드</button>
		<%if(loginMember!=null){ %>
		<form method="post" action="<%=request.getContextPath() %>/gallery/replyInsert" onsubmit="return mno();">
			<input type="text" name="content" autocomplete="off" maxlength="100">
			<input type="hidden" id="gNo" name="gNo">
			<input type="hidden" id="mNo" name="mNo">
			<button>댓글 등록</button>
		</form>
		<%}else{ %>
		<p>댓글은 로그인 후 작성하실 수 있습니다.</p>
		<%} %>
		<div id="replyList"></div>
	</div>
	
	
</div>
	

</section>


<script>
// Get the modal
var modal = $("#myModal");

// Get the image and insert it inside the modal - use its "alt" text as a caption
var img = $("#myImg");
var modalImg = $("#img01");
var captionText = $("#caption");
var gNo = $("#gNo");
var modalBtn = $('#modalBtn');

$(".myImg").click(function(){
	modal.show();
	modalImg.attr("src", $(this).attr('src'));
	captionText.html($(this).attr("alt"));
	gNo.val($(this).next().val());
	$('body').css("overflow", "hidden");
	modalBtn.click(function(){
		if(mNo!=""){
			location.replace('<%=request.getContextPath()%>/gallery/imageDownload?gNo='+gNo.val());
		}else{
			alert('로그인이 필요한 서비스입니다.');
			$('#login').show();
		}
	});
	$.ajax({
		url:"<%=request.getContextPath()%>/gallery/ajaxViewCntPlus",
		data:{'gNo' : $(this).next().val()},
		type:"post",
		success:function(){
		}
	});
	
	$.ajax({
		url:"<%=request.getContextPath()%>/gallery/getReplyList",
		data:{'gNo' : $(this).next().val()},
		type:"post",
		dataType:"json",
		async:false,
		success:function(data){
			console.log(data);
			var table = $('<table>');
			
			var html;
			
			data.forEach(function(reply) {
				html+= "<tr><td>"+reply['mNickname']+"<br>"+reply['rDate']+"</td><td>"+reply['rContent']+"</td></tr>";
			});
			
			
			table.append(html).css({'border': '1px solid black', 'border-collapse': 'collapse'});
			
			
			$('#replyList').html(table);
		}
	});
});

// Get the <span> element that closes the modal
var span = $("#close");

// When the user clicks on <span> (x), close the modal
span.click(function() { 
  modal.hide();
  $('body').css("overflow", "scroll");
});




function ajaxPageMove(cPage){
	let frm1=$('#frm1').serialize();
	frm1+='&cPage='+cPage;
	$.ajax({
		url:"<%=request.getContextPath()%>/ajax/getGalleryList",
		type:"post",
		data: frm1,
		success: function(data){
			$('#galleryContainer').html(data);
		}
	})
};


$(function(){
	const select2 = $('#select2');
	$("#select1").change(function() {
		if($(this).val()=='카테고리'){
			select2.hide();
			select2.empty();
		}else{
			$.ajax({
				url:"<%=request.getContextPath()%>/getProductList",
				type:'post',
				data: {'category' : $(this).val()},
				dataType:"json",
				success:function(data){
					console.log(data);
					select2.empty();
					select2.append($('<option>').text('전체'));
					data.forEach(function(element){
						select2.append($('<option>').text(element));
					});
					select2.show();
					
				}
			})
		}
	});
	
	$("#btn1").click(function(){
		const frm1 = $('#frm1').serialize();
		$.ajax({
			url:"<%=request.getContextPath()%>/ajax/getGalleryList",
			type:"post",
			data: frm1,
			success: function(data){
				$('#galleryContainer').html(data);
			}
		})
	});
	
})

function mno(){
	$('#mNo').val("<%=loginMember.getM_No()%>");
	return true;
}

</script>



<%@ include file="/views/client/common/footer.jsp" %>