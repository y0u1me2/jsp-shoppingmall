<%@page import="com.web.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/admin/common/header.jsp"%>
<%Notice n=(Notice)request.getAttribute("notice");
	int no=(int)request.getAttribute("no");
%>
<style>

    *{    
        margin: 0; 
    }
    
     body{
        width: 1366px;
        height: auto;
    }
    .back {
            height: 100%;
            width: 80%;
            position: relative;
            top:50px;
            bottom:50px;
            display: flex;
            left:360px;
        }
    /* 공지사항 글쓰기 */
    #gline{
        border: 1px solid rgb(177, 174, 174);
        position: relative;
        top: 20px;
        width: 80%;
        margin: 1rem 0 1rem 0;
    }
    .writeback{
    	width:100%;
    	margin-bottom:150px;
    }
   #write-tbl{
   		width:80%;
   		height:400px;
   		margin-top:10px;
   }
   	#subm{
   		text-align:right;
   		padding:15px 42px 0 0;
   }
   #write-tbl>th,td{
   		padding:10px 0 10px 0;
   }
   #one{
		font-weight: bolder;
   		font-size: 30px;
	}
	/* 완료버튼 */
	.btn_Wihte{
        padding: 3px 10px;
        /* line-height: 32px; */
        font-size: 12px;
        color: rgb(0, 0, 0);
         line-height: 32px;
        text-align: center;
        background-color: white;
        border: 1px solid rgb(161, 161, 161);
   }
</style>
<section>
	<div class="back">
		<div class="writeback">
			<h1 id="one">공지사항 수정</h1>
			<hr id="gline">
			<br><br>
	
        <input type="hidden" name="no" value=<%=no%> />
        <table id="write-tbl">
        <colgroup>
        	<col style="width:15%"/>
        	<col style="width:70%"/>
        </colgroup>
        
        <tr>
            <th>제 목</th>
            <td><input type="text" name="title" size="50" value="<%=n.getnTitle() %>" required></td>
        </tr>
        <tr>
            <th>작성자</th>
            <td><input type="hidden" name="writer" readonly required><%=n.getnWriter() %> </td>
        </tr>
        <tr id="fileup">
            <th>첨부파일</th>
            <td>
            <form action="<%=request.getContextPath() %>/admin/noticeUpdateEnd" id="frm" method="post" enctype="multipart/form-data">
            <input type="file" name="upfile" multiple accept=".jpg,.pdf,.txt,.jpeg,.png">
            <%if(n.getnOriginalFile()!=null) {%>
	            		<span id="fname"><%=n.getnOriginalFile() %></span>
	            		<input type="hidden" name="oriFile" value="<%=n.getnOriginalFile() %>">
	            		<input type="hidden" name="reFile" value="<%=n.getnRenamedFile() %>">
	            	<%}%>
	        </form>
            </td>
        </tr>
        <tr>
            <th>내 용</th>
            <td><textarea cols="100" rows="10" name="content" style="resize:none;"><%=n.getnContent() %></textarea></td>
        </tr>
        <tr>
            <th colspan="2" id="subm">
               	<button type="button" id="btn" class="btn_Wihte">수정완료</button>
            </th>
        </tr>
    </table>

		</div>
	</div>
</section>
<script>

	$(function(){
	//ajax 파일업로드 구현하기
	$("#btn").click(function(){
		var form=$("#frm").serialize();
		//데이터보낼때... FormData객체를 이용하여 데이터 전송가능
		const fd=new FormData();
		//원하는 내용을 추가할 수 있음
		//append함수를 이용해서 데이터를 추가 키=value형식
		//fd.append("bs",$("[name=ajaxFileTest]")[0].files[0]);
		//다중파일 업로드
		$.each($("[name=upfile]")[0].files,function(i,item){
			fd.append("file"+i,item);
		});
		fd.append("no",$("[name=no]").val());
		fd.append("title",$("[name=title]").val());
		fd.append("writer",$("[name=writer]").val());
		fd.append("content",$("[name=content]").val());
		fd.append("upfile",$("[name=upfile]").val());
		<%if(n.getnOriginalFile()!=null) {%>
			fd.append("oriFile",$("[name=oriFile]").val());
			fd.append("reFile",$("[name=reFile]").val());
		<% } %>
		//<input type="file" nam="bs">
		$.ajax({
			url:contextPath+'/admin/noticeUpdateEnd',
			data:fd,
			type:"post",
			processData:false,
			contentType:false,
			success:function(data){
				alert("공지사항을 수정하였습니다.");
			 	location.replace(contextPath+"/admin/noticeList");
			},
			error:function(r,e,m){
				alert("공지사항 수정을 실패하였습니다.");
			}
		})
	})
	})
	$(function(){
	    		$("input[name='upfile']").change(function(){
	    			if($(this).val()==""){
	    				$("#fname").show();
	    			}else{
	    				$("#fname").hide();
	    			}
	    		});
	    	});

</script>




<%@ include file="/views/admin/common/footer.jsp"%>