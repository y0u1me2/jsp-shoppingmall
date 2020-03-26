<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/admin/common/header.jsp"%>
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
    }
   #write-tbl{
   		width:80%;
   		height:400px;
   		margin-top:10px;
   }
   	#subm{
   		text-align:right;
   		padding:15px 17px 0 0;
   }
   #write-tbl>th,td{
   		padding:10px 0 10px 0;
   }
</style>
<section>
	<div class="back">
		<div class="writeback">
			<br><br>
			<h1>공지사항 글쓰기</h1>
			<hr id="gline">
			<br><br>
	<form action="<%=request.getContextPath() %>/notice/noticeWriteEnd" method="post" enctype="multipart/form-data">
        <table id="write-tbl">
        <colgroup>
        	<col style="width:15%"/>
        	<col style="width:70%"/>
        </colgroup>
        
        <tr>
            <th>제 목</th>
            <td><input type="text" name="title" size="50" required></td>
        </tr>
        <tr>
            <th>작성자</th>
            <td><input type="hidden" name="writer" required> </td>
        </tr>
        <tr id="fileup">
            <th>첨부파일</th>
            <td><input type="file" name="upfile"></td>
        </tr>
        <tr>
            <th>내 용</th>
            <td><textarea cols="100" rows="10" name="content" style="resize:none;"></textarea></td>
        </tr>
        <tr>
            <th colspan="2" id="subm">
               	<input type="submit" value="작성완료"/>
            </th>
        </tr>
    </table>
    </form>
		</div>
	</div>
</section>
<script>
</script>




<%@ include file="/views/admin/common/footer.jsp"%>