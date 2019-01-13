<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
    <%@ page errorPage="ifError.jsp" %>
    <%@page import="java.util.Map" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	Map<String,String> errorlst = (Map<String,String>)request.getAttribute("errorList");
	
%>


<html>
    <head>
        <title>sign up</title>
        <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
                <!--===============================================================================================-->
                <link rel="icon" type="image/png" href="inc/images/icons/favicon.ico"/>
                <!--===============================================================================================-->
                <link rel="stylesheet" type="text/css" href="inc/vendor/bootstrap/css/bootstrap.min.css">
                    <!--===============================================================================================-->
                    <link rel="stylesheet" type="text/css" href="inc/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
                        <!--===============================================================================================-->
                   <link  rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
                            <!--===============================================================================================-->
                            <link rel="stylesheet" type="text/css" href="inc/vendor/animate/animate.css">
                                <!--===============================================================================================-->
                                
                                <!--===============================================================================================-->
                                
                                <!--===============================================================================================-->
                                <link rel="stylesheet" type="text/css" href="inc/css/util.css">
                                    <link rel="stylesheet" type="text/css" href="inc/css/main1.css">
                                        <!--===============================================================================================-->
  
  
  <script type="text/javascript">

</script>
    </head>
    <body>
   
        <fmt:setLocale value = "en"/>
	  <fmt:setBundle basename = "ressources.message" />
	  <article id="electriccars" data-columns="<fmt:message key = "message.password"/>"  data-index-number="12314" data-parent="cars">
</article>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100 p-l-50 p-r-50 p-t-77 p-b-30">
                    <form class="login100-form validate-form" methode='post' action="<c:url value = "/signupS"/>">
                        <span class="login100-form-title p-b-55">
                            Registre
                        </span>
                        
                        <c:choose>
						  <c:when test="${not empty requestScope.error && requestScope.error=='true'}">
							<div class='container-login100-form-btn p-t-25  text-center'>
								<div class='alert alert-danger' role='alert'>
		  						 <%
		  						for (Map.Entry<String, String> entry : errorlst.entrySet()) {
		  						    out.println(entry.getValue().toString());
		  						}
		  						 %>
								</div>
	    					</div>
						  </c:when>
						  <c:when test="${not empty requestScope.error && requestScope.error=='no'}">
							<div class='container-login100-form-btn p-t-25  text-center'>
								<div class="alert alert-success" role="alert">
  									Registration completed with success <br> check you email to activate your account<br>
  									<a href="Login.jsp" class="btn btn-lg btn-primary" role="button" aria-pressed="true">Go Home</a>
								</div>
	    					</div>
						  </c:when>
						  <c:otherwise>
						    
						  </c:otherwise>
					</c:choose>
                        <div class="wrap-input-inline validate-input m-b-20" data-validate = "">
                            <input class="input100 input1000" type="text" name="first-name" placeholder=" ">
                                <span class="focus-input100 ">
                                    <label for="fullname" class="float-lable">First name</label>
                                </span>
                        </div>
                        
                        <div class="wrap-input-inline validate-input m-b-20" data-validate = "">
                            <input class="input100 input1000" type="text" name="lastname" placeholder=" ">
                                <span class="focus-input100">
                                    <label for="fullname" class="float-lable">Last name</label>
                                </span>
                                
                                
                                </div>
                        
                        <div class="wrap-input100 validate-input m-b-10" data-validate = "Valid email is required: ex@gmail.com">
                            <input class="input100 input1000" type="text" name="email" placeholder="ex@gmail.com">
                                <span class="focus-input100">
                                    <label for="fullname" class="float-lable">Email</label>
                                </span>
                                </div>
                        <p class="para-email m-b-20">Use your adresse email </p>
                        
                        <div class="wrap-input100 validate-input m-b-20" data-validate = "Valid email is required: ex@gmail.com">
                            <select class="input100" name='gender' >
                              
                                <option value="male">Male</option>
                                <option value="female">Female</option>
                           
                            </select>
                                <span class="focus-input100">
                                    <label for="fullname" class="float-lable">Genre</label>
                                </span>
                                
                                
                                
                                </div>
                        <div class="flex-password m-b-10">
                        <div class="wrap-input100 date-30  m-r-10" data-validate = "Valid email is required: ex@gmail.com">
                            <input class="input100 date-" id="day" type="number" min="1" max="31"  name="day" placeholder=" ">
                                <span class="focus-input100">
                                    <label for="fullname" class="float-lable">Day</label>
                                </span>
                                </div>
                        <div class="wrap-input100 date-30  m-r-10" >
                            <input class="input100 date-" id="month" type="number" min="1" max="12" name="month" placeholder=" ">
                                <span class="focus-input100">
                                    <label for="fullname" class="float-lable">Month</label>
                                </span>
                                </div>
                        <div class="wrap-input100 date-60  " data-validate = "Valid email is required: ex@gmail.com">
                            <input class="input100 date-" id="year" type="number" name="year" placeholder=" ">
                                <span class="focus-input100">
                                    <label for="fullname" class="float-lable">Year</label>
                                </span>
                                </div>
                        </div>
                        
                        <p class="para-email "><fmt:message key = "message.birthDay"/> </p>
                        <div class="div-error m-b-10">
                            <p class="invalid" id="invalid-date"></p>
                        </div>
                        
                        
                        
                        
                        <div class="flex-password m-b-10">
                        <div class="wrap-input100  m-r-8" data-validate = "Password is required">
                            <input class="input100 pass-" type="password" id="password" name="pass" placeholder=" ">
                               
                                <span class="focus-input100">
                                    <label for="fullname" class="float-lable"><fmt:message key = "message.password"/></label>
                                </span>
                                </div>
                        <div class="wrap-input100  m-r-8" data-validate = "Password is required">
                            <input class="input100 pass-" id="confirm" type="password" name="confirm" placeholder=" ">
                                
                                <span class="focus-input100">
                                    <label for="fullname" class="float-lable"><fmt:message key = "message.confirm"/></label>
                                </span>
                                </div>
                        <span>
                        <i class="icon ion-eye-disabled" id="toggle-eye"></i>
                             </span>
                        </div>
                        <div class="para-pass" >Use 8 or more characters with a mix of letters, numbers &amp; symbols</div>
                        <div class="div-error m-b-10">
                            <p class="invalid" id="invalid-pass"></p>
                        </div>
                        
                        <div class="container-login100-form-btn p-t-25">
                            <button class="login100-form-btn">
                              <fmt:message key = "message.createAccount"/>
                            </button>
                        </div>
                        <div class="text-center w-full p-t-40">
                            <span class="txt1">
                                <fmt:message key = "message.youAreMember"/>
                            </span>
                            
                            <a class="txt1 bo1 hov1" href="Login.jsp">
                                <fmt:message key = "message.signIn"/>
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        
        
        
        <!--===============================================================================================-->
        <script src="inc/vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        
        <!--===============================================================================================-->
        
        <!--===============================================================================================-->
        <script src="inc/js/main1.js"></script>
        
    </body>
</html>