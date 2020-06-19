<%@page import="com.rank.beans.Account"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Customer Status</title>
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
		<c:choose>
			<c:when test="${actionType =='show'}">

				<div class="container my-4  p-t-30 p-b-30 "
					style="background-color: white;">
					<div class=" p-l-55 p-r-55 p-t-60 p-b-5 ">
						<span class="login100-form-title"
							style="font-size: 30px; color: crimson;">Customer Status</span><br />
					</div>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Customer ID</th>
								<th>Social Security Number</th>
								<th>Name</th>
								<th>Age</th>
								<th>Status</th>
								<th>Message</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${customers}" var="customer">
								<tr>
									<td>${customer.getId()}</td>
									<td>${customer.getSsn()}</td>
									<td>${customer.getName()}</td>
									<td>${customer.getAge()}</td>
									<td>${customer.getStatus()}</td>
									<td>${customer.getMessage()}</td>
									<td>
										<form action="ExecutiveController" method="post">
											<input type="hidden" name="action" value="customerStatus">
											<input type="hidden" name="currentPage"
												value="${currentPage}"> <input type="hidden"
												name="id" value="${customer.getId()}">
											<div class="btn-group">
												<input type="submit" class="btn btn-primary active"
													value="View Details" />
											</div>
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>

					</table>
					<nav aria-label="Navigation for Customers"
						class="d-flex justify-content-center">
						<ul class="pagination">
							<c:if test="${currentPage != 1}">
								<li class="page-item"><a class="page-link"
									href="ExecutiveController?action=customerStatus&currentPage=${currentPage-1}">Previous</a>
								</li>
							</c:if>

							<c:forEach begin="1" end="${pages}" var="i">
								<c:choose>
									<c:when test="${currentPage eq i}">
										<li class="page-item active"><a class="page-link">
												${i} <span class="sr-only">(current)</span>
										</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="ExecutiveController?action=customerStatus&currentPage=${i}">${i}</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:if test="${currentPage lt pages}">
								<li class="page-item"><a class="page-link"
									href="ExecutiveController?action=customerStatus&currentPage=${currentPage+1}">Next</a>
								</li>
							</c:if>
						</ul>
					</nav>

					<center>
						<div class="btn-group">
							<button class="btn btn-primary active" id="reset">Back</button>
						</div>
					</center>
				</div>

			</c:when>
			<c:otherwise>
				<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<span class="login100-form-title"
				style="font-size: 20px; color: crimson;">Viewing Customer ID: ${customer.getId()}</span><br />
					<form autocomplete="off">
						<div class="form-group row">
							<div class="col-sm-6">
								<span class="label-input100">Customer ID</span> <input
									class="input100 form-control" type="text"
									placeholder="Enter the address..." value="${customer.getId()}"
									readonly />
							</div>
							<div class="col-sm-6">
								<span class="label-input100">Social Security Number</span> <input
									class="input100 form-control" type="text"
									placeholder="Enter the address..." value="${customer.getSsn()}"
									readonly />
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-6">
								<span class="label-input100">Name</span> <input
									class="input100 form-control" type="text"
									placeholder="Enter the address..."
									value="${customer.getName()}" readonly />
							</div>
							<div class="col-sm-3">
								<span class="label-input100">Age</span> <input
									class="input100 form-control" type="text"
									placeholder="Enter the address..." value="${customer.getAge()}"
									readonly />
							</div>
							<div class="col-sm-3">
								<span class="label-input100">Status</span> <input
									class="input100 form-control" type="text"
									placeholder="Enter the address..."
									value="${customer.getStatus()}" readonly />
							</div>
						</div>
						<div class="form-group row">

							<div class="col-sm-12">
								<span class="label-input100">Message</span> <input
									class="input100 form-control" type="text"
									placeholder="Enter the address..."
									value="${customer.getMessage()}" readonly />
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-6">
								<span class="label-input100">Created Date Time</span> <input
									class="input100 form-control" type="text"
									placeholder="Enter the address..."
									value="${customer.getCreatedDateTime()}" readonly />
							</div>
							<div class="col-sm-6">
								<span class="label-input100">Updated Date Time</span> <input
									class="input100 form-control" type="text"
									placeholder="Enter the address..."
									value="${customer.getUpdatedDateTime()}" readonly />
							</div>
						</div>

						<center>
							<form action="ExecutiveController" method="get">
											<input type="hidden" name="action" value="customerStatus">
											<input type="hidden" name="currentPage"
												value="${currentPage}"> 
											<div class="btn-group">
												<input type="submit" class="btn btn-primary active"
													value="Back" />
											</div>
										</form>
						</center>
					</form>
				</div>
			</c:otherwise>
		</c:choose>
	</div>

	<%@ include file="../footer.jsp"%>
	<script type="text/javascript" src="CSS and JS/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="CSS and JS/js/validation.js"></script>
	<script type="text/javascript" src="CSS and JS/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="CSS and JS/js/tether.min.js"></script>
</body>
</html>