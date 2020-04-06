<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 


    <!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title>굿굿즈 관리자페이지</title>

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<body class="hold-transition sidebar-mini">
<div class="wrapper">

  
  
  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4";">
    <!-- Brand Logo -->
    <a href="#" class="brand-link">
      <img src="<%=request.getContextPath() %>/resources/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">관리자페이지</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="<%=request.getContextPath() %>/resources/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">admin 님 접속중</a>
          <button onclick="location.replace('<%=request.getContextPath()%>/admin/logout')">로그아웃</button>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column nav-child-indent" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item">
            <a href="<%=request.getContextPath()%>/admin/home" class="nav-link">
              <i class="nav-icon fas fa-home"></i>
              <p>
         		HOME
              </p>
            </a>
          </li>
          
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-user"></i>
              <p>
         		회원관리
                <i class="right fas fa-angle-right"></i>
              </p>
            </a>
              <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<%=request.getContextPath()%>/admin/memberStatus" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>회원방문/가입 현황</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<%=request.getContextPath()%>/admin/memberList" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>전체회원 관리/조회</p>
                </a>
              </li>
            </ul>
          </li>
          
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-gift"></i>
              <p>
				상품관리
                <i class="right fas fa-angle-right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<%=request.getContextPath() %>/admin/ProductListView" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>전체상품목록</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<%=request.getContextPath() %>/admin/productEnroll" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>상품등록</p>
                </a>
              </li>
            
            </ul>
          </li>
          
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-shopping-cart"></i>
              <p>
				주문관리
                <i class="right fas fa-angle-right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<%=request.getContextPath()%>/admin/orderList" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>주문 관리/조회</p>
                </a>
              </li>
            </ul>
          </li>
          
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-clipboard"></i>
              <p>
         		1:1문의관리
                <i class="right fas fa-angle-right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<%=request.getContextPath()%>/admin/InquiryList" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>전체 1:1문의 목록</p>
                </a>
              </li> 
            </ul>
         
          </li>
          
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-clipboard"></i>
              <p>
         		공지사항 관리
                <i class="right fas fa-angle-right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<%=request.getContextPath()%>/admin/noticeList" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>공지사항 관리/조회</p>
                </a>
              </li> 
            </ul>
         
          </li>
         
        
          
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>