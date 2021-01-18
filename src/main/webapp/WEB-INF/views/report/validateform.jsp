<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>

<form>
<input type="text" name="title" value="${reportVo.title }">
<form:errors path="reportVO.title"></form:errors>
</form>

<form:form commandName="reportVO">
<form:input path="title"/>
<form:errors path="title"></form:errors>
</form:form>