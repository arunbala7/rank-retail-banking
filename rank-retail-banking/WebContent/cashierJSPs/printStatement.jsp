<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Print Account Statement</title>
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
<script>
$(document).ready(function() {
	
	$( "#basedOn" ).change(function() {
		  var basedOn="";
	      basedOn=$('#basedOn').val(); 
	      if(basedOn==="count"){
	    	  $('#count').css("display", "block");
	    	  $("#date1").css("display", "none");
	    	  $("#date2").css("display", "none");
	      }
	      else{
	    	  $('#count').css("display", "none");
	    	  $("#date1").css("display", "block");
	    	  $("#date2").css("display", "block");
	      }
		});
	
	
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
				var action= 'printStatement';
				var actionType= 'fetch';
				var obj={accountId,
		            	action,
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
		            	if(data==="success")
		            	{ 
		            	$('#id').attr('readonly', true); 
		            	$(".after-id").css("display", "none");
		            	$(".before-id").css("display", "block");
		            	$("#date1").css("display", "none");
		   	    	    $("#date2").css("display", "none");
		   				var accountNumber="";
		   				accountNumber=$('#id').val();
		   				document.getElementById("sendAccount").value = accountNumber; 
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
		

		$('#Form1').on('submit', function(e) {
			var check = true;
            var basedOn="";
			basedOn=$('#basedOn').val();
			if(basedOn==="count")
				{
				if(validate_count($('#number').val().trim())==false)
					{
					showValidate($('#number'));
					check=false;
					}
				}
			else{
				if(validate_validDate($('#start').val().trim())==false)
				{
					showValidate($('#start'));
					check=false;
				}
				if(validate_validDate($('#end').val().trim())==false)
				{
				showValidate($('#end'));
				check=false;
				}				
			}
			if(check && basedOn!=="count"){
				if(validate_dates($('#start').val().trim(),$('#end').val().trim())==false)
				{
				swal({
				            		  title: "Failed",
				            		  text: "Start date is greater than or Equal to End date!",
				            		  icon: "error",
				            		  button: "Okay",
				            		});	
				return false;
				
				}	
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
	<%@ include file="../cashierHeader.jsp"%>
	<div class="container-login100">
		<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
			<span class="login100-form-title"
				style="font-size: 30px; color: crimson;">Print Account
				Statement</span><br />
			<form autocomplete="off" class="login100-form validate-form "
				id="Form">
				<div class="wrap-input100 validate-input m-b-23"
					data-validate="Enter a Valid Account Number">
					<span class="label-input100">Account Number</span> <input
						autocomplete="off" class="input100 form-control" type="text"
						id="id" maxLength="9" name="accountId"
						placeholder="Enter the Number..." /> <span class="focus-input100"></span>
				</div>
			</form>
			<div class="col-md-12 text-center after-id">
				<button type="reset" class="btn btn-primary active" id="reset1">Reset</button>
				&ensp;
				<button class="btn btn-primary active" id="accountId">Find
					account</button>
			</div>

			<form autocomplete="off" class="login100-form validate-form "
				id="Form1" action="CashierController" method="post">
				<div style="display: none;"
					class="wrap-input100 validate-input m-b-23 before-id"
					data-validate="Select a valid Account Type">
					<span class="label-input100 ">Based On</span> <select id="basedOn"
						name="basedOn" class="input100 form-control">
						<option value="count" selected>Count</option>
						<option value="date">Date</option>
					</select> <span class="focus-input100"></span>
				</div>
				<div style="display: none;"
					class="wrap-input100 validate-input m-b-23 before-id"
					data-validate="Enter a valid Number" id="count">
					<span class="label-input100">Number of Transactions</span> <input
						class="input100 form-control" type="text"
						placeholder="Enter the Number..." id="number" name="number" /> <span
						class="focus-input100"></span>
				</div>


				<div style="display: none;"
					class="wrap-input100 validate-input m-b-23 before-id"
					data-validate="Enter a Valid Date" id="date1">
					<span class="label-input100 ">Start Date</span> <input
						class="input100 form-control" type="date" id="start" name="start" />
					<span class="focus-input100"></span>
				</div>
				<div style="display: none;"
					class="wrap-input100 validate-input m-b-23 before-id"
					data-validate="Enter a Valid Date" id="date2">
					<span class="label-input100 ">End Date</span> <input
						class="input100 form-control" type="date" id="end" name="end" />
					<span class="focus-input100"></span>
				</div>
				<input type="hidden" name="action" id="action"
					value="printStatement" /> <input type="hidden" name="actionType"
					id="actionType" value="print" /> <input type="hidden"
					name="accountId" id="sendAccount" />


				<div style="display: none;" class="col-md-12 text-center before-id ">
					<input type="reset" class="btn btn-primary active" id="reset"
						value="Cancel"> &ensp; <input type="submit"
						class="btn btn-primary active" id="submitForm" value="Proceed" />
				</div>

			</form>
		</div>
	</div>

	<%@ include file="../footer.jsp"%>
	<script type="text/javascript" src="CSS and JS/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="CSS and JS/js/validation.js"></script>
</body>
</html>