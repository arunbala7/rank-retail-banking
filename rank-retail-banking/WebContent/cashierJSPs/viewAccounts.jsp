<%@page import="com.rank.beans.Account"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Account Details</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<link rel="icon" type="image/png"
	href="CSS and JS/images/icons/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="CSS and JS/vendor/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="CSS and JS/fonts/font-awesome-4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="CSS and JS/fonts/iconic/css/material-design-iconic-font.min.css" />
<link rel="stylesheet" type="text/css" href="CSS and JS/css/util.css" />
<link rel="stylesheet" type="text/css" href="CSS and JS/css/main.css" />
<script type="text/javascript" src="CSS and JS/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="CSS and JS/js/sweetalert.min.js"></script>
<script type="text/javascript" src="CSS and JS/js/validation.js"></script>
<script type="text/javascript" src="CSS and JS/js/bootstrap.min.js"></script>
<script type="text/javascript" src="CSS and JS/js/tether.min.js"></script>
<script>
	$(document).ready(function() {

		$("#reset").on("click", function() {
			window.location = "/rank-retail-banking/cashierJSPs/Accounts.jsp";
		});
	});
</script>
</head>
<body
	style="background-image: url('CSS and JS/images/other.jpg'); background-repeat: no-repeat; background-size: cover;">
	<%@ include file="../cashierDashboardHeader.jsp"%>
	<div class="container my-4  p-t-30 p-b-30 "
		style="background-color: white;">
		<div class=" p-l-55 p-r-55 p-t-60 p-b-5 ">
			<span class="login100-form-title"
				style="font-size: 30px; color: crimson;">Account Details</span><br />
		</div>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Account Number</th>
					<th>Customer ID</th>
					<th>Account Type</th>
					<th>Status</th>
					<th>Balance</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${accounts}" var="account">
					<tr>
						<td>${account.getNumber()}</td>
						<td>${account.getCustomerId()}</td>
						<td>${account.getType()}</td>
						<td>${account.getStatus()}</td>
						<td>${account.getBalance()}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<center>
			<div class="btn-group">
				<button class="btn btn-primary active" id="reset">Back</button>
			</div>
		</center>
	</div>


	<%@ include file="../footer.jsp"%>
	<script type="text/javascript" src="CSS and JS/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="CSS and JS/js/validation.js"></script>
	<script type="text/javascript" src="CSS and JS/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="CSS and JS/js/tether.min.js"></script>
</body>
</html>