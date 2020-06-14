<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Create Customer</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<link rel="icon" type="image/png"
	href="../CSS and JS/images/icons/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="../CSS and JS/vendor/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="../CSS and JS/fonts/font-awesome-4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="../CSS and JS/fonts/iconic/css/material-design-iconic-font.min.css" />
<link rel="stylesheet" type="text/css" href="../CSS and JS/css/util.css" />
<link rel="stylesheet" type="text/css" href="../CSS and JS/css/main.css" />
<script type="text/javascript"
	src="../CSS and JS/js/jquery-3.5.1.min.js"></script>
<script>
$(document).ready(function() {
		"use strict";
		//   [ Focus input ]
		$('.input100').each(function() {
			$(this).on('blur', function() {
				if ($(this).val().trim() != "") {
					$(this).addClass('has-val');
				} else {
					$(this).removeClass('has-val');
				}
			})
		})
		//   [ Validate ]
		var input = $('.validate-input .input100');

		$('.validate-form').on('submit', function(e) {
			var check = true;

			for (var i = 0; i < input.length; i++) {
				if (validate(input[i]) == false) {
					showValidate(input[i]);
					check = false;
				}
			}
			
			if(check){
			var name = "";
			var ssn = "";
			var dob = "";
			var address = "";
			var action = "";
			e.preventDefault();
			name = $("#name").val();
			ssn = $("#ssno").val();
			dob = $("#dob").val();
			address = $("#address").val();
			action = $("#action").val();
			var obj={name,ssn,dob,address,action };
			//alert(JSON.stringify(obj));			
			$.ajax({
	            url:'../ExecutiveController',
	            data:obj,
	            type:'post',
	            cache:false,
	            async: false,
	            success:function(data){
	               alert(data);
	               $('#reset').click();
	            },
	            error:function(){
	              alert('error');
	            }
	         }
	    );
			}
			return false;
		});

		$('.validate-form .input100').each(function() {
			$(this).focus(function() {
				hideValidate(this);
			});
		});

		function validate(input) {
			if ($(input).val().trim() == '')
				return false;
		}

		function showValidate(input) {
			var thisAlert = $(input).parent();

			$(thisAlert).addClass('alert-validate');
		}

		function hideValidate(input) {
			var thisAlert = $(input).parent();

			$(thisAlert).removeClass('alert-validate');
		}

		function Validate() {
			var thisAlert = this.parent();

			$(thisAlert).addClass('alert-validate');
		}
	});
</script>
</head>
<body>
	<%@ include file="../executiveHeader.jsp"%>
	<div class="container-login100"
		style="background-image: url('../CSS and JS/images/other.jpg');">
		<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
			<span class="login100-form-title"
				style="font-size: 30px; color: crimson;">Create Customer</span><br />
			<form class="login100-form validate-form " id="customerForm">
				<div class="wrap-input100 validate-input m-b-23"
					data-validate="Enter a valid Name">
					<span class="label-input100">Name</span> <input
						class="input100 form-control" type="text" id="name" name="name"
						placeholder="Enter the name..." /> <span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input m-b-23"
					data-validate="Enter a valid SSN">
					<span class="label-input100" id="ssn">Social Security Number</span>
					<input class="input100 form-inline form-control" type="text"
						id="ssno" name="ssn" maxLength="9" placeholder="Enter the ssn..." />
					<span class="focus-input100"></span>
				</div>
				<div class="wrap-input100 validate-input m-b-23"
					data-validate="Enter a valid DOB">
					<span class="label-input100 ">Date of Birth</span> <input
						class="input100 form-control" type="date" id="dob" name="dob" />
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input m-b-23"
					data-validate="Enter a Address">
					<span class="label-input100">Address</span> <input
						class="input100 form-control" type="text"
						placeholder="Enter the address..." id="address" name="address" />
					<span class="focus-input100"></span>
				</div>
				<input type="hidden" id="action" name="action"
					value="createCustomer" /> <br /> <br />
				<div class="btn-group">
					<center>
						<button type="reset" class="btn btn-primary active" id="reset">Reset</button>
						&ensp; <input type="submit" class="btn btn-primary active"
							id="submitForm" value="Create" />
					</center>
				</div>

			</form>
		</div>
	</div>
	</div>

	<%@ include file="../footer.jsp"%>
	<script type="text/javascript"
		src="../CSS and JS/js/jquery-3.5.1.min.js"></script>
</body>
</html>