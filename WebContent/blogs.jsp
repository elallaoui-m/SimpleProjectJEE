<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="controlServlets.ImpBlog,controlServlets.Blog,java.util.List" %>
<%
	List<Blog> lst = (List<Blog>) request.getAttribute("lstBlog");
%>


<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>simpleProject</title>
	
<link rel="stylesheet" href="https://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lora">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
    <link rel="stylesheet" href="assets/css/styles.min2.css">
</head>

<body>
    <div></div>
    <div>
        <div class="header-blue">
            <nav class="navbar navbar-light navbar-expand-md navigation-clean-search">
                <div class="container"><a class="navbar-brand" href="#">Espace Etudiants</a>
                    <div class="collapse navbar-collapse"
                        id="navcol-1">
                        <ul class="nav navbar-nav">
                            <li class="nav-item" role="presentation"><a class="nav-link text-light active" href="#">Home</a></li>
                            <li class="nav-item" role="presentation"><a class="nav-link text-light" href="#">About</a></li>
                            <li class="nav-item" role="presentation"><a class="nav-link text-light" href="#">Contact</a></li>
                        </ul>
                        <form class="form-inline mr-auto" target="_self">
                            <div class="form-group" style="background-color:#4d87a0;padding-left:10px;border-radius:10px"><label for="search-field"><i class="fa fa-search"> </i></label><input class="form-control search-field" type="search" name="search" autocomplete="on" id="search-field"></div>
                        </form><span class="navbar-text actions"> <a href="#" class="login">Log In</a><a class="btn btn-light action-button" role="button" href="#">Sign Up</a></span></div>
                </div>
            </nav>
            <div class="container hero">
                <div class="row no-gutters" style="width:auto;font-size:24px;text-align:center">
                    <div class="" style="width:1200px;margin:auto"><em class="text-light">Vous avez des questions n'ont pas encore des reponses ? Ici! La meilleure place<br>Posez vos questions et attendez des meilleures réponses :)</em></div>
                </div>
            </div>
        </div>
    </div>
    <div>
        <div class="container">
            <div class="row">

        <!-- Blog Entries Column -->
        <div class="col-md-8">

          <h1 class="my-4">All Questions
            <small>Nouveaux</small>
          </h1>

          <!-- Blog Post -->
          <% 
	          	/*ImpBlog blog = new ImpBlog();
	      		List<Blog> blogs = new ArrayList<Blog>();
	      		blogs = blog.ShowAllBlog();*/
	      		
	      		//Article blog = new Article();
	      		
	      		
	      		
	          	for (Blog b : lst) {
	          	
          	%>
          <div class="card mb-4">
            
            <div class="card-body">
              <h2 class="card-title"><%= b.getTitre() %></h2>
              <p class="card-text"><%= b.getIntro() %></p>
              <a href=<%="/SimpleProjectJEE/InvocBlogS?idblog="+b.getIdBlog() %> class="btn btn-primary">Read More &rarr;</a>
            </div>
            <div class="card-footer text-muted">
              Posted on <%= b.getDateBlog() %>
              <a><%=b.getUtilisateur().getNom() %></a>
            </div>
          </div>

         <% } %>

          <!-- Pagination -->
			<div class="row column">
				<ul class="pagination" role="navigation" aria-label="Pagination">
				<li class="disabled">Previous</li>
				<li class="current"><span class="show-for-sr">You're on page</span> 1</li>
				<li><a href="#" aria-label="Page 2">2</a></li>
				<li><a href="#" aria-label="Page 3">3</a></li>
				<li><a href="#" aria-label="Page 4">4</a></li>
				<li class="ellipsis"></li>
				<li><a href="#" aria-label="Page 12">12</a></li>
				<li><a href="#" aria-label="Page 13">13</a></li>
				<li><a href="#" aria-label="Next page">Next</a></li>
				</ul>
			</div>

        </div>

        <!-- Sidebar Widgets Column -->
        <div class="col-md-4">

          <!-- Search Widget -->
          

          <!-- Categories Widget -->
          <div class="card my-4">
            <h5 class="card-header">Categories</h5>
            <div class="card-body">
              <div class="row">
                <div class="col-lg-6">
                  <ul class="list-unstyled mb-0">
                    <li>
                      <a href="#">Web Design</a>
                    </li>
                    <li>
                      <a href="#">HTML</a>
                    </li>
                    <li>
                      <a href="#">Freebies</a>
                    </li>
                  </ul>
                </div>
                <div class="col-lg-6">
                  <ul class="list-unstyled mb-0">
                    <li>
                      <a href="#">JavaScript</a>
                    </li>
                    <li>
                      <a href="#">CSS</a>
                    </li>
                    <li>
                      <a href="#">Tutorials</a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>

          <!-- Side Widget -->
          <div class="card my-4">
            <h5 class="card-header">Side Widget</h5>
            <div class="card-body">
              You can put anything you want inside of these side widgets. They are easy to use, and feature the new Bootstrap 4 card containers!
            </div>
          </div>

        </div>
        </div>
    </div>
    <div class="article-clean"></div>
    <div></div>
    <div></div>
    <div class="footer-dark">
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col item social">
                        <ul class="list-inline float-none justify-content-center align-items-center align-content-center">
                            <li class="list-inline-item"><a href="#">Home</a></li>
                            <li class="list-inline-item"><a href="#">About</a></li>
                            <li class="list-inline-item"><a href="#">Contact</a></li>
                        </ul>
                    </div>
                    <div class="col item social"><a href="#"><i class="icon ion-social-facebook"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-instagram"></i></a></div>
                </div>
                <p class="copyright">ADEOZE Copyright © 2019</p>
            </div>
        </footer>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
</body>

