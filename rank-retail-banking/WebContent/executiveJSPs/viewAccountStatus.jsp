<%@page import="com.rank.beans.Account"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Account Status</title>
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
	$(document)
			.ready(
					function() {

						$("#reset")
								.on(
										"click",
										function() {
											window.location = "/rank-retail-banking/ExecutiveController?action=Dashboard";
										});
					});
</script>
</head>
<body>
	<%@ include file="../executiveHeader.jsp"%>
	<div class="container-login100"
		style="background-image: url('CSS and JS/images/other.jpg'); background-repeat: repeat; background-size: cover;">
		<div class="container my-4  p-t-30 p-b-30 "
			style="background-color: white;">
			<div class=" p-l-55 p-r-55 p-t-60 p-b-5 ">
				<span class="login100-form-title"
					style="font-size: 30px; color: crimson;">Account Status</span><br />
			</div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Customer ID</th>
						<th>Account Number</th>
						<th>Type</th>
						<th>Status</th>
						<th>Message</th>
						<th>Balance</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${accounts}" var="account">
						<tr>
							<td>${account.getCustomerId()}</td>
							<td>${account.getNumber()}</td>
							<td>${account.getType()}</td>
							<td>${account.getStatus()}</td>
							<td>${account.getMessage()}</td>
							<td>${account.getBalance()}</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
			<nav aria-label="Navigation for Accounts"
				class="d-flex justify-content-center">
				<ul class="pagination">
					<c:if test="${currentPage != 1}">
						<li class="page-item"><a class="page-link"
							href="ExecutiveController?action=accountStatus&currentPage=${currentPage-1}">Previous</a>
						</li>
					</c:if>

					<c:forEach begin="1" end="${pages}" var="i">
						<c:choose>
							<c:when test="${currentPage eq i}">
								<li class="page-item active"><a class="page-link"> ${i}
										<span class="sr-only">(current)</span>
								</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="ExecutiveController?action=accountStatus&currentPage=${i}">${i}</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test="${currentPage lt pages}">
						<li class="page-item"><a class="page-link"
							href="ExecutiveController?action=accountStatus&currentPage=${currentPage+1}">Next</a>
						</li>
					</c:if>
				</ul>
			</nav>
			<div class="col-md-12 text-center">
				<button class="btn btn-primary active" id="reset">Back</button>
			</div>
		</div>

	</div>

	<%@ include file="../footer.jsp"%>
	<script type="text/javascript" src="CSS and JS/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="CSS and JS/js/validation.js"></script>
	<script type="text/javascript" src="CSS and JS/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="CSS and JS/js/tether.min.js"></script>
</body>
</html>