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
            margin: 25px;
            width: 400px;
            height: 450px;
            text-align: center;
            background: rgb(245, 245, 245);
        }

        .board img {
            width: 350px;
            height:350px;
            cursor: pointer;
        }

        
        
        /* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 50px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.5); /* Black w/ opacity */
}

#modal-container {
	margin: auto;
	width: 700px;
	height: 650px;
	background-color: white;
	text-align: center;
	overflow: auto;
}

/* Modal Content (image) */
.modal-content {
  width: 400px;
  height: 400px;
}

/* Caption of Modal Image */
#caption {
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

.btnBlack{
	border-radius:10px;
	border: none;
	background: #303030;
	color: white;
	font-size: 15px;
	padding:5px 10px;
}

table td{
	padding: 5px;
}



/* 댓글등록 버튼  */
button#comment-update{
	padding: 3px 10px;
	font-size: 12px;
	color: rgb(0, 0, 0);
	text-align: center;
	background-color: white;
	border: 1px solid rgb(161, 161, 161);
	position: relative;
	height:40px;
	left: 10px;
	font-size: 15px;
	border-radius: 7px;
}


/* 검색버튼 */
.btnWhite{
	padding: 3px 10px;
	color: rgb(0, 0, 0);
	text-align: center;
	background-color: white;
	border: 1px solid rgb(161, 161, 161);
	position: relative;
	height:30px;
	left: 10px;
	font-size: 15px;
	border-radius: 7px;
}

button {
	cursor: pointer;
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
        		
        		<button type="button" id="btn1" class="btnWhite">검색</button>
        	</form>   
            
        </div>



		<div id="galleryContainer">
		<%for(Gallery g : list){ %>
		      <div class="board">
		      		
		      	  <img src="<%=request.getContextPath() %>/upload/custom/<%=g.getFilename() %>" class="myImg" alt="<%=g.getmNickname()%> 님의 디자인">
		          <input name="gNo" type="hidden" value="<%=g.getgNo()%>">
		          <p style="margin-top:10px;">다운로드수: <%=g.getDownCnt()%></p>
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
	<span class="close" id="close" onclick="emptyTextarea();">&times;</span>
	
	<div id="modal-Container">
		<div style="background:#eee;">
			<img style="border:1px solid #eee;" class="modal-content" id="img01">
		</div>
		<div style="margin-top:40px;">
			<span id="caption"></span>
			<button class="btnBlack" type="button" id="modalBtn" style="">이미지 다운로드</button>
		</div>
		
		
		<%if(loginMember!=null){ %>
		<form id="frm2" style=" margin-top:40px;" onsubmit="return validate();">
			<textarea id="ta1" style="vertical-align:middle; resize:none; width:50%; border:1px solid #eee;" rows="3" placeholder="100자 이내로 입력해주시기 바랍니다." name="content"></textarea>
			<input type="hidden" id="gNo" name="gNo">
			<input type="hidden" id="mNo" name="mNo">
			<button id="comment-update" style="vertical-align:middle;">댓글 등록</button>
		</form>
		<%}else{ %>
		<p style="margin-top:40px;">댓글은 로그인 후 작성하실 수 있습니다 <button class="btnWhite" onclick="function showModal(){$('#login').show();} showModal();">로그인</button></p>
		<%} %>
		<div id="replyList" style="margin-top:40px; margin-bottom:20px;"></div>
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
	
	getReplyList($(this).next().val());
});


//댓글 리스트 불러오기(ajax)
function getReplyList(gNo){
	$.ajax({
		url:"<%=request.getContextPath()%>/gallery/getReplyList",
		data:{'gNo' : gNo},
		type:"post",
		dataType:"json",
		async:false,
		success:function(data){
			console.log(data);
			var table = $('<table>').css({'margin-left': '10%','width': '80%', 'border-collapse': 'collapse'});
			var html;
			data.forEach(function(reply) {
				if(reply['mNo']==mNo){
					html+= "<tr style='border-bottom:1px solid #eee;'><td width='20%'>"+reply['mNickname']+"<br><span style='color:#303030; font-size:12px;'>"+reply['rDate']+"</span></td><td width='65%'>"+reply['rContent']+"</td><td width='15%'><button onclick='replyDelete("+reply['rNo']+","+reply['gNo']+");' style='padding: 3px 10px; font-size: 10px; color: rgb(0, 0, 0); text-align: center; background-color: white; border: 1px solid rgb(161, 161, 161); height:30px; border-radius: 7px;'>댓글 삭제</button></td></tr>";
				}else{
					html+= "<tr style='border-bottom:1px solid #eee;'><td width='20%'>"+reply['mNickname']+"<br><span style='color:#303030; font-size:12px;'>"+reply['rDate']+"</span></td><td width='65%'>"+reply['rContent']+"</td><td width='15%'></td></tr>";
				}
			});
			
			table.append(html);
			$('#replyList').html(table);
		}
	});	
}

// Get the <span> element that closes the modal
var span = $("#close");

// When the user clicks on <span> (x), close the modal
span.click(function() { 
  modal.hide();
  $('body').css("overflow", "scroll");
});


//댓글 삭제(삭제 후 댓글 리스트 다시 불러오기)
function replyDelete(rNo, gNo){
	$.ajax({
		url:"<%=request.getContextPath()%>/ajax/replyDelete",
		data:{'rNo': rNo},
		type: 'post',
		async:false,
		success:function(data){
			alert('댓글 삭제 성공');
			getReplyList(gNo);
		}
	});
}

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

function validate(){
	if(<%=loginMember==null%>){
		alert('현재 로그인이 되어 있지 않습니다. 로그인 후 이용바랍니다.');
		return false;
	}else{
		$('#mNo').val('<%=loginMember!=null?loginMember.getM_No():""%>');
	}
	if($('#ta1').val().length>100){
		alert('100자를 초과하여 입력하셨습니다.');
		return false;
	}
	if($('#ta1').val().length==0){
		alert('내용을 입력하세요');
		return false;
	}

	const frm2 = $('#frm2').serialize();
	$.ajax({
		url: "<%=request.getContextPath() %>/gallery/replyInsert",
		type: "post",
		data: frm2,
		async:false,
		success: function(data){
			alert('댓글 등록 성공');
			getReplyList($('#frm2 #gNo').val());
		},
		error: function(){
			alert('댓글 등록 실패');
		}
	});
	
	return false;
}

function emptyTextarea(){
	$('#ta1').val('');
}


</script>



<%@ include file="/views/client/common/footer.jsp" %>