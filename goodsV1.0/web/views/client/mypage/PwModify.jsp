<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/client/common/header.jsp" %>

<style>
/* =================================================================================================== */

        /*CONTACT US 고객센터 번호 및 이메일 휴일안내 */
        .goto {
            position: relative;
            bottom: 382px;
            left: 600px;
        }

       
        /*고객센터Home , 공지사항 등 */
        .aside {
            /* border: 1px solid hotpink; */
            width: 20%;
            height: 100%;
            line-height: 130%;
        }

        .aside2 {
            /* border: 1px solid hotpink; */
            width: 8%;
            height: 100%;
            line-height: 130%;
        }

       /*고객센터 목록 앞에보이는 것*/
       .lnb_list a {
    padding-top: 3px;
    padding-left: 13px;
    line-height: 25px;
    font-size: 16px;
    color: #000;
    background: transparent url(https://s3-ap-northeast-2.amazonaws.com/redprintingweb.common/2017/img/icon/menu_arrow.svg) no-repeat left 6px;
}
        .senter>li>a{
            text-decoration: none;
            color: black;
        }
        ul{
            list-style:none;
        }
        .faqmiddle {
            width: 80%;
        }
        /*tr 첫번째 아이디정보 (기본정보)*/
        .line {
            border-bottom: 1px solid rgb(216, 209, 209);
            padding: 10px 30px ;
            text-align: left;
            
             
        }

/* ======================================================================== */
    /* 섹션 스타일 */
    .back{
        width: 80%;
        position: relative;
        left: 10%;
        display: flex;
    }
    </style>
    
      <section class="back">
          <!-- HOME // CONTACT -->

          <div class="aside">
            <h5 style='line-height:400%'>&nbsp&nbsp HOME // </h5>
            <h2 style='line-height:300%'>&nbsp&nbsp마이페이지</h2>

            <ul class="lnb_list">
                <li><a href="<%=request.getContextPath()%>/orderDelivery">주문/배송 조회</a></li><br />
                <li><a href="<%=request.getContextPath()%>/listLookUp">찜 목록 조회</a></li><br />
                <li><a href=>반품/환불</a></li><br />
                <li><a href="<%=request.getContextPath()%>/MyInquiryWrite">1:1상담</a></li><br />
                <li><a href="<%=request.getContextPath()%>/myInquiryList?mNo=<%=loginMember.getM_No() %>">상담내역</a></li><br />
                <li><a href="">쿠폰관리</a></li><br />
                <li><a href="">포인트관리</a></li><br />
                <li><a href="<%=request.getContextPath()%>/profile2" style="color: rgb(23, 7, 248); font-weight: bold;">회원정보수정</a></li><br />
                <li><a href="<%=request.getContextPath()%>/mmbrswthdr2">회원탈퇴</a></li><br />
            </ul>
        </div>
        <!-- aside2 목록과붙어있는공간띄우기-->
        <div class="aside2"></div>



        <div class="faqmiddle">

            <table style="width:100%; padding-top: 65px;">
                <tr>
                    <td colspan=2 style="font-weight:bolder; font-size: 25px; border-bottom: 1px solid rgb(23, 7, 248);">
                        회원 비밀번호 수정<span style="margin-left: 6px;font-size: 14px;color: #6f6f6f;font-weight: 400;">개인회원/기업회원 공통</span></td>
                </tr>
            </table>
            <div style="padding-top: 5%;">
                <h4 style="border-bottom:1px solid black;"></h4>
            </div>
            <table style="width:100%;font-size: 14px; padding: 5px 0px 5px;">
                <colgroup>
                    <col style="width: 25%;">
                    <col style="width: 75%;">
                </colgroup>
         <!--    <tr>
                <th class="line">현재 비밀번호</th>
                <td class="line">
                    <input type="password" id="old_password" name="old_password" class="form-control" maxlength="20"
                    style="width: 200px;">
                    <span id="msg_old_password"></span>
                </td>
            </tr> -->
            <tr>
                <th class="line">새 비밀번호</th>
                <td class="line">
                    <input type="password" id="old_password" name="old_password" class="form-control" maxlength="20"
                    style="width: 200px;">
                    <span id="msg_old_password"></span>
                </td>
            </tr>
            <tr>
                <th class="line">새 비밀번호 확인</th>
                <td class="line">
                    <input type="password" id="old_password" name="old_password" class="form-control" maxlength="20"
                    style="width: 200px;">
                    <span id="msg_old_password"></span>
                </td>
            </tr>
            <tr>
                <th class="line">자동등록방지</th>
                <td class="line">
                    <input type="password" id="old_password" name="old_password" class="form-control" maxlength="20"
                    style="width: 200px;">
                    <span id="msg_old_password"></span>
                </td>
            </tr>
        </table>
        <div style="text-align: center; padding: 5px 0px 5px;">
            <button style="width: 140px;height: 50px; border-radius: 5px;background: #313030;color: rgb(233, 233, 229);">확인</button>
            <button style="width: 100px;height: 40px; border-radius: 5px;color: #313030;background: rgb(255, 254, 254);">초기화</button>
            </div>
        </div>
               




    </section>


<%@ include file="/views/client/common/footer.jsp" %>