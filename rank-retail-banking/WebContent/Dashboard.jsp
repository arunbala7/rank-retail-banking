<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
	<%
		//SESSION CHECK (LOGGED IN OR NOT)  	
	String workGroup = (String) session.getAttribute("workGroup");
	if (workGroup == null)
		response.sendRedirect("index.jsp"); 
	%>
	<c:choose>
		<c:when test="${workGroup =='cashier'}">
			<%@ include file="cashierHeader.jsp"%>
		</c:when>
		<c:otherwise>
			<%@ include file="executiveHeader.jsp"%>
		</c:otherwise>
	</c:choose>

</body>
</html>