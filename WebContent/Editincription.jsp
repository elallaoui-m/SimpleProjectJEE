<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>

<%@ page import="controlServlets.Utilisateur" %>
<%-- <%Utilisateur Myuser =(Utilisateur) request.getSession().getAttribute("user"); %> --%>
<fmt:setLocale value = "en"/>
<fmt:setBundle basename = "ressources.message" /> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
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
   
        
	  
	  <article id="electriccars" data-columns="Password" data-index-number="12314" data-parent="cars">
</article>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100 p-l-50 p-r-50 p-t-77 p-b-30">
                    <form class="login100-form validate-form" methode="post"  action="<c:url value = "/EditProfileS"/>">
                        <span class="login100-form-title p-b-55">
                            Registre
                        </span>
                        <c:choose>
						  <c:when test="${not empty requestScope.wrongPass && requestScope.wrongPass=='1'}">
							<div class='container-login100-form-btn p-t-25  text-center'>
								<div class='alert alert-danger' role='alert'>
		  						 <fmt:message key = "message.error"/>
								</div>
	    					</div>
						  </c:when>
						 
						  <c:otherwise>
						    
						  </c:otherwise>
					</c:choose>
                        <div class="wrap-input-inline validate-input m-b-20" data-validate="">
                            <input class="input100 input1000" type="text" name="firstname" placeholder=" " value=${Myuser.prenom} >
                                <span class="focus-input100 ">
                                    <label for="fullname" class="float-lable">First name</label>
                                </span>
                        </div>
                        
                        <div class="wrap-input-inline validate-input m-b-20" data-validate="">
                            <input class="input100 input1000" type="text" name="lastname" placeholder=" " value=${Myuser.nom} >
                                <span class="focus-input100">
                                    <label for="fullname" class="float-lable">Last name</label>
                                </span>
                                
                                
                                </div>
                        
                        <div class="wrap-input100 validate-input m-b-10" data-validate="Valid email is required: ex@gmail.com">
                            <input class="input100 input1000" type="text" name="email" placeholder="ex@gmail.com" readonly value=${Myuser.email}>
                                <span class="focus-input100">
                                    <label for="fullname" class="float-lable">Email</label>
                                </span>
                                </div>
                        <p class="para-email m-b-20">Use your adresse email </p>
                        
                        <div class="wrap-input100 validate-input m-b-20" data-validate="Valid email is required: ex@gmail.com">
                            <select class="input100" name='gender'>
                              
                              	<option <c:if test = "${Myuser.gender == 'female'}"><c:out value="selected"/></c:if> value="female">Female</option>
                              	<option <c:if test = "${Myuser.gender == 'male'}"><c:out value="selected"/></c:if> value="male">Male</option>
                                <%-- <option <c:if test="${Myuser.getGender() == 'male' }"><c:out value="selected"></c:out></c:if> value="male">Male</option> --%>
                                
                                 
                                
                           
                            </select>
                                <span class="focus-input100">
                                    <label for="fullname" class="float-lable">Gender</label>
                                </span>
                                
                                
                                
                                </div>
                        <fmt:parseDate value="${Myuser.dateN}" pattern="yyyy-MM-dd" var="myDate"/>
						
                        <div class="flex-password m-b-10">
                        <div class="wrap-input100 date-31 m-r-10" data-validate="Valid email is required: ex@gmail.com">
                            <input class="input100 date-" id="day" type="date"  name="birthday" placeholder=" " value=<fmt:formatDate value="${myDate}" pattern="yyyy-MM-dd"/>>
                                <span class="focus-input100">
                                    <label for="fullname" class="float-lable">Birthday</label>
                                </span>
                                </div>
                        <div class="wrap-input100 date-30 m-r-10">
                            
                                
                                </div>
                        <div class="wrap-input100 date-60  " data-validate="Valid email is required: ex@gmail.com">
                            
                                
                                </div>
                        </div>
                        
                        
                        <div class="div-error m-b-10">
                            <p class="invalid" id="invalid-date"> </p>
                        </div>
                        
                        <div class="flex-password m-b-10">
                        <div class="wrap-input100  m-r-8" data-validate="Password is required">
                            <input class="input100 pass-" type="password" id="password" name="Oldpass" placeholder=" ">
                               
                                <span class="focus-input100">
                                    <label for="fullname" class="float-lable">Old pwd</label>
                                </span>
                                </div>
                                
                        <div class="wrap-input100  m-r-8" data-validate="Password is required">
                            <input class="input100 pass-" type="password" id="password" name="pass" placeholder=" ">
                               
                                <span class="focus-input100">
                                    <label for="fullname" class="float-lable">Password</label>
                                </span>
                                </div>
                                
                        <div class="wrap-input100  m-r-8" data-validate="Password is required">
                            <input class="input100 pass-" id="confirm" type="password" name="confirm" placeholder=" ">
                                
                                <span class="focus-input100">
                                    <label for="fullname" class="float-lable">Confirm</label>
                                </span>
                                </div>
                        <span>
                        <i class="icon ion-eye-disabled" id="toggle-eye"></i>
                             </span>
                        </div>
                        <div class="para-pass">Use 8 or more characters with a mix of letters, numbers &amp; symbols</div>
                        <div class="div-error m-b-10">
                            <p class="invalid" id="invalid-pass"></p>
                        </div>
                        
                        <c:if test="${ sessionScope.typeUser == 'admin' }">
                        
                        <div class="wrap-input100 validate-input m-b-20" data-validate="Valid email is required: ex@gmail.com">
                            <select class="input100" name='role'>
                              
                                <option value="user" <c:if test="${Myuser.type=='user' }">selected</c:if>>User</option>
                                <option value="admin"<c:if test="${Myuser.type=='admin'}">selected</c:if>>Admin</option>
                           
                            </select>
                                <span class="focus-input100">
                                    <label for="fullname" class="float-lable">Role</label>
                                </span>

                                </div>
                        
                        </c:if>
                        
                        
                        <div class="container-login100-form-btn p-t-25">
                            <button class="login100-form-btn" type='submit'>
                               Save
                            </button>
                        </div>
                        <div class="text-center w-full p-t-40">
                            
                            
                            
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        
        
        
        <!--===============================================================================================-->
        <script src="./sign up_files/jquery-3.2.1.min.js.download"></script>
        <!--===============================================================================================-->
        
        <!--===============================================================================================-->
        
        <!--===============================================================================================-->
        <script src="./sign up_files/main1.js.download"></script>
        
    
</body></html>