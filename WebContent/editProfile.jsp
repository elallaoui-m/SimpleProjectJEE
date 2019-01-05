<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>

<%-- <jsp:useBean id="Myuser" class="controlServlets.Utilisateur"/>--%>

<%@ page import="controlServlets.Utilisateur" %>
<%Utilisateur Myuser =(Utilisateur) request.getAttribute("user"); %> 

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>myprofile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto+Slab:300,400|Roboto:300,400,700">
    <link rel="stylesheet" href="assets/css/styles.min.css">
</head>

<body>
    <div class="container profile profile-view" id="profile">
        <nav class="navbar navbar-light navbar-expand-md navbar-fixed-top navigation-clean-button" style="background-color:#ffffff;">
            <div class="container"><a class="navbar-brand" href="#"><span style="color:#00c2ff;"><img src="assets/img/logo.png">AskSa</span> </a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                <div
                    class="collapse navbar-collapse" id="navcol-1">
                    <ul class="nav navbar-nav nav-right">
                        <li class="nav-item" role="presentation"><a class="nav-link active" href="index.html">home </a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="about.html">about </a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="faq.html">faq </a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="contact.html">contact </a></li>
                    </ul>
                    <p class="ml-auto navbar-text actions"> </p>
            </div>
    </div>
    </nav>
    <div class="row">
        <div class="col-md-12 alert-col relative">
            <div class="alert alert-info absolue center" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">Ã</span></button><span>Profile save with success</span></div>
        </div>
    </div>
    <form methode='post' action='/EditProfileS'>
        <div class="form-row profile-row">
            <div class="col-md-4 relative">
                <div class="avatar">
                    <div class="avatar-bg center" style="background-image:url(&quot;assets/img/download.png&quot;);"><label style="color:rgb(255,255,255);font-size:110px;"><strong>AA</strong></label></div>
                </div>
            </div>
            <div class="col-md-8">
                <h1>Edit Profile </h1>
                <hr>
                <div class="form-row">
                    <div class="col-sm-12 col-md-6">
                        <div class="form-group"><label>Firstname </label><input class="form-control" type="text" name="firstname" value=<%=Myuser.getPrenom() %> ></div>
                    </div>
                    <div class="col-sm-12 col-md-6">
                        <div class="form-group"><label>Lastname </label><input class="form-control" type="text" name="lastname" value=<%=Myuser.getNom() %>></div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-sm-12 col-md-6 col-lg-12">
                        <div class="form-group"><label>Date</label><input id="datefield" class="form-control" type="date" name="date" value=<%=Myuser.getDateN() %>></div>
                    </div>
                </div><%-- <div class="form-group"><label>Email</label><input type="email" class="form-control" autocomplete="off" required name="email" value=<%=Myuser.getEmail() %> /></div> --%>
                <div class="form-row">
                    <div class="col-sm-12 col-md-6 col-lg-12">
                        <div class="form-group"><label>Old Password </label><input class="form-control" type="password" name="Oldpassword" autocomplete="off" required=""></div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-sm-12 col-md-6">
                        <div class="form-group"><label>Password </label><input class="form-control" type="password" name="password" autocomplete="off" required=""></div>
                    </div>
                    <div class="col-sm-12 col-md-6">
                        <div class="form-group"><label>Confirm Password</label><input class="form-control" type="password" name="confirmpass" autocomplete="off" required=""></div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-sm-12 col-md-6 col-lg-3 offset-lg-0">
                        <div class="form-group"><label>Type</label>
                            <div class="dropdown">
                            <select class="form-control" name='role'>
							    <option value="user">User</option>
							    <option value="admin">Admin</option>
							</select>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="form-row">
                    <div class="col-md-12 content-right"><button class="btn btn-primary form-btn" type="submit">SAVE </button><button onClick="goBack()" class="btn btn-danger form-btn" type="reset">CANCEL </button></div>
                </div>
            </div>
        </div>
    </form>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/script.min.js"></script>
    <script src="assets/js/script.js"></script>
</body>

</html>