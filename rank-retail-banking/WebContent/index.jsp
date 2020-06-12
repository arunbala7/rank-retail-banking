<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>R.A.N.K Retail Banking</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="icon" type="image/png" href="images/icons/favicon.ico" />
    <link
      rel="stylesheet"
      type="text/css"
      href="vendor/bootstrap/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="fonts/font-awesome-4.7.0/css/font-awesome.min.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="fonts/iconic/css/material-design-iconic-font.min.css"
    />
    <link rel="stylesheet" type="text/css" href="css/util.css" />
    <link rel="stylesheet" type="text/css" href="css/main.css" />
    <script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
  </head>
  <body>
  	<% //SESSION CHECK (LOGGED IN OR NOT)  	
  	String workGroup=(String)session.getAttribute("workGroup");
  	if(workGroup!=null){
  		response.sendRedirect("Dashboard.jsp");  		
  		}		
  	%>
    <div class="limiter">
      <div
        class="container-login100"
        style="background-image: url('images/bg-01.jpg');"
      >
        <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
          <span
            class="login100-form-title"
            style="font-size: 30px; color: crimson;"
            >R.A.N.K Retail Banking</span
          ><br />
          <form class="login100-form validate-form" method="post"  action="UserController">
            <span
              class="login100-form-title p-b-49"
              style="
                font-size: 25px;
                font-family: 'Lucida Console', Courier, monospace;
              "
            >
              Login
            </span>

            <div
              class="wrap-input100 validate-input m-b-23"
              data-validate="Username is reauired"
            >
              <span class="label-input100">Username</span>
              <input
                class="input100"
                type="text"
                name="userName"
                placeholder="Type your username"
              />
              <span class="focus-input100" data-symbol="&#xf206;"></span>
            </div>

            <div
              class="wrap-input100 validate-input"
              data-validate="Password is required"
            >
              <span class="label-input100">Password</span>
              <input
                class="input100"
                type="password"
                name="password"
                placeholder="Type your password"
              />
              <span class="focus-input100" data-symbol="&#xf190;"></span>
            </div>
            <br /><br />
            <div class="container-login100-form-btn">
              <div class="wrap-login100-form-btn">
                <div class="login100-form-bgbtn"></div>
                <button class="login100-form-btn">
                  Login
                </button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
    <script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
  </body>
</html>
