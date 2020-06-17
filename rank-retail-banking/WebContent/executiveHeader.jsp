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
	String workGroup = (String) session.getAttribute("workGroup");
	String __jspName = this.getClass().getSimpleName().replaceAll("_", ".");
	if (workGroup == null) {
		response.sendRedirect("/rank-retail-banking/index.jsp");
	} else if (workGroup.contentEquals("cashier") && !(__jspName.contentEquals("Dashboard.jsp"))) {
		response.sendRedirect("/rank-retail-banking/Dashboard.jsp");
	}

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
						style="background-color: #222831; border: 2px solid #222831;">Customer
						Management</button>
					<div class="dropdown-menu" style="background-color: #dddddd;">
						<a href="ExecutiveController?action=createCustomer"
							class="dropdown-item btn btn-outline-light">Create Customer</a>
						<div class="dropdown-divider"></div>
						<a href="ExecutiveController?action=updateCustomer"
							class="dropdown-item btn btn-outline-light">Update Customer</a>
						<div class="dropdown-divider"></div>
						<a href="ExecutiveController?action=deleteCustomer"
							class="dropdown-item btn btn-outline-light">Delete Customer</a>
						<div class="dropdown-divider"></div>
						<a href="ExecutiveController?action=customerStatus&currentPage=1"
							class="dropdown-item btn btn-outline-light">View All Customer
							Status</a>
					</div>
				</div>

				<div class="btn-group">
					<button type="button" class="btn btn-primary dropdown-toggle"
						data-toggle="dropdown"
						style="background-color: #222831; border: 2px solid #222831;">Account
						Management</button>
					<div class="dropdown-menu" style="background-color: #dddddd">
						<a href="ExecutiveController?action=createAccount"
							class="dropdown-item btn btn-outline-light">Create Account</a>
						<div class="dropdown-divider"></div>
						<a href="ExecutiveController?action=deleteAccount"
							class="dropdown-item btn btn-outline-light">Delete Account</a>
						<div class="dropdown-divider"></div>
						<a href="ExecutiveController?action=accountStatus&currentPage=1"
							class="dropdown-item btn btn-outline-light">View All Account
							Status</a>
					</div>
				</div>

				<div class="btn-group">
					<button type="button" class="btn btn-primary dropdown-toggle"
						data-toggle="dropdown"
						style="background-color: #222831; border: 2px solid #222831;">Search</button>
					<div class="dropdown-menu" style="background-color: #dddddd">
						<a href="ExecutiveController?action=viewCustomer"
							class="dropdown-item  btn btn-outline-light">View Customer
							Details</a>
					</div>
				</div>

				<form class="form-inline ml-auto" action="UserController"
					method="get">
					<span class="label-input100"
						style="font-weight: bold; font-size: 20px; color: white; text-transform: capitalize;">${userName}</span>
					&ensp;&ensp; <input type="hidden" name="action" value="logout">
					<button type="submit" class="btn btn-outline-light">Logout</button>
				</form>
			</div>
		</nav>
	</div>
</body>
</html>