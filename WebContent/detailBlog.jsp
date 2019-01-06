<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
    
<%@page import="controlServlets.Blog,controlServlets.Commentaire,java.util.List,controlServlets.Utilisateur" %>

<%
    Blog myBlog = (Blog)request.getAttribute("blog");
	List<Commentaire> ListC = (List<Commentaire>) request.getAttribute("comments");
	int idblogbyrequest =(int)request.getSession().getAttribute("id");
%>
    




<!DOCTYPE html>
<html lang="en"><head>
    <meta charset="utf-8">
        <title>Page title - Sitename</title>
        </head><body>
            
            <!-- icons -->
            <link rel="apple-touch-icon" href="assets/img/apple-touch-icon.png">
                <link rel="shortcut icon" href="favicon.ico">
                    
                    <!-- Bootstrap Core CSS file -->
                    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
                        
                        <!-- Override CSS file - add your own CSS rules -->
                        <link rel="stylesheet" href="assets/css/styles.css">
                            
                            <!-- Conditional comment containing JS files for IE6 - 8 -->
                            <!--[if lt IE 9]>
                             <script src="assets/js/html5.js"></script>
                             <script src="assets/js/respond.min.js"></script>
                             <![endif]-->
                            
                            
                            
                            <!-- Navigation -->
                            <nav class="navbar navbar-fixed-top navbar-inverse" role="navigation">
                                <div class="container-fluid">
                                    
                                    <!-- Brand and toggle get grouped for better mobile display -->
                                    <div class="navbar-header">
                                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                            <span class="sr-only">Toggle navigation</span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                        </button>
                                        <a class="navbar-brand" href="#">AskSa</a>
                                    </div>
                                    <!-- /.navbar-header -->
                                    
                                    <!-- Collect the nav links, forms, and other content for toggling -->
                                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                        <ul class="nav navbar-nav">
                                            <li><a href="#">Nav item 1</a></li>
                                            <li><a href="#">Nav item 2</a></li>
                                            <li><a href="#">Nav item 3</a></li>
                                        </ul>
                                    </div>
                                    <!-- /.navbar-collapse -->
                                </div>
                                <!-- /.container-fluid -->
                            </nav>
                            <!-- /.navbar -->
                            
                            <!-- Page Content -->
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-sm-8 col-sm-push-4">
                                        <div class="page-header">
                                            <h1><%=myBlog.getTitre() %></h1>
                                            <p>Posted by <span class="glyphicon glyphicon-user"></span> <a href="#"><%=myBlog.getUtilisateur().getNom() %></a>&nbsp;<span class="glyphicon glyphicon-time"><%=myBlog.getDateBlog() %></span> </p>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.row -->
                                
                                <div class="row">
                                    <div class="col-sm-8 col-sm-push-4">
                                        
                                        <!-- Image -->
                                        
                                        
                                        <p class="lead"><%=myBlog.getIntro() %></p>
                                        <p style="text-align:justify"><%=myBlog.getDescription().replaceAll("\n", "<br><br>") %></p>
                                        <hr>
                                        
                                        <!-- Comments -->
                                        <h3>Comments</h3>
                                        
                                        
                                        <% for (Commentaire c : ListC) {%>
										    
										    <div class="well">
                                            <div class="media">
                                                <div class="media-left" style="
                                                    width: 70px !important;">
                                                    
                                                </div>
                                                <div class="media-body">
                                                    <h4 class="margin-t-0"><a href="#"><%=c.getUtilisateur().getNom() %></a></h4>
                                                    <p><a href="#"><%=c.getDateComm() %></a></p>
                                                    <p><%=c.getComm() %></p>
                                                    <p>
                                                    <button class="btn btn-sm btn-default">
                                                        <span class="glyphicon glyphicon-thumbs-up"></span> Upvote
                                                    </button>
                                                    <%=c.getUpvotes() %> likes<br>
													
													<% if(c.getUtilisateur().getIdEtudiant()==(idblogbyrequest)){
														out.println("<a href='/SimpleProjectJEE/HideComment?idcomment="+c.getIdCommentaire()+"'>Delete Comment</a>");
														}
														%>
													
													
                                                    
                                                    	
                                                    </p>
                                                     
                                                    
                                                </div>
                                            </div>
                                       	 </div>
										<%} %>
                                        
                                        
                                        
                                        
                                        <hr>
                                        
                                        <!-- Comment form -->
                                        <h3>Leave a comment</h3>
                                        <p>Please keep in mind that comments are moderated and rel="nofollow" is in use. So, please do not use a spammy keyword or a domain as your name, or else it will be deleted. Thank you!</p>
                                        
                                        <div class="well">
                                            <form action="<c:url value = "/AddComment"/>" methode='post'>
                                                
                                                <div class="form-group">
                                                    <label for="contactComment">Comment</label>
                                                    <textarea name=comment class="form-control" id="contactComment"></textarea>
                                                    <input hidden name='idblog' value=<%=myBlog.getIdBlog() %>>
                                                </div>
                                                <button type="submit" class="btn btn-default">Submit</button>
                                            </form>
                                        </div>
                                        <hr>
                                        
                                    </div>
                                    <div class="col-sm-4 col-sm-pull-8">
                                        <!-- Search -->
                                        <div class="well">
                                            <h4 class="margin-t-0">Search</h4>
                                            <form action="#">
                                                <div class="input-group">
                                                    <label class="sr-only" for="search-form">Search the site</label>
                                                    <input type="text" class="form-control" id="search-form">
                                                        <span class="input-group-btn">
                                                            <button class="btn btn-default" type="button">
                                                                <span class="glyphicon glyphicon-search"></span>
                                                                <span class="sr-only">Search</span>
                                                            </button>
                                                        </span>
                                                        </div>
                                            </form>
                                        </div>
                                        
                                        <!-- list group -->
                                        
                                        
                                        <!-- Panel -->
                                        <div class="panel panel-default" style="
                                            overflow: hidden;">
                                            
                                            <div class="container" style="
                                                ">
                                                <div class=" profile" style="
                                                    max-width: 100%;">
                                                    <div class="col-md-4">
                                                        <div class="profile-sidebar">
                                                            <!-- SIDEBAR USERPIC -->
                                                            
                                                            <!-- END SIDEBAR USERPIC -->
                                                            <!-- SIDEBAR USER TITLE -->
                                                            <div class="profile-usertitle" style="
                                                                margin: auto;margin-right: 47px;">
                                                                <div class="profile-usertitle-name">
                                                                    ${Myuser.nom }&nbsp;${Myuser.prenom}
                                                                </div>
                                                                <div class="profile-usertitle-job" style="
                                                                    margin-bottom: 1px;">
                                                                    User
                                                                </div>
                                                                <div style="
                                                                    color: #686F7A;display: block;
                                                                    overflow: hidden;
                                                                    text-overflow: ellipsis;
                                                                    white-space: nowrap;
                                                                    line-height: 1.43;opacity: 0.7;">
                                                                    ${Myuser.email}
                                                                </div>
                                                            </div>
                                                            <!-- END SIDEBAR USER TITLE -->
                                                            <!-- SIDEBAR BUTTONS -->
                                                            
                                                            <!-- END SIDEBAR BUTTONS -->
                                                            <!-- SIDEBAR MENU -->
                                                            <div class="profile-usermenu">
                                                                <ul class="nav">
                                                                    <li class="active">
                                                                        <a href="#">
                                                                            <i class="glyphicon glyphicon-home"></i>
                                                                            Overview </a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="Editincription.jsp">
                                                                            <i class="glyphicon glyphicon-user"></i>
                                                                            Account Settings </a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="Editincription.jsp">
                                                                            <i class="glyphicon glyphicon-log-out"></i>
                                                                            Disconnect </a>
                                                                    </li>
                                                                    <!-- <li>
                                                                        <a href="#" target="_blank">
                                                                            <i class="glyphicon glyphicon-ok"></i>
                                                                            Tasks </a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="#">
                                                                            <i class="glyphicon glyphicon-flag"></i>
                                                                            Help </a>
                                                                    </li> -->
                                                                </ul>
                                                            </div>
                                                            <!-- END MENU -->
                                                        </div>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                            
                                            <br>
                                            <br>
                                        </div>
                                        
                                        <!-- Panel -->
                                        
                                        
                                    </div>
                                </div>
                                <!-- /.row -->
                                
                                
                                
                                <!-- JQuery scripts -->
                                
                                
                                
                                
                                
                            </div>
                            
                            
                            
        </body></html>
