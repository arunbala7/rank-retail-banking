<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Update Customer</title>
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
<script type="text/javascript"
	src="../CSS and JS/js/sweetalert.min.js"></script>
<script>
$(document).ready(function() {
	
		$("#reset1").click(function(){
			$("#id").val("");
		});
		
		$("#reset").click(function(){
			$("#name").val("");
			$("#age").val("");
			$("#address").val("");
		});
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
		
		$("#customerId").click(function(){
			if (validate($("#id")) == false) {
				showValidate($("#id"));				
			}else{
				var customerId="";
				customerId=$("#id").val();
				var action= 'updateCustomer';
				var actionType= 'fetch';
				var obj={customerId,
		            	action,
		            	actionType
		            	};
				//alert(JSON.stringify(obj));
				$.ajax({
		            url:'../ExecutiveController',
		            data:obj,
		            type:'post',
		            cache:false,
		            async: false,
		            success:function(data){	
		            	if(data.hasOwnProperty("id"))
		            		{
		            	$('#id').attr('readonly', true); 
		            	$('#ssno').val(data.ssn);
		            	$('#name').val(data.name);
		            	$('#address').val(data.address);
		            	$('#age').val(data.age);
		            	$(".after-id").css("display", "none");
		            	$(".before-id").css("display", "block");
		            	$('#ssno').attr('readonly', true); 
		            		}else{
		            			alert('Customer ID Not found!');
		            		}
		            },
		            error:function(){
		            	swal({
		            		  title: "Failed",
		            		  text: "No Response from the server! Try Again",
		            		  icon: "error",
		            		  button: "Okay",
		            		});
			            }
		         }
		    );
			}
		   
		  });
		

		$('.validate-form').on('submit', function(e) {
			var check = true;

			for (var i = 0; i < input.length; i++) {
				if (validate(input[i]) == false) {
					showValidate(input[i]);
					check = false;
				}
			}
			
			if(check){
				var id="";
			var name = "";
			var age = "";
			var address = "";
			var action = "updateCustomer";
			var actionType="update";
			e.preventDefault();
			name = $("#name").val();
			age = $("#age").val();
			address = $("#address").val();
			id=$("#id").val();
			var obj={name,age,address,actionType,action,id };		
			$.ajax({
	            url:'../ExecutiveController',
	            data:obj,
	            type:'post',
	            cache:false,
	            async: false,
	            success:function(data){
	            	swal({
	            		  title: "Success",
	            		  text: "Customer Updated Successfully!",
	            		  icon: "success",
	            		  button: "Okay",
	            		}).then((value) => {
	            			window.location.reload();
	            		});	               
	            },
	            error:function(){
	            	swal({
	            		  title: "Failed",
	            		  text: "No Response from the server! Try Again",
	            		  icon: "error",
	            		  button: "Okay",
	            		});
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
				style="font-size: 30px; color: crimson;">Update Customer</span><br />
				
				<div class="wrap-input100 validate-input m-b-23"
					data-validate="Enter a Customer Id">
					<span class="label-input100">Customer ID</span> <input
						class="input100 form-control" type="text" id="id" maxLength="10" name="customerId"
						placeholder="Enter the ID..." /> <span class="focus-input100"></span>
				</div>
				
				<div  class="btn-group after-id">
					<center>
						<button type="reset" class="btn btn-primary active" id="reset1">Reset</button>
						&ensp; <button class="btn btn-primary active"
							id="customerId"  />Find Customer</button>
					</center>
				</div>			
				
				
			<form class="login100-form validate-form " id="customerForm">
				<div style="display: none;" class="wrap-input100 validate-input m-b-23 before-id"
					data-validate="Enter a valid Name">
					<span class="label-input100">Name</span> <input
						class="input100 form-control" type="text" id="name" name="name"
						placeholder="Enter the name..." /> <span class="focus-input100"></span>
				</div>

				<div style="display: none;" class="wrap-input100 validate-input m-b-23 before-id" 
					data-validate="Enter a valid SSN">
					<span class="label-input100" id="ssn">Social Security Number</span>
					<input class="input100 form-inline form-control" type="text"
						id="ssno" name="ssn" maxLength="9" placeholder="Enter the ssn..." />
					<span class="focus-input100"></span>
				</div>
				<div style="display: none;" class="wrap-input100 validate-input m-b-23 before-id"
					data-validate="Enter a valid DOB">
					<span class="label-input100 ">Age</span> <input
						class="input100 form-control" type="number" id="age" name="age" />
					<span class="focus-input100"></span>
				</div>

				<div style="display: none;" class="wrap-input100 validate-input m-b-23 before-id"
					data-validate="Enter a Address">
					<span class="label-input100">Address</span> <input
						class="input100 form-control" type="text"
						placeholder="Enter the address..." id="address" name="address" />
					<span class="focus-input100"></span>
				</div>
			 <br /> <br />
				<div style="display: none;" class="btn-group before-id">
					<center>
						<button class="btn btn-primary active" id="reset">Reset</button>
						&ensp; <input type="submit" class="btn btn-primary active"
							id="submitForm" value="Update" />
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