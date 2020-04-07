<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List, com.web.gallery.model.vo.Gallery"%>
<%
	List<Gallery> list = (List)request.getAttribute("list");

%>

            <%for(Gallery g : list){ %>
		      <div class="board">
		          <img src="<%=request.getContextPath() %>/upload/custom/<%=g.getFilename() %>" class="myImg" alt="<%=g.getmNickname()%> 님의 디자인">
		          <input name="gNo" type="hidden" value="<%=g.getgNo()%>">
		          <p>다운로드횟수: <%=g.getDownCnt()%></p>
		          <p>조회수: <%=g.getViewCnt()%></p>
		          <p>등록일: <%=g.getEnrollDate()%></p>
		      </div>
			<%} %>
        
        
        
		<div id="pageBar">
			<%=request.getAttribute("pageBar")%>
		</div>
<script>
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

//Get the modal
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
});

// Get the <span> element that closes the modal
var span = $("#close");

// When the user clicks on <span> (x), close the modal
span.click(function() { 
  modal.hide();
  $('body').css("overflow", "scroll");
});


</script>