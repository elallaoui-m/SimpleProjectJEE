<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%@ page errorPage="ifError.jsp" %>



   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html >
<head>
	<title>Login</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="inc/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="inc/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="inc/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="inc/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">

<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="inc/css/util.css">
	<link rel="stylesheet" type="text/css" href="inc/css/main.css">
<!--===============================================================================================-->
<meta name="google-signin-client_id" content="922252162446-9djl5kksq5beha2m35a0aoo5vshj398e.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
</head>
<body>
	 <fmt:setLocale value = "en"/>
	  <fmt:setBundle basename = "ressources.message" />
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-50 p-r-50 p-t-77 p-b-30">
				<form class="login100-form validate-form" method="post" action="<c:url value = "/LoginS"/>">
					<span class="login100-form-title p-b-55">
						<fmt:message key = "message.loginWord"/>
					</span>

					<div class="wrap-input100 validate-input m-b-16" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="email" placeholder="Email">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<span class="lnr lnr-envelope"></span>
						</span>
					</div>

					<div class="wrap-input100 validate-input m-b-16" data-validate = "Password is required">
						<input class="input100" type="password" name="pass" placeholder="<fmt:message key = "message.password"/>">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<span class="lnr lnr-lock"></span>
						</span>
					</div>

					<div class="contact100-form-checkbox m-l-4">
						<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
						<label class="label-checkbox100" for="ckb1">
								<fmt:message key = "message.remember"/>
						</label>
					</div>
					
					<div class="container-login100-form-btn p-t-25">
						<button class="login100-form-btn">
						<fmt:message key = "message.loginBtn"/>
						</button>
					</div>
					
					<c:choose>
						  <c:when test="${not empty requestScope.correct && requestScope.correct=='0'}">
							<div class='container-login100-form-btn p-t-25  text-center'>
								<div class='alert alert-danger' role='alert'>
		  						 <fmt:message key = "message.error"/>
								</div>
	    					</div>
						  </c:when>
						  
						  <c:when test="${not empty param.logout && param.logout==1}">
							<div class='container-login100-form-btn p-t-25  text-center'>
								<div class="alert alert-success" role="alert">
  									<fmt:message key = "message.disc"/>
								</div>
	    					</div>
						  </c:when>
						  
						 <c:when test="${not empty param.verify && param.verify=='flase'}">
							<div class='container-login100-form-btn p-t-25  text-center'>
								<div class="alert alert-success" role="warning">
  									<fmt:message key = "message.verify"/>
								</div>
	    					</div>
						  </c:when> 
						 

						  <c:otherwise>
						    
						  </c:otherwise>
					</c:choose>

					<div class="text-center w-full p-t-42 p-b-22 formLogin__separator">
						<span class="txt1">
							<fmt:message key = "message.or"/>			
						</span>
					</div>

					<a href="#" class="btn-face m-b-10">
						<i class="fa fa-facebook-official"></i>
						Facebook
					</a>

					<!-- <a href="#" class="btn-google m-b-10" data-onsuccess="onSignIn">
						<img src="inc/images/icons/icon-google.png" alt="GOOGLE">
						Google
					</a> -->
					
					<div class="g-signin2" data-onsuccess="onSignIn"></div>

					<div class="text-center w-full p-t-115">
						<span class="txt1">
								<fmt:message key = "message.notMember"/>
						</span>

						<a class="txt1 bo1 hov1" href="#">
						<fmt:message key = "message.notMemberIncr"/>					
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
<a href="#" onclick="signOut();">Sign out</a>
	
<!--===============================================================================================-->	
	<script src="inc/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	
<!--===============================================================================================-->
	<script type="text/javascript" src='inc/vendor/jquery/jquery-3.2.1.min.js'></script>
	<script src="inc/js/main.js"></script>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<script src="inc/js/google.js" type="text/javascript"></script>
	
	


</body>
</html>
