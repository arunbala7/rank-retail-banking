<%@page import="com.rank.beans.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="CSS and JS/css/bootstrap.min.css">
<link rel="stylesheet" href="CSS and JS/css/font-awesome.min.css">
<script src="CSS and JS/js/jquery-3.5.1.min.js"></script>
<script src="CSS and JS/js/popper.min.js"></script>
<script src="CSS and JS/js/bootstrap.min.js"></script>
<style type="text/css">
.btn-group {
	padding: 4px;
}
</style>
</head>
<body>
	<%
		//SESSION CHECK (LOGGED IN OR NOT)  	
	User user = (User) session.getAttribute("currentUser");
	if (user == null)
		response.sendRedirect("/rank-retail-banking/index.jsp");

	//Back Button Cache Security
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");//HTTP 1.1
	response.setHeader("Pragma", "no-cache");//HTTP 1.0
	response.setHeader("Expires", "0");//Proxies
	%>
	<div class="bs-example">
		<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
			<a href="#" class="navbar-brand" style="font-weight: bold;">R.A.N.K</a>
			<button type="button" class="navbar-toggler" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarCollapse">
				<div class="navbar-nav btn-group">
					<a href="ExecutiveController?action=Dashboard"
						class="nav-item nav-link active">Home</a>

				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-primary dropdown-toggle"
						data-toggle="dropdown"
						style="background-color: #222831; border: 2px solid #222831;">Transaction</button>
					<div class="dropdown-menu" style="background-color: #dddddd">
						<a href="CashierController?action=depositMoney"
							class="dropdown-item btn btn-outline-light">Deposit Money</a>
						<div class="dropdown-divider"></div>
						<a href="CashierController?action=withdrawMoney"
							class="dropdown-item btn btn-outline-light">Withdraw Money</a>
						<div class="dropdown-divider"></div>
						<a href="CashierController?action=transferMoney"
							class="dropdown-item btn btn-outline-light">Transfer Money</a>
						<div class="dropdown-divider"></div>
						<a href="CashierController?action=printStatement"
							class="dropdown-item btn btn-outline-light">Print Account
							Statement</a>
					</div>
				</div>

				<div class="btn-group">
					<button type="button" class="btn btn-primary dropdown-toggle"
						data-toggle="dropdown"
						style="background-color: #222831; border: 2px solid #222831;">Search</button>
					<div class="dropdown-menu" style="background-color: #dddddd;">
						<a href="CashierController?action=Accounts"
							class="dropdown-item btn btn-outline-light">View Account
							Details</a>
					</div>
				</div>
				<div class="navbar-nav btn-group">
					<a href="CashierController?action=about"
						class="nav-item nav-link active">About</a>

				</div>

				<form class="form-inline ml-auto" action="UserController"
					method="get">
					<span class="label-input100"
						style="font-weight: bold; font-size: 20px; color: white; text-transform: capitalize;"> ${currentUser.getUserName()} </span>
					&ensp;&ensp; <input type="hidden" name="action" value="logout">
					<button type="submit" class="btn btn-outline-light">Logout</button>
				</form>
			</div>
		</nav>
	</div>
</body>
</html>