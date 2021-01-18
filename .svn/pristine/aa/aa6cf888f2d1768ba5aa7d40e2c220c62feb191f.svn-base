<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <!-- Core plugin JavaScript-->
<script src="/admin2form/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/admin2form/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="/admin2form/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="/admin2form/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="/admin2form/js/demo/datatables-demo.js"></script>
<style type="text/css">
	a{
		color: #858796;
	}
	#dataTable_filter{
		float: right;
	}
	#dataTable_filter{
		
	}
	label {
		width: 200px;
	}
	.custom-select-sm{
		display: none;
	}
	.paging_simple_numbers{
		display: none;
	}
	
	#mail{
		background-color : #295ff9;
		color : white;
	}
	
	#mail:hover{
		background-color : #96a1f1;
	}
</style>
<script>
var standard = "";
$(document).ready(function(){
	
	var a = "";
	$('.addr').on('click', function(){
		var a = $(this).attr('value');
		$.ajax({
			url : "/empSearch",
			data : {"standard" : a},
			method : "get",
			success : function(data) {
				var html = data;
				$('.app').html(html);
			}
		});
		
	})
	
	$('#excel').on('click', function(){
		document.location="/addressExcelDownload";
	})
	
	$('#thbox').on('click', function() {
		checkAll();
	})
	
	function checkAll() {
		if ($('#thbox').is(':checked')) {
			$("input[name=tdbox]").prop("checked", true);
		} else {
			$("input[name=tdbox]").prop("checked", false);
		}
	}
	
	function checkValue() {
		var checked = "";
		$("input[name='tdbox']:checked").each(function() {
			checked = checked + $(this).val() + ",";
		});
		checked = checked.substring(0, checked.lastIndexOf(",")); //맨끝 콤마 지우기
		return checked;
	}
	
	$('#mail').on('click',function(){
		var checked = checkValue();
		if(checked ==''){
			alert("메일 전송할 사람을 선택해주세요")
		} else {
			$('#mailInput').val(checked)
			$('#mailForm').submit();
		}
	})
	
});	
</script>
</head>
<body>

