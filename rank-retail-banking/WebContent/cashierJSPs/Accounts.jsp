<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>View Accounts</title>
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
	
	$("#reset1").on("click", function () {
		$("#id").val("");
	    $('#basedOn').val("accountId");
	    $('#span').text("Account Number");
	    $('#id').attr('name',"accoundId");
	});
	
	$( "#basedOn" ).change(function() {
		  var basedOn="";
	      basedOn=$('#basedOn').val(); 
	      if(basedOn==="accountId"){
	    	  $('#id').attr('name',"accoundId");
	    	  $("#span").text("Account Number");
	      }
	      else{
	    	  $('#id').attr('name',"customerId");
	    	  $("#span").text("Customer ID");
	      }
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
		
		$('#Form1').on('submit', function(e) {
			var check=true;
			if (validate($("#id")) == false) {
				showValidate($("#id"));	
				check=false;
			}
			if(check){
				var id="";
				var basedOn="";
				basedOn=$('#basedOn').val();
				id=$("#id").val();
				var action= 'Accounts';
				var actionType= 'fetch';
				var obj={id,
		            	action,
		            	basedOn,
		            	actionType
		            	};
				//alert(JSON.stringify(obj));
				$.ajax({
		            url:'CashierController',
		            data:obj,
		            type:'post',
		            cache:false,
		            async: false,
		            success:function(data){
		            		   if(data==="success"){  			
		            			   $('#id').attr('name',"id");
		            		   }else{		            			  
		            			  swal({
		 		            		  title: "Failed",
		 		            		  text: "No Details to fetch with the data provided!",
		 		            		  icon: "error",
		 		            		  button: "Okay",		 		           
		 		            		});
		            			   check=false;
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
		            });
			}
			return check;
		   
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
		    case "name":
		      return validate_name($(input).val().trim());
		    case "ssn":
		      return validate_ssno($(input).val().trim());
		    case "dob":
		      return validate_dob($(input).val().trim());
		    case "address":
		      return validate_address($(input).val().trim());
		    case "customerId":
		      return validate_customer_id($(input).val().trim());
		    case "accountId":
		      return validate_account_number($(input).val().trim());
		    case "transactionId":
		      return validate_transaction_id($(input).val().trim());
		    case "amount":
		      return validate_depositAmount($(input).val().trim());
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
<body>
	<%@ include file="../cashierHeader.jsp"%>
	<div class="container-login100"
		style="background-image: url('CSS and JS/images/other.jpg'); background-repeat: no-repeat; background-size: cover;">
		<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
			<span class="login100-form-title"
				style="font-size: 30px; color: crimson;">View Accounts</span><br />
			<form autocomplete="off" class="login100-form validate-form "
				id="Form1" action="CashierController" method="post">
				<div class="wrap-input100 validate-input m-b-23 before-id"
					data-validate="Select a valid Account Type">
					<span class="label-input100 ">Based On</span> <select id="basedOn"
						name="basedOn" class="input100 form-control">
						<option value="accountId" selected>Account Number</option>
						<option value="customerId">Customer ID</option>
					</select> <span class="focus-input100"></span>
				</div>
				<div class="wrap-input100 validate-input m-b-23"
					data-validate="Enter a Valid Id">
					<span id="span" class="label-input100">Account Number</span> <input
						autocomplete="off" class="input100 form-control" type="text"
						id="id" name="accountId" maxLength="9"
						placeholder="Enter the ID..." /> <span class="focus-input100"></span>
				</div>
				<input type="hidden" name="action" id="action" value="Accounts" />
				<input type="hidden" name="actionType" id="actionType" value="view" />
				<div class="col-md-12 text-center after-id">
						<button type="reset" class="btn btn-primary active" id="reset1">Reset</button>
						&ensp; <input type="submit" class="btn btn-primary active"
							id="submitForm" value="Fetch" />
				</div>
			</form>

		</div>
	</div>

	<%@ include file="../footer.jsp"%>
	<script type="text/javascript"
		src="CSS and JS/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="CSS and JS/js/validation.js"></script>
</body>
</html>