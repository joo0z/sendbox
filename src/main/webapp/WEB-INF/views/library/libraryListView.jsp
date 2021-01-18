<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script>

	$(function(){
	})
	
	
</script>
<style>
#progress_menu {
    width: 460px;
    margin: 40px auto;
    background: #f3f3f3;
    border: 1px solid #d8d8d8;
    text-align: center;
}
#progress_menu div {
    position: relative;
    display: inline-block;
}

#sp {
    display: block;
    width: 80px;
    padding: 2px 16px;
    cursor: pointer;
}
.msg {
  display: none;
  position: absolute;
  width: auto;
  padding: 8px;
  left: 0;
  -webkit-border-radius: 8px;
  -moz-border-radius: 8px;  
  border-radius: 8px;
  background: #333;
  color: #fff;
  font-size: 14px;
}

.msg:after {
  position: absolute;
  bottom: 100%;
  left: 50%;
  width: 0;
  height: 0;
  margin-left: -10px;
  border: solid transparent;
  border-color: rgba(51, 51, 51, 0);
  border-bottom-color: #333;
  border-width: 10px;
  pointer-events: none;
  content: " ";
}
@font-face {
    font-family: 'YESGothic-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_13@1.0/YESGothic-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
table{
	font-family: 'YESGothic-Regular';
	text-align : center;
}

#sp:hover + p.msg {
  display: block;
}

a{
	color: gray;
}

</style>
<script type="text/javascript">
$(document).ready(function(){
	
// 	var fileSeq = "";
	
// 	$('.tr1').mousedown(function() {
// 	   fileSeq = $(this).attr('fileSeq');
// 	   alert(fileSeq)
// 	   $('.tr1').css('background-color','white');
//        $(this).css('background-color','lightgray');
// 	 })
	 

});
</script>

<div id="progress" style="width: 100%"  id="progress_menu">
	<h6 style="margin-left: 20px;"><i class="fas fa-info-circle"></i>파일 사용량</h6>
	<div> 
		<span style="width: 100%" id="sp">
			<progress value="${dataSize }" max="${total }" style="width: 96%"></progress>
		</span>
	    <p class="msg" style="margin-left: 30%">사용량 : 
	    	<fmt:formatNumber value="${dataSize*0.001 }" pattern=".00"/>MB
	    </p>
  	</div>
</div>
<br>
<%-- ${dataSize } --%>
<%-- ${total } --%>
<%-- ${libraryId } --%>
<table class="table table-bordered" id="dataTable" cellspacing="0"
	style="width: 95%;">
	<thead>
		<tr>
			<th>파일명</th>
			<th>작성자</th>
			<th>마지막 수정날짜</th>
			<th>파일크기</th>
			<th>확장자</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${libList }" var="lib">
			<tr class="tr1" fileSeq="${lib.fileSeq }">
				<td style="text-align : left; width : 60%;"><a href="/libFileDownload?fileSeq=${lib.fileSeq }">${lib.fileRealNm }</a></td>
				<td>${lib.empId }</td>
				<td><fmt:parseDate value="${lib.fileInDt }" pattern="yyyy-MM-dd HH:mm" var="date"/> 
					<fmt:formatDate value="${date}" pattern="yyyy-MM-dd HH:mm" /></td>
				<td>${lib.fileSize }</td>
				<td>${lib.fileIconId }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>























