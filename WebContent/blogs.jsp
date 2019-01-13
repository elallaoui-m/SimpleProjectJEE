<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="controlServlets.ImpBlog,controlServlets.Utilisateur,controlServlets.Blog,java.util.List" %>
<%@ page errorPage="ifError.jsp" %>
<%
    List<Blog> lst = (List<Blog>) request.getAttribute("lstBlog");
	Utilisateur us = (Utilisateur) request.getSession().getAttribute("Myuser");
	if(us == null || us.getEmail()==null)
	{
		response.sendRedirect("error.jsp");
		System.out.println("error");
	}
	
	Random rand = new Random();
	int n = rand.nextInt(11);
	int m = rand.nextInt(11);
	int l = rand.nextInt(11);
%>


<fmt:setLocale value = "en"/>
<fmt:setBundle basename = "ressources.message" />

<!DOCTYPE html>
<html lang="en"><head>
    <meta charset="UTF-8">
        
        <link rel="stylesheet" href="css\notification.css">
        <style type="text/css">
        
        	.isDisabled {
  			color: currentColor;
  			cursor: not-allowed;
  			opacity: 0.5;
  			text-decoration: none;
			}
        
        </style>
            
            <link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
            <link rel="stylesheet" href="https://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
            <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lora">
            <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
            <link rel="stylesheet" href="assets/css/styles.min2.css">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
                <title>AskSa</title>
                <script src="js/jquery-1.11.2.min.js"></script>
                <script src="js/jquery-ui.js"></script>
                </head>
