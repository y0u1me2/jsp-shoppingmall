<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/admin/common/header.jsp" %>
    
    
    <style>
	
	*{    
        margin: 0; 
    }
    .
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
   
        /*리스트 스타일*/

        .lnb_list>li{
            list-style: none;
        }

        .lnb_list a {
            text-decoration: none;
            padding-top: 3px;
            padding-left: 13px;
            line-height: 25px;
            font-size: 16px;
            color: #000;
            background: transparent url(https://s3-ap-northeast-2.amazonaws.com/redprintingweb.common/2017/img/icon/menu_arrow.svg) no-repeat left 6px;
        }

     /* 밑에 라인 */
    hr#gline{
        border: 1px solid rgb(177, 174, 174);
        position: relative;
        top: 20px;
        width: 80%;
    }

    .goodsback{
        width: 100%;

    }

     /* box 스타일 */
     .box{
        border-top: 1px solid #adadad;
        border-bottom:  1px solid #adadad;
        border-collapse: collapse;
        width: 80%;
    }
    
    /* 테이블 위치 */
    .text{
        position: relative;
        top: 30px;
    
    }

    /* 테이블 선 색상 */
    .box>tr,td,th{
        border: 1px solid #e2e0e0;
    }
    
    table.box th{
    	text-align:center;
    	width:140px;
    }
    
    /* 테이블 크기 */
    .box{
        width: 80%;
        height: 200px;
    }

      /* 내용박스 스타일 */
      #content{
        width:100%; 
        height:300px;
        border: none;
    }


    /* 전체 1:1상담 목록 텍스트 */
    #one{
        font-weight: bolder;
        font-size: 25px;
        position: relative;
        top: 10px;
    }

    /* 버튼들 위치 */
    .btns{
        position: relative;
        left: 350px;
        top: 480px;
    }

    /* 등록 버튼 */
    #btn1{
         height: 40px;
         width: 70px;
         background: #313030;
         border-radius: 3px;
         margin-left: auto;
         margin-right: auto;
         border: 0;
         font-size: 15px;
         color: rgb(233, 233, 229);
         position: relative;
         left: 2px;
    }
    #btn1:hover{
         background: black;
         outline: none;
     }
     /* 취소 버튼 */
     #btn2{
        height: 40px;
        width: 70px;
        border: solid 1px rgb(190, 190, 196);
        background: white;
        border-radius: 3px;
        font-size: 15px;
        
        color: rgb(134, 134, 133);
        margin-right: 5px;
    }
    #btn2:hover{
        background:rgb(251, 251, 249);
        outline: none;
    } 
      
    </style>

<!-- ============================================================== -->

    <section style="height:850px;">
        <div class="back">
   
        <div class="goodsback">
            <br><br>
            <h1 id="one">1:1문의 답변하기</h1>
            <hr id="gline">
            <br><br>
            
             <form action="<%=request.getContextPath() %>/InquiryAnswer" method="post"
             enctype="multipart/form-data" >
             
             	<input type="hidden" name="ino" value="<%=request.getParameter("ino")%>">
             	
                <table class="box">
                    <tr>
                        <th style="height:40px">제목</th>
                        <td>
                         <input type="text" name="title" style="width: 300px; border:none;"
                         	placeholder="제목을 입력해 주세요.">
                        </td>                   
                    </tr>
                    
                    <tr>
                        <th>내용</th>
                        <td><textarea id="content" name="content" placeholder="답변하실 내용을 입력해 주세요."></textarea></td>
                    </tr>
                        <tr>   
                            <th>
                               	 이미지 첨부        
                                <lable id="flabel">
                                	파일
                                <td><input type="file"  name="upfile"/></td>                          
                                </lable>
                            </th>  
                         </tr>
                         
                     <div class="btns">
                  <button id="btn1" type="submit">등록</button>
                  <button id=btn2>취소</button>
                </div>
                </table>

               
            </form>
            </div>
        </div>

    </section>

<%@ include file="/views/admin/common/footer.jsp" %>
  