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
<script>
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



function emptyTextarea(){
	$('#ta1').val('');
}



</script>