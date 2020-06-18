<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About Us</title>
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
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  margin: 0;
}

html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

p {
  font-weight: bold;
}

.column {
  float: left;
  width: 33.3%;
  margin-bottom: 16px;
  padding: 0 8px;
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  margin: 8px;
}

.about-section {
  padding: 50px;
  padding-top:50px;
  text-align: center;
  background-color: #002266;
  color: white;
  height:100%;
}

.container {
  padding: 0 16px;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: grey;
}

.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
}

.button:hover {
  background-color: #555;
}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}
</style>

</head>
<body style="background-image: url('CSS and JS/images/other.jpg');background-size: cover;">
	<!-- Adding Header Based on the user  -->
	<c:choose>
		<c:when test="${workGroup =='cashier'}">
			<%@ include file="cashierHeader.jsp"%>
		</c:when>
		<c:otherwise>
			<%@ include file="executiveHeader.jsp"%>
		</c:otherwise>
	</c:choose>
	</br>
<div class="about-section">
  <h1 style="text-align:center;">Our Team</h1>
  
</div>
<div class="container">
<div class="row">
  <div class="column col align-self-center">
    <div class="card">
      <img src="CSS and JS/images/Arun Balaji R.jpeg" alt="Arun Balaji R" style="width:100%">
      <div class="container">
        <h2>Arun Balaji Rajendiran</h2>
        <p class="title">Developer</p>
        <p>CT20172231181</p>
        <p>arunbalaji.cs16@bitsathy.ac.in</p>
        <p><button class="button" onclick="location.href='https://www.linkedin.com/in/arunbalaultimate7/'">Contact</button></p>
      </div>
    </div>
  </div>

  <div class="column col align-self-center">
    <div class="card">
      <img src="CSS and JS/images/Raja Thirumal G.jpeg" alt="Raja Thirumal G" style="width:100%">
      <div class="container">
        <h2>Raja Thirumal Govindaraj</h2>
        <p class="title">Developer</p>
        <p>CT20172231173</p>
        <p>rajathirumal.cs16@bitsathy.ac.in</p>
        <p><button class="button" onclick="location.href='https://www.linkedin.com/in/raja-thirumal-govindaraj-2566b1187/'">Contact</button></p>
      </div>
    </div>
  </div>
  </div>
  
  <div class="row text-center justify-content-center">
  <div class="column ">
    <div class="card">
      <div class="container">
      <p class="title" style="color:black;font-size:30px">Support Developers</p>
        <p>Nivetha R CT20172231274<p>
         <p>Naveena L CT20172231210</p>
         <p>Kalakata Manasa CT20172231278</p>   
         <p>Kalaiyarasi S CT20172231223</p>     
      </div>
    </div>
  </div>
  </div>
  </div>
 

	<script type="text/javascript" src="CSS and JS/js/jquery-3.5.1.min.js"></script>
	<%@ include file="footer.jsp"%>
</body>
</html>