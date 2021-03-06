<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>View Customer</title>
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
$(document).keypress(function(event){
    var keycode = (event.keyCode ? event.keyCode : event.which);
    if(keycode == '13'){
        $('#customerId').click();  
    }
});
$(document).ready(function() {
	
		$("#reset1").click(function(){
			$("#id").val("");
			  $('#basedOn').val("customerId");
			    $('#span').text("Customer ID");
			    $('#id').attr('name',"customerId");
		});
		
		$( "#basedOn" ).change(function() {
			  var basedOn="";
		      basedOn=$('#basedOn').val(); 
		      if(basedOn==="customerId"){		   
		    	  $('#id').attr('name',"customerId");
		    	  $("#span").text("Customer ID");
		    	  $("#id").val("");
		    	  $('#id').attr('maxLength',"9");
		    	  $('#div1').attr('data-validate',"Enter a Valid Customer Id");
		      }
		      else{
		    	  
		    	  $('#id').attr('name',"ssn");
		    	  $("#span").text("Social Securtiy Number");
		    	  $("#id").val("");
		    	  $('#id').attr('maxLength',"9");
		    	  $('#div1').attr('data-validate',"Enter a Valid SSN");
		      }
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
		
		$("#customerId").click(function(){
			if (validate($("#id")) == false) {
				showValidate($("#id"));				
			}else{
				var id="";
				var basedOn="";
				basedOn=$('#basedOn').val();
				id=$("#id").val();
				var action= 'viewCustomer';
				var actionType= 'fetch';
				var obj={id,
		            	action,
		            	basedOn,
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
		            	if(data.hasOwnProperty("id"))
		            		{
		            		$( "#customerId" ).remove()
		            	$('#id').attr('readonly', true); 
		            	$('#ssno').val(data.ssn);
		            	$('#name').val(data.name);
		            	$('#address').val(data.address);
		            	$('#dob').val(data.dob);
		            	$(".after-id").css("display", "none");
		            	$(".before-id").css("display", "block");
		            	$('#ssno').attr('readonly', true);
		            	$('#name').attr('readonly', true);
		            	$('#address').attr('readonly', true);
		            	$('#dob').attr('readonly', true);
		            	if(basedOn==="customerId")
		            		{
		            		$("#second").text("Social Security Number");
		            		}else{
		            			$("#second").text("Customer ID");	
		            		}
		            		}else{
		            			swal({
		 		            		  title: "Failed",
		 		            		  text: "No Details to fetch with the data provided!",
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

		$('.validate-form').on('submit', function(e) {
			
			
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
		    case "ssn":
		      return validate_ssno($(input).val().trim());
		    case "customerId":
		      return validate_customer_id($(input).val().trim());
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
	<%@ include file="../executiveHeader.jsp"%>
	<div class="container-login100"
		style="background-image: url('CSS and JS/images/other.jpg'); background-repeat: no-repeat; background-size: cover;">
		<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
			<span class="login100-form-title"
				style="font-size: 30px; color: crimson;">View Customer</span><br />
			<form autocomplete="off" class="login100-form validate-form "
				id="Form">
				<div class="wrap-input100 validate-input m-b-23 after-id"
					data-validate="Select a valid Account Type" id="div2">
					<span class="label-input100 ">Based On</span> <select id="basedOn"
						name="basedOn" class="input100 form-control">
						<option value="customerId" selected>Customer ID</option>
						<option value="accountId">Social Security Number</option>
					</select> <span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input m-b-23"
					data-validate="Enter a Valid Customer Id" id="div1">
					<span id="span" class="label-input100">Customer ID</span> <input
						autocomplete="off" class="input100 form-control" type="text"
						id="id" maxLength="9" name="customerId"
						placeholder="Enter the ID..." /> <span class="focus-input100"></span>
				</div>
			</form>
			<div class="col-md-12 text-center after-id">
				<button type="reset" class="btn btn-primary active" id="reset1">Reset</button>
				&ensp;
				<button class="btn btn-primary active" id="customerId">Find
					Customer</button>
			</div>

			<form autocomplete="off" class="login100-form validate-form "
				id="customerForm">
				<div style="display: none;"
					class="wrap-input100 validate-input m-b-23 before-id"
					data-validate="Enter a Valid SSN">
					<span class="label-input100" id="second">Social Security
						Number</span> <input class="input100 form-inline form-control"
						type="text" id="ssno" name="ssn" maxLength="9"
						placeholder="Enter the ssn..." /> <span class="focus-input100"></span>
				</div>
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
					data-validate="Enter a Valid Address">
					<span class="label-input100">Address</span> <input
						class="input100 form-control" type="text"
						placeholder="Enter the address..." id="address" name="address" />
					<span class="focus-input100"></span>
				</div>
				<div style="display: none;" class="col-md-12 text-center before-id">
					<input type="reset" class="btn btn-primary active" id="reset"
						value="Back" />
				</div>

			</form>
		</div>
	</div>

	<%@ include file="../footer.jsp"%>
	<script type="text/javascript" src="CSS and JS/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="CSS and JS/js/validation.js"></script>
</body>
</html>