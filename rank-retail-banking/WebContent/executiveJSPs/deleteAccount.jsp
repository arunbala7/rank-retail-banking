<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Delete Account</title>
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
<script type="text/javascript"
	src="CSS and JS/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="CSS and JS/js/sweetalert.min.js"></script>
<script type="text/javascript" src="CSS and JS/js/validation.js"></script>
<script>
$(document).ready(function() {
	
	
	
	$('#Form').keydown(function (e) {
	    if (e.keyCode == 13) {
	        e.preventDefault();
	        $("#accountId").click();
	    }
	});
	
	
		$("#reset1").click(function(){
			$("#id").val("");
		});
		
		$("#reset").click(function(){
			location.reload(true);
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
		
		$("#accountId").click(function(){
			if (validate($("#id")) == false) {
				showValidate($("#id"));				
			}else{
				var accountId="";
				accountId=$("#id").val();
				var action= 'deleteAccount';
				var actionType= 'fetch';
				var obj={accountId,
		            	action,
		            	actionType
		            	};
				//alert(JSON.stringify(obj));
				$.ajax({
		            url:'ExecutiveController',
		            data:obj,
		            type:'post',
		            cache:false,
		            async: false,
		            success:function(data){	
		            	if(data.hasOwnProperty("customer"))
		            	{ 
		            	$('#id').attr('readonly', true); 
		            	$('#name').val(data.customer.name);
		            	$('#dob').val(data.customer.dob);
		            	$('#custId').val(data.account.customerId);
		            	$('#balance').val(data.account.balance);
		            	$('#accountType').val(data.account.type);
		            	$('#status').val(data.account.status);
		            	$(".after-id").css("display", "none");
		            	$(".before-id").css("display", "block");
		            	$('#custId').attr('readonly', true);
		            	$('#balance').attr('readonly', true);
		            	$('#accountType').attr('readonly', true);
		            	$('#status').attr('readonly', true);		            	
		            	$('#name').attr('readonly', true);
		            	$('#dob').attr('readonly', true);
		            		}else{
		            			swal({
				            		  title: "Failed",
				            		  text: "Account Number Not found!",
				            		  icon: "error",
				            		  button: "Okay",
				            		});		            			
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
		

		$('#submitForm').click( function(e) {
			var check = true;

			for (var i = 0; i < input.length; i++) {
				if (validate(input[i]) == false) {
					showValidate(input[i]);
					check = false;
				}
			}
			
			if(check){
			var id="";
			var action = "deleteAccount";
			var actionType="delete";
			e.preventDefault();
			id=$("#id").val();
			var obj={actionType,action,id};
			swal({
				  title: "Confirm Delete",
				  text: "Once deleted, you will not be able to recover!",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
				  
					$.ajax({
					            url:'ExecutiveController',
					            data:obj,
					            type:'post',
					            cache:false,
					            async: false,
					            success:function(data){
					            	if(data==="success")
					            		{
					            	swal({
					            		  title: "Success",
					            		  text: "Account Deleted Successfully!",
					            		  icon: "success",
					            		  button: "Okay",
					            		}).then((value) => {
					            			window.location.reload();
					            		});
					            		}else{
					            			swal({
							            		  title: "Failed",
							            		  text: "Account Not Deleted! Try Again",
							            		  icon: "error",
							            		  button: "Okay",
							            		});
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
				  } else {
				    swal("Account Not Deleted");
				  }
				});
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
			switch ($(input).attr("name")) {
		    case "accountId":
		      return validate_account_number($(input).val().trim());
			default:
			  return;
		  }
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
<body
	style="background-image: url('CSS and JS/images/other.jpg'); background-repeat: repeat; background-size: cover;">
	<%@ include file="../executiveHeader.jsp"%>
	<div class="container-login100">
		<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
			<span class="login100-form-title"
				style="font-size: 30px; color: crimson;">Delete Account</span><br />
			<form autocomplete="off" class="login100-form validate-form "
				id="Form">
				<div class="wrap-input100 validate-input m-b-23"
					data-validate="Enter a Valid Account Number">
					<span class="label-input100">Account Number</span> <input
						autocomplete="off" class="input100 form-control" type="text"
						id="id" maxLength="10" name="accountId"
						placeholder="Enter the Number..." /> <span class="focus-input100"></span>
				</div>
			</form>
			<center>
				<div class="btn-group after-id justify-content-center">
					<button type="reset" class="btn btn-primary active" id="reset1">Reset</button>
					&ensp;
					<button class="btn btn-primary active" id="accountId">Find
						account</button>
				</div>
			</center>
			<div style="display: none;"
				class="wrap-input100 validate-input m-b-23 before-id"
				data-validate="Enter a Valid Customer Id">
				<span class="label-input100">Customer Id</span> <input
					class="input100 form-inline form-control" type="text" id="custId"
					name="customerId" maxLength="10"
					placeholder="Enter the Customer Id..." /> <span
					class="focus-input100"></span>
			</div>

			<form autocomplete="off" class="login100-form validate-form "
				id="accountForm">
				<div style="display: none;"
					class="wrap-input100 validate-input m-b-23 before-id"
					data-validate="Enter a Valid Name">
					<span class="label-input100">Name</span> <input
						class="input100 form-control" type="text" id="name" name="name"
						placeholder="Enter the name..." /> <span class="focus-input100"></span>
				</div>
				<div style="display: none;"
					class="wrap-input100 validate-input m-b-23 before-id"
					data-validate="Enter a Valid DOB">
					<span class="label-input100 ">Date of Birth</span> <input
						class="input100 form-control" type="date" id="dob" name="dob" />
					<span class="focus-input100"></span>
				</div>
				<div style="display: none;"
					class="wrap-input100 validate-input m-b-23 before-id"
					data-validate="Select the Account Type">
					<span class="label-input100" id="ssn">Account Type</span> <input
						class="input100 form-inline form-control" type="text"
						id="accountType" name="accountType" placeholder="Enter the ssn..." />
					<span class="focus-input100"></span>
				</div>
				<div style="display: none;"
					class="wrap-input100 validate-input m-b-23 before-id"
					data-validate="Enter a type">
					<span class="label-input100" id="ssn">Status</span> <input
						class="input100 form-inline form-control" type="text" id="status"
						name="status" placeholder="Enter the Status..." /> <span
						class="focus-input100"></span>
				</div>


				<div style="display: none;"
					class="wrap-input100 validate-input m-b-23 before-id"
					data-validate="Enter the balance">
					<span class="label-input100">Balance</span> <input
						class="input100 form-control" type="text"
						placeholder="Enter the balance..." id="balance" name="balance" />
					<span class="focus-input100"></span>
				</div>
				<center>
					<div style="display: none;" class="btn-group before-id ">
						<input type="reset" class="btn btn-primary active" id="reset"
							value="Cancel"> &ensp;
						<button class="btn btn-primary active" id="submitForm">Delete</button>
					</div>
				</center>
			</form>
		</div>
	</div>

	<%@ include file="../footer.jsp"%>
	<script type="text/javascript"
		src="CSS and JS/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="CSS and JS/js/validation.js"></script>
</body>
</html>