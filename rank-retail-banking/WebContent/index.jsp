<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>R.A.N.K Retail Banking</title>
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

<script>
$(document).ready(function() {
    "use strict";
//   [ Focus input ]
    $('.input100').each(function(){
        $(this).on('blur', function(){
            if($(this).val().trim() != "") {
                $(this).addClass('has-val');
            }
            else {
                $(this).removeClass('has-val');
            }
        })    
    })     
//   [ Validate ]
    var input = $('.validate-input .input100');

    $('#login').click(function(){
        var check = true;
        for(var i=0; i<input.length; i++) {
            if(validate(input[i]) == false){
                showValidate(input[i]);
                check=false;
            }            
        }
        if(check){
			var userName = "";
			var password = "";
			userName = $("#userName").val();
			password = $("#password").val();
			
			var obj={userName,password};	
			//alert(JSON.stringify(obj));
			$.ajax({
	            url:'UserController',
	            data:obj,
	            type:'post',
	            cache:false,
	            async: false,
	            success:function(data){
	            	if("failed"===data){	            		
	            	swal({
	            		  title: "Incorrect Credentials",
	            		  text: "Login failed please try again!",
	            		  icon: "error",
	            		  button: "Okay",
	            		}).then((value) => {
	            			if(value){
	            				location.reload(true);
	            				}
	            		});
	            	}else{
	            	window.location.href = "/rank-retail-banking/Dashboard.jsp";
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
        return false;
    });


    $('.validate-form .input100').each(function(){
        $(this).focus(function(){
           hideValidate(this);
        });
    });

    function validate (input) {       
            if($(input).val().trim() == '')
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


$(document).keypress(function(event){
    var keycode = (event.keyCode ? event.keyCode : event.which);
    if(keycode == '13'){
        $('#login').click();    
    }
});

</script>
</head>

<body
	style="background-image: url('CSS and JS/images/other.jpg'); background-repeat: no-repeat; background-size: cover;">
	<%
		//SESSION CHECK (LOGGED IN OR NOT)  	
	String workGroup = (String) session.getAttribute("workGroup");
	if (workGroup != null) {
		response.sendRedirect("Dashboard.jsp");
	}
	//Back Button Cache Security
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");//HTTP 1.1
	response.setHeader("Pragma", "no-cache");//HTTP 1.0
	response.setHeader("Expires", "0");//Proxies
	%>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<span class="login100-form-title"
					style="font-size: 30px; color: crimson;">R.A.N.K Retail
					Banking</span><br />
				<form autocomplete="off" class="login100-form validate-form"
					id="LoginForm">
					<span class="login100-form-title p-b-49"
						style="font-size: 25px; font-family: 'Lucida Console', Courier, monospace;">
						Login </span>

					<div class="wrap-input100 validate-input m-b-23"
						data-validate="Username is reauired">
						<span class="label-input100">Username</span> <input
							class="input100" type="text" name="userName" id="userName"
							placeholder="Type your username" /> <span class="focus-input100"
							data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Password is required">
						<span class="label-input100">Password</span> <input
							class="input100" type="password" name="password" id="password"
							placeholder="Type your password" /> <span class="focus-input100"
							data-symbol="&#xf190;"></span>
					</div>
					<br /> <br />
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" id="login">Login</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="CSS and JS/js/jquery-3.5.1.min.js"></script>

</body>
</html>