<body>
    <div id="popup" style="display: block;">
        
        <div id="container_popup_menu" style="display: block;">
            
            <div id="about_user">
                <div onclick="hide_slid_menu()" id="close_icon">
                    <p>
                    X
                    </p>
                </div>
                <div id="container_of_data">
                    
                    <span id="name_user_pop" class="botton_name"><%=us.getNom()+" "+us.getPrenom() %></span>
                    <span id="e-mail_pop" class="botton_name"><%=us.getEmail() %></span>
                </div>
            </div>
            <div id="container_sub">
                
                <div id="parent_sub" onclick="show_sub_menu()" class="slid_menu_list hover_back ">
                    <span class="ion-grid drop_menu_ico">
                    </span>
                    <span class=" botton_name name_option_drop">
                        Pages
                    </span>
                    
                    <b class="button_for_cat_slid">
                    </b>
                </div>
                <div id="sub_menu">
                    <a href="accueil.php">
                        <div class="items_sub hover_back ">
                            <span class="ion-android-contacts drop_menu_ico">
                            </span>
                            <span class=" botton_name name_option_drop">
                                Accueil
                            </span>
                        </div>
                    </a><a href="georefer.php"><div class="items_sub hover_back ">
                        <span class="ion-android-contacts drop_menu_ico">
                        </span>
                        <span class=" botton_name name_option_drop">
                            Projet
                        </span>
                    </div></a>
                </div>
            </div>
            <a>
                <div class="list_div hover_back ico_1000_drop">
                    <span class="ion-ios-bell drop_menu_ico">
                    </span>
                    <span class=" botton_name name_option_drop">
                        Notification
                    </span>
                    <div class="drop_number_data">
                        <%=n %>
                    </div>
                </div>
            </a>
            <a>
                <div class="list_div hover_back ico_1000_drop">
                    <span class="ion-heart drop_menu_ico">
                    </span>
                    <span class=" botton_name name_option_drop">
                        Favoris
                    </span>
                    <div class="drop_number_data">
                        <%=m %>
                    </div>
                </div>
            </a>
            
            <a>
                <div class="list_div hover_back ico_1000_drop">
                    <span class="ion-chatboxes drop_menu_ico">
                    </span>
                    <span class=" botton_name name_option_drop">
                        Messages
                    </span>
                    <div class="drop_number_data">
                        <%=l %>
                    </div>
                </div>
            </a><a>
                <div class="list_div hover_back ico_1000_drop">
                    <span class="ion-chatboxes drop_menu_ico" style="color: #f71a1a;;">
                    </span>
                    <span class=" botton_name name_option_drop">
                        Admin Messages
                    </span>
                    
                </div>
            </a>
            <a >
                <div class="list_div hover_back">
                    <span class="ion-help-circled drop_menu_ico">
                    </span>
                    <span class=" botton_name name_option_drop">
                        Aide
                    </span>
                </div>
            </a>
            <a>
                <div id="link_contact_drop" class="list_div hover_back ">
                    <span class="ion-android-contacts drop_menu_ico">
                    </span>
                    <span class=" botton_name name_option_drop">
                        Contact
                    </span>
                </div>
            </a>
            <a href="Editincription.jsp" <%if(us.getVerify().equals("yesG")) out.print("class='isDisabled'"); %>>
                <div class="list_div hover_back">
                    <span class="ion-gear-a drop_menu_ico">
                    </span>
                    <span class=" botton_name name_option_drop">
                        Parametre
                    </span>
                    
                </div>
            </a>
            <a href="/SimpleProjectJEE/LogoutS">
                <div class="list_div hover_back">
                    <span class="ion-power drop_menu_ico">
                    </span>
                    <span class=" botton_name name_option_drop">
                        Logout
                    </span>
                    
                </div>
            </a>
            
            
        </div>
    </div>
    
    <div id="header_menu">
        <div id="header_menu_center">
            <div onclick="show_slid_menu()" id="div_small_menu">
                <div class="icon_drop hover_back">
                    <div class="icon_div">
                        <span class="ion-navicon span_icon">
                        </span>
                        
                    </div>
                    
                </div>
            </div>
            <div id="header_logo-container">
                <a id="header_link_img" href="HomePageS"><img id="web-logo" src="image/49705989_2292097084158504_2734803752664956928_n.png"> </a>
            </div>
            <div id="header_left" class="sides_div">
                <div class="dropbutton for_display_drop">
                    <div class="child_container hover_back">
                        <div class="botton">
                            <span id="logo_item" class="ion-grid logo_item">
                            </span>
                            <div class="botton_name">Pages</div>
                        </div>
                    </div>
                    <div class="drop_menu" id="first_drop">
                        <a href="/SimpleProjectJEE/HomePageS">
                            <div class="list_div hover_back">
                                <span class="ion-home drop_menu_ico">
                                </span>
                                <span class=" botton_name name_option_drop">
                                    Accueil
                                </span>
                                
                            </div>
                        </a>
                        <!-- <a href="georefer.php">
                            <div class="list_div hover_back">
                                <span class="ion-code drop_menu_ico">
                                </span>
                                <span class=" botton_name name_option_drop">
                                    Projet
                                </span>
                                
                            </div>
                        </a> -->
                        
                        <div class="triangle">
                        </div>
                    </div>
                </div>
                <div id="main_div_for_search">
                    <div class="search_div">
                        <div class="height100">
                            <form class="height100 searchbox">
                                <div id="" class="width100 form_div">
                                    <span class="height100 width100 span_form" id="">
                                        <input id="" class="input_s" type="text" name="menusearch" autocomplete="off" maxlength="200" placeholder="Search...">
                                            <span id="" class="sp-btn">
                                                <button type="submit" id="" class="ion-search btn-search"></button>
                                            </span>
                                            </span>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                
                
            </div>
            <div id="header_right">
                <div id="link_contact" class="dropbutton">
                    <div class="child_container hover_back">
                        <div class="botton">
                            <span id="logo_item" class="ion-android-contacts logo_item">
                            </span>
                            <div class="botton_name">Contact
                            </div>
                        </div>
                    </div>
                </div>
                <div class="icon_drop hover_back ico_1000 for_display_drop">
                    <div class="icon_div">
                        <span class="ion-ios-bell-outline span_icon">
                        </span>
                        <div class="number_of_data">
                            <%=n %>
                        </div>
                    </div>
                    <div class="drop_menu drop_for_icon" id="first_drop_icon">
                        <div class="triangle triangle_for_ico">
                        </div>
                    </div>
                </div>
                <div class="icon_drop hover_back ico_1000 for_display_drop">
                    <div class="icon_div">
                        <span class="ion-ios-chatbubble-outline span_icon">
                        </span>
                        <div class="number_of_data">
                            <%=n %>
                        </div>
                    </div>
                    <div class="drop_menu  drop_for_icon">
                        <div class="triangle triangle_for_ico">
                        </div>
                    </div>
                </div>
                <div class="icon_drop hover_back  ico_1000 for_display_drop">
                    <div class="icon_div" id="logo_favorites">
                        <span class="ion-ios-heart-outline span_icon">
                        </span>
                        <div class="number_of_data">
                            <%=n %>
                        </div>
                    </div>
                    <div class="drop_menu  drop_for_icon favoris_drop">
                        <div class="triangle triangle_favoris triangle_for_ico">
                        </div>
                    </div>
                </div>
                <div id="img_user_div" class="for_display_drop">
                    
                    <div id="img_user_div" class="for_display_drop">
                        
                        <div style="
                            width: 50px;
                            height: 50px;
                            border-radius: 50%;
                            border: 1px #f2f3f5 solid;display: flex;justify-content: center;align-content: center;"><span class="button_name" style="
                                display: flex;align-items: center;">
                                <%= us.getNom().substring(0,1).toUpperCase()+us.getPrenom().substring(0,1).toUpperCase() %>
                            </span></div>
                        
                        <div class="drop_menu   user_drop">
                            
                            <a>
                                <div id="main_drop_data_user" class="list_div hover_back">
                                    <div id="div_abr_name">
                                        <span id="span_abr_name" class="button_name">
                                            <%= us.getNom().substring(0,1).toUpperCase()+us.getPrenom().substring(0,1).toUpperCase() %>
                                        </span>
                                    </div>
                                    <div>
                                        <span id="name_user" class="botton_name">
                                            <%= us.getNom()+" "+us.getPrenom() %>
                                        </span>
                                        <span id="user_e-mail" class="botton_name">
                                           <%= us.getEmail() %>
                                        </span>
                                    </div>
                                </div>
                            </a>
                            <a>
                                <div class="list_div hover_back ico_1000_drop">
                                    <span class="ion-ios-bell drop_menu_ico">
                                    </span>
                                    <span class=" botton_name name_option_drop">
                                        Notification
                                    </span>
                                    <div class="drop_number_data">
                                        <%=n %>
                                    </div>
                                </div>
                            </a>
                            <a>
                                <div class="list_div hover_back ico_1000_drop">
                                    <span class="ion-heart drop_menu_ico">
                                    </span>
                                    <span class=" botton_name name_option_drop">
                                        Favoris
                                    </span>
                                    <div class="drop_number_data">
                                        <%=l %>
                                    </div>
                                </div>
                            </a>
                            <a>
                                <div class="list_div hover_back ico_1000_drop">
                                    <span class="ion-chatboxes drop_menu_ico">
                                    </span>
                                    <span class=" botton_name name_option_drop">
                                        Messages
                                    </span>
                                    <div class="drop_number_data">
                                        <%=m %>
                                    </div>
                                </div>
                            </a>
                            <a>
                                <div class="list_div hover_back ico_1000_drop">
                                    <span class="ion-chatboxes drop_menu_ico" style="color: #f71a1a;;">
                                    </span>
                                    <span class=" botton_name name_option_drop" >
                                        Admin messages
                                    </span>
                                    <div class="drop_number_data">
                                        <%=m %>
                                    </div>
                                </div>
                            </a>
                            <a>
                                <div class="list_div hover_back">
                                    <span class="ion-help-circled drop_menu_ico">
                                    </span>
                                    <span class=" botton_name name_option_drop">
                                        Aide
                                    </span>
                                </div>
                            </a>
                            <a href="contact.jsp">
                                <div id="link_contact_drop" class="list_div hover_back ">
                                    <span class="ion-android-contacts drop_menu_ico">
                                    </span>
                                    <span class=" botton_name name_option_drop">
                                        Contact
                                    </span>
                                </div>
                            </a>
                            <a href="Editicription.jsp">
                                <div class="list_div hover_back">
                                    <span class="ion-gear-a drop_menu_ico">
                                    </span>
                                    <span class=" botton_name name_option_drop">
                                        Parametre
                                    </span>
                                    
                                </div>
                            </a>
                            <a href="/SimpleProjectJEE/LogoutS">
                                <div class="list_div hover_back">
                                    <span class="ion-power drop_menu_ico">
                                    </span>
                                    <span class=" botton_name name_option_drop">
                                        Logout
                                    </span>
                                    
                                </div>
                            </a>
                            
                            
                            <div class="triangle  triangle_user">
                            </div>
                        </div>
                    </div>
                    
                    <div class="drop_menu   user_drop">
                        
                        <a>
                            <div id="main_drop_data_user" class="list_div hover_back">
                                <div id="div_abr_name">
                                    <span id="span_abr_name" class="button_name">
                                        <%= us.getNom().substring(0,1).toUpperCase()+us.getPrenom().substring(0,1).toUpperCase() %>
                                    </span>
                                </div>
                                <div>
                                    <span id="name_user" class="botton_name">
                                        <%= us.getNom()+" "+us.getPrenom() %>
                                    </span>
                                    <span id="user_e-mail" class="botton_name">
                                        <%= us.getEmail() %>
                                    </span>
                                </div>
                            </div>
                        </a>
                        <a>
                            <div class="list_div hover_back ico_1000_drop">
                                <span class="ion-ios-bell drop_menu_ico">
                                </span>
                                <span class=" botton_name name_option_drop">
                                    Notification
                                </span>
                                <div class="drop_number_data">
                                    <%=n%>
                                </div>
                            </div>
                        </a>
                        <a>
                            <div class="list_div hover_back ico_1000_drop">
                                <span class="ion-heart drop_menu_ico">
                                </span>
                                <span class=" botton_name name_option_drop">
                                    Favoris
                                </span>
                                <div class="drop_number_data">
                                    <%=m%>
                                </div>
                            </div>
                        </a>
                        <a>
                            <div class="list_div hover_back ico_1000_drop">
                                <span class="ion-chatboxes drop_menu_ico">
                                </span>
                                <span class=" botton_name name_option_drop">
                                    Messages
                                </span>
                                <div class="drop_number_data">
                                    <%=l%>
                                </div>
                            </div>
                        </a>
                        <a>
                            <div class="list_div hover_back">
                                <span class="ion-help-circled drop_menu_ico">
                                </span>
                                <span class=" botton_name name_option_drop">
                                    Aide
                                </span>
                            </div>
                        </a>
                        <a href="contact.jsp">
                            <div id="link_contact_drop" class="list_div hover_back ">
                                <span class="ion-android-contacts drop_menu_ico">
                                </span>
                                <span class=" botton_name name_option_drop">
                                    Contact
                                </span>
                            </div>
                        </a>
                        <a href="Editincription.jsp" <%if(us.getVerify().equals("yesG")) out.print("class='isDisabled'"); %>>
                            <div class="list_div hover_back">
                                <span class="ion-gear-a drop_menu_ico">
                                </span>
                                <span class=" botton_name name_option_drop">
                                    Parametre
                                </span>
                                
                            </div>
                        </a>
                        <a href="/SimpleProjectJEE/LogoutS">
                            <div class="list_div hover_back">
                                <span class="ion-power drop_menu_ico">
                                </span>
                                <span class=" botton_name name_option_drop">
                                    Logout
                                </span>
                                
                            </div>
                        </a>
                        
                        
                        <div class="triangle  triangle_user">
                        </div>
                    </div>
                </div>
                <div id="small_screen_search" onclick="toggle_effect('#under_menu')" class="icon_drop hover_back">
                    <div class="icon_div">
                        <span class="ion-search span_icon">
                        </span>
                        
                    </div>
                    
                </div>
            </div>
        </div>
        <div id="under_menu">
            <div id="main_div_small_search">
                <div class="search_div">
                    <div class="height100">
                        <form class="height100 searchbox">
                            <div id="" class="width100 form_div">
                                <span class="height100 width100 span_form" id="">
                                    <input id="" class="input_s" type="text" name="menusearch" autocomplete="off" maxlength="200" placeholder="Search...">
                                        <span id="" class="sp-btn">
                                            <button type="submit" id="" class="ion-search btn-search"></button>
                                        </span>
                                        </span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            
        </div>
    </div>

   
    
    
        <div class="container">
            <div class="row">

        <!-- Blog Entries Column -->
        <div class="col-md-8">

          <h1 class="my-4"><fmt:message key = "message.allQuestion"/>
            <small><a href="insertblog.jsp"><fmt:message key = "message.new"/></a></small>
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
              
              <%
                if(b.getUtilisateur().getIdEtudiant() == ((Utilisateur)(request.getSession().getAttribute("Myuser"))).getIdEtudiant()  )
                {
                	
                
              %>
              <a href=<%="Editblog.jsp?idB="+b.getIdBlog() %>>
                <i class="fa fa-edit"></i>
              Edit </a>
              <a href=<%="DeleteBlogS?idB="+b.getIdBlog() %>>
              <i class="fa fa-trash"></i>
              Delete </a>
              
              <% }%>
              
            </div>
          </div>

         <% } %>

          <!-- Pagination -->
            <div class="row column">
                <%-- <ul class="pagination" role="navigation" aria-label="Pagination">
                <li class="disabled"><fmt:message key = "message.preview"/></li>
                <li class="current"><span class="show-for-sr">You're on page</span> 1</li>
                <li><a href="#" aria-label="Page 2">2</a></li>
                <li><a href="#" aria-label="Page 3">3</a></li>
                <li><a href="#" aria-label="Page 4">4</a></li>
                <li class="ellipsis"></li>
                <li><a href="#" aria-label="Page 12">12</a></li>
                <li><a href="#" aria-label="Page 13">13</a></li>
                <li><a href="#" aria-label="Next page"><fmt:message key = "message.next"/></a></li>
                </ul> --%>


        <!-- Sidebar Widgets Column -->
        <div class="col-md-4">

          <!-- Search Widget -->
          

          <!-- Categories Widget -->
          <!-- <div class="card my-4">
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
          </div> -->

          <!-- Side Widget -->
          <!-- <div class="card my-4">
            <h5 class="card-header">Side Widget</h5>
            <div class="card-body">
              You can put anything you want inside of these side widgets. They are easy to use, and feature the new Bootstrap 4 card containers!
            </div>
          </div> -->

        </div>
        </div>
    </div>
    <div class="article-clean"></div>
    <div></div>
    <div></div>
    <!-- <div class="footer-dark">
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
                <p class="copyright">ASKSA Copyright © 2019</p>
            </div>
        </footer>
    </div> -->






    <script src="js/menu.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>

    
    
    
    
    
</body></html>
