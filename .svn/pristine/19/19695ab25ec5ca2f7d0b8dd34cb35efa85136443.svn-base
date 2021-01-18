<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
   $(function(){
      $('#logo').on('click', function(){
         window.location.href = "http://localhost/main";
      })
   })
</script>
<style type="text/css">
@font-face {
    font-family: 'InfinitySans-RegularA1';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body{
  font-family: 'InfinitySans-RegularA1';
  background-color: #1e2c54;
}
</style>
</head>
<body>
   <!-- Sidebar -->
        <ul class=" navbar-nav sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
             <a href="#"><img id="logo" src="/images/mainlogo.png" style="width: 100%; margin-top: 0px; height: 70px; " ></a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
           <li class="nav-item active">
               <img id="men" src="${pageContext.request.contextPath}/profileImgView?empId=${EMP.empId} " style="width:70px; height: 80px; border-radius: 60%; overflow: hidden; margin:10px;" >
               <div style=" float: right; text-align:center; margin-top: 25px; margin-right:5px;">
                    <span style="color: white; ">${EMP.empNm}
                    <c:if test="${EMP.jobtitleId == 0}">사원</c:if>
                    <c:if test="${EMP.jobtitleId == 1}">대리</c:if>
                    <c:if test="${EMP.jobtitleId == 2}">팀장</c:if>
                    <c:if test="${EMP.jobtitleId == 3}">부장</c:if>
                    <c:if test="${EMP.jobtitleId == 4}">CEO</c:if>
                   </span><br>
                    <span style="color: white;font-size: 0.7em;" >${EMP.empId}@sendbox.com</span>
               </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Mail
            </div>
             
            <li class="nav-item">
                <a class="nav-link" href="/mail/write">
                    <i class="fas fa-pen-alt" style="color: white;"></i>
                    <span>메일작성</span></a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="/mail/list">
                    <i class="fas fa-envelope-open" style="color: white;"></i>
                    <span>받은메일함</span></a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="/mail/notlist">
                	<i class="far fa-envelope" style="color: white;"></i>
                    <span>안읽은메일함</span></a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="/mail/sendList">
                    <i class="fas fa-paper-plane" style="color: white;"></i>
                    <span>보낸메일함</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/mail/bin">
                    <i class="fas fa-trash-alt" style="color: white;"></i>
                    <span>휴지통</span></a>
            </li>

            


         <li class="nav-item" style="margin-top: 300px;">
                <a class="nav-link" href="#">
                   <i class="fas fa-fw fa-question-circle" style="font-size: 30px; color: white;"></i>
               </a>
         </li>
            
            
        </ul>
        <!-- End of Sidebar -->
        </body>
        </html>