<div class="sbp-preview-code">
    <!-- Code sample-->
    <ul class="nav nav-tabs" id="avatarSizesTabs" role="tablist">
        <li class="nav-item addr" value="all">
            <a class="nav-link mr-1 active" id="add1" data-toggle="tab" href="#all" role="tab" aria-controls="avatarSizesHtml" aria-selected="true">
				<i class="fas fa-address-book" style="font-size: 30px; color: orange;"></i>
            </a>
        </li>
        <li class="nav-item addr" value="가">
            <a class="nav-link" id="add2" data-toggle="tab" href="#ga" role="tab" aria-controls="avatarSizesPug" aria-selected="false">
            	가
            </a>
        </li>
        <li class="nav-item addr" value="나">
            <a class="nav-link" id="add3" data-toggle="tab" href="#na" role="tab" aria-controls="avatarSizesPug" aria-selected="false">
            	나
            </a>
        </li>
        <li class="nav-item addr" value="다">
            <a class="nav-link" id="add4" data-toggle="tab" href="#da" role="tab" aria-controls="avatarSizesPug" aria-selected="false">
            	다
            </a>
        </li>
        <li class="nav-item addr" value="라">
            <a class="nav-link" id="add5" data-toggle="tab" href="#ra" role="tab" aria-controls="avatarSizesPug" aria-selected="false">
            	라
            </a>
        </li>
        <li class="nav-item addr" value="마">
            <a class="nav-link" id="add6" data-toggle="tab" href="#ma" role="tab" aria-controls="avatarSizesPug" aria-selected="false">
            	마
            </a>
        </li>
        <li class="nav-item addr" value="바">
            <a class="nav-link" id="add7" data-toggle="tab" href="#ba" role="tab" aria-controls="avatarSizesPug" aria-selected="false">
            	바
            </a>
        </li>
        <li class="nav-item addr" value="사">
            <a class="nav-link" id="add8" data-toggle="tab" href="#sa" role="tab" aria-controls="avatarSizesPug" aria-selected="false">
            	사
            </a>
        </li>
        <li class="nav-item addr" value="아">
            <a class="nav-link" id="add9" data-toggle="tab" href="#aa" role="tab" aria-controls="avatarSizesPug" aria-selected="false">
            	아
            </a>
        </li>
        <li class="nav-item addr" value="자">
            <a class="nav-link" id="add10" data-toggle="tab" href="#ja" role="tab" aria-controls="avatarSizesPug" aria-selected="false">
            	자
            </a>
        </li>
        <li class="nav-item addr" value="차">
            <a class="nav-link" id="add11" data-toggle="tab" href="#ca" role="tab" aria-controls="avatarSizesPug" aria-selected="false">
            	차
            </a>
        </li>
        <li class="nav-item addr" value="카">
            <a class="nav-link" id="add12" data-toggle="tab" href="#ka" role="tab" aria-controls="avatarSizesPug" aria-selected="false">
            	카
            </a>
        </li>
        <li class="nav-item addr" value="타">
            <a class="nav-link" id="add13" data-toggle="tab" href="#ta" role="tab" aria-controls="avatarSizesPug" aria-selected="false">
            	타
            </a> 
        </li>
        <li class="nav-item addr" value="파">
            <a class="nav-link" id="add14" data-toggle="tab" href="#pa" role="tab" aria-controls="avatarSizesPug" aria-selected="false">
            	파
            </a>
        </li>
        <li class="nav-item addr" value="하">
            <a class="nav-link" id="add15" data-toggle="tab" href="#ha" role="tab" aria-controls="avatarSizesPug" aria-selected="false">
            	하
            </a>
        </li>
    </ul>
    <!-- Tab panes-->
    <div class="tab-content">
        <div class="tab-pane active" id="all" role="tabpanel" aria-labelledby="avatarSizesHtmlTab">
			<div class="table-responsive" style="overflow: hidden;">
			
			    <form id="mailForm" action="/mail/addrwrite" method="post">
			    <input type="hidden" value="" id="mailInput" name="mailInput">
			    <button type="button" id="mail" class="btn btn" style="float: right; margin : 10px;">메일 전송</button>
			    </form>
				<table class="table table-bordered" width="100%"
					cellspacing="0" style="text-align: center;">
					<thead>
						<tr>
							<th>
								<input type="checkbox" id="thbox">
							</th>
							<th>사원명</th>
							<th>이메일</th>
							<th>전화번호</th>
							<th>부서</th>
							<th>직급</th>
							<th>주소</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${empList }" var="emp">
							<tr>
								<td><input type="checkbox" name="tdbox" value=${emp.empId }></td>
								<td>${emp.empNm }</td>
								<td>${emp.empId }@sendbox.com</td>
								<td>${emp.empHp }</td>
								<td>${emp.deptName }</td>
								<td>${emp.jobtitleNm }</td>
								
								<td>${emp.addr1 }${emp.addr2 }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
 				<!-- 페이징 처리  -->
				<div class="row">
					<div class="col-sm-12 col-md-5">
						<div class="dataTables_info" id="dataTable_info" role="status"
							aria-live="polite"></div>
					</div>
					<div class="col-sm-12 col-md-7">
						<div class="dataTables_paginate" id="dataTable_paginate">
							<button type="button" id="excel" class="btn btn btn-success" style="float: right;">전직원 Excel Download</button>
							<ul class="pagination">
								<c:choose>
									<c:when test="${pagination.currentPageNo == 1 }">
										<li class="paginate_button page-item previous disabled"
											id="dataTable_previous"><a href="#"
											aria-controls="dataTable" class="page-link"> <i
												class="fas fa-angle-double-left"></i>
										</a>
										</li>
										<li class="paginate_button page-item previous disabled"
											id="dataTable_previous"><a href="#"
											aria-controls="dataTable" class="page-link"> <i
												class="fas fa-angle-left"></i>
										</a>
										</li>

									</c:when>
									<c:otherwise>
										<li class="paginate_button page-item previous"
											id="dataTable_previous"><a href="/address"
											aria-controls="dataTable" class="page-link"> <i
												class="fas fa-angle-double-left"></i>
										</a></li>
										<li class="paginate_button page-item previous"
											id="dataTable_previous"><a
											href="/address?pageIndex=${pagination.currentPageNo-1}"
											aria-controls="dataTable" class="page-link"> <i
												class="fas fa-angle-left"></i>
										</a></li>
									</c:otherwise>


								</c:choose>
								<c:forEach begin="${pagination.getFirstPageNoOnPageList() }"
									end="${pagination.getLastPageNoOnPageList() }" step="1" var="i">
									<c:choose>
										<c:when test="${pagination.currentPageNo == i }">
											<li class="paginate_button page-item active"><a
												aria-controls="dataTable" class="page-link">${i }</a></li>
										</c:when>
										<c:otherwise>
											<li class="paginate_button page-item"><a
												href="/address?pageIndex=${i}" aria-controls="dataTable"
												class="page-link">${i }</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when
										test="${pagination.currentPageNo == pagination.getTotalPageCount()}">
										<li class="paginate_button page-item next disabled"
											id="dataTable_next"><a href="#"
											aria-controls="dataTable" " class="page-link"> <i
												class="fas fa-angle-right"></i>
										</a></li>
										<li class="paginate_button page-item next disabled"
											id="dataTable_next"><a href="#"
											aria-controls="dataTable" class="page-link"> <i
												class="fas fa-angle-double-right"></i>
										</a></li>
									</c:when>
									<c:otherwise>
										<li class="paginate_button page-item next" id="dataTable_next">
											<a href="/address?pageIndex=${pagination.currentPageNo+1}"
											aria-controls="dataTable" data-dt-idx="2" tabindex="0"
											class="page-link"> <i class="fas fa-angle-right"></i>
										</a>
										</li>
										<li class="paginate_button page-item next" id="dataTable_next">
											<a href="/address?pageIndex=${pagination.getTotalPageCount()}"
											aria-controls="dataTable" data-dt-idx="2" tabindex="0"
											class="page-link"> <i class="fas fa-angle-double-right"></i>
										</a>
										</li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</div>
				</div>

			</div>

		<div class="tab-pane" id="ga" role="tabpanel" aria-labelledby="avatarSizesPugTab">
			<div class="app"></div>
        </div>
		<div class="tab-pane" id="na" role="tabpanel" aria-labelledby="avatarSizesPugTab">
			<div class="app"></div>
        </div>
		<div class="tab-pane" id="da" role="tabpanel" aria-labelledby="avatarSizesPugTab">
			<div class="app"></div>
        </div>
		<div class="tab-pane" id="ra" role="tabpanel" aria-labelledby="avatarSizesPugTab">
			<div class="app"></div>
        </div>
		<div class="tab-pane" id="ma" role="tabpanel" aria-labelledby="avatarSizesPugTab">
			<div class="app"></div>
        </div>
		<div class="tab-pane" id="ba" role="tabpanel" aria-labelledby="avatarSizesPugTab">
			<div class="app"></div>
        </div>
		<div class="tab-pane" id="sa" role="tabpanel" aria-labelledby="avatarSizesPugTab">
			<div class="app"></div>
        </div>
		<div class="tab-pane" id="aa" role="tabpanel" aria-labelledby="avatarSizesPugTab">
			<div class="app"></div>
        </div>
		<div class="tab-pane" id="ja" role="tabpanel" aria-labelledby="avatarSizesPugTab">
			<div class="app"></div>
        </div>
		<div class="tab-pane" id="ca" role="tabpanel" aria-labelledby="avatarSizesPugTab">
			<div class="app"></div>
        </div>
		<div class="tab-pane" id="ka" role="tabpanel" aria-labelledby="avatarSizesPugTab">
			<div class="app"></div>
        </div>
		<div class="tab-pane" id="ta" role="tabpanel" aria-labelledby="avatarSizesPugTab">
			<div class="app"></div>
        </div>
		<div class="tab-pane" id="pa" role="tabpanel" aria-labelledby="avatarSizesPugTab">
			<div class="app"></div>
        </div>
		<div class="tab-pane" id="ha" role="tabpanel" aria-labelledby="avatarSizesPugTab">
			<div class="app"></div>
        </div>
	</div>
</div>



</body>
</html>