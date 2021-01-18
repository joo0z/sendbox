<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script>
	function reportView(id){
		var reportId = document.querySelector('#reportId');
		reportId.value = id;
		document.querySelector('#reportViewForm').submit();
	}
</script>
	<form method="post" action="/report/reportView" id="reportViewForm">
		<input type="hidden" id="reportId" name="reportId">
	</form>
	<table class="table" id="dataTable" width="100%"
					cellspacing="0">
					<colgroup>
<%--  						<col width="10%"> --%>
						<col width="?">
						<c:if test="${url == 'approvListView'}">
							<col width="18%">						
						</c:if>
						<col width="15%">
  						<col width="18%">
					</colgroup>
					<%--  <thead>
						<tr style="font-size: 15px; background: #f8f9fc;" align="center">
							<c:if test="${url == 'reporting'}">
								<th class="reportClass">NO</th>
								<th class="reportClass">제목</th>					
								<th class="reportClass">결재자</th>
								<th>기안일자</th>							
							</c:if>
							
							<c:if test="${url == 'approvListView'}">
								<th class="reportClass">NO</th>
								<th class="reportClass">제목</th>					
								<th class="reportClass">부서</th>
								<th class="reportClass">기안자</th>
								<th>기안일자</th>							
							</c:if>
						</tr>
					</thead>  --%>
					<tbody>
						<c:choose>
							<c:when test="${reportList == null || reportList.size() == 0}">
	                          <tr align="center">
	                             <td colspan="${url == 'reporting' ? 4 : 5}">서류가 없습니다.</td>
	                          </tr>							
							</c:when>
							<c:otherwise>
								<c:forEach items="${reportList}" var="report" varStatus="status" >
									<tr align="center" class="reportTr">
										<%-- <td>${status.index +1}</td> --%>
										<c:set value="${report.title }" var="title"/>
										<td align="left" style="cursor: pointer;" onclick="javascript:reportView('${report.reportId}')">
<%-- 											${title.length() > 15 ? title.substring(0,15)+'...' : title } --%>
<%-- 											${title } --%>
											<c:choose>
												<c:when test="${title.length() > 10}">
													${title.substring(0,10)}...
												</c:when>
												<c:otherwise>
													${title }
												</c:otherwise>
											</c:choose>
										</td>
										<c:if test="${url == 'reporting'}">
											<td>${report.approverNm }</td>
										</c:if>
										<c:if test="${url == 'approvListView'}">
											<td>${report.deptName }</td>
											<td>${report.empNm }</td>
										</c:if>
										<td>
											<fmt:parseDate value="${report.reportDt }" pattern="yyyy-MM-dd" var="reportDt"/>
											<fmt:formatDate value="${reportDt }" pattern="MM-dd"/>
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
