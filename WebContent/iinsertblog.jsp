<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
    
<%@page import="controlServlets.Blog,controlServlets.Commentaire,java.util.List,controlServlets.Utilisateur,java.util.*" %>
<%@ page errorPage="ifError.jsp" %>
<%
    Blog myBlog = (Blog)request.getAttribute("blog");
    List<Commentaire> ListC = (List<Commentaire>) request.getAttribute("comments");
    int idblogbyrequest =(int)request.getSession().getAttribute("id");
    
    Utilisateur us = (Utilisateur) request.getSession(false).getAttribute("Myuser");
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

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
        
    <link rel="stylesheet" href="css\notification.css">
            
    <link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <title></title>
    <script src="js/jquery-1.11.2.min.js"></script>
    <script src="js/jquery-ui.js"></script>
    <link rel="stylesheet" href="https://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lora">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
    <link rel="stylesheet" href="assets/css/styles.min.css">
	<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">

	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main2.css">
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
            <a href="Editincription.jsp">
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
                <a id="header_link_img" href="#"><img id="web-logo" src="image/49705989_2292097084158504_2734803752664956928_n.png"> </a>
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
                                AH
                            </span></div>
                        
                        <div class="drop_menu   user_drop">
                            
                            <a>
                                <div id="main_drop_data_user" class="list_div hover_back">
                                    <div id="div_abr_name">
                                        <span id="span_abr_name" class="button_name">
                                            <%= us.getNom().charAt(0)+us.getPrenom().charAt(0) %>
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
                                        <%= us.getNom().charAt(0)+us.getPrenom().charAt(0) %>
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
                        <a href="Editincription.jsp">
                            <div class="list_div hover_back">
                                <span class="ion-gear-a drop_menu_ico">
                                </span>
                                <span class=" botton_name name_option_drop">
                                    Parametre
                                </span>
                                
                            </div>
                        </a>
                        <a href="simpleProjectJEE/LogoutS">
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

    
<div class="contact-clean">
        <form method="post" class="contact2-form validate-form">
            <h2 class="text-center">New Blog</h2>
				<div class="wrap-input2 validate-input" data-validate="Titre is required">
					<input class="input2" type="text" name="name">
					<span class="focus-input2" data-placeholder="TITRE"></span>
				</div>

				<div class="wrap-input2 validate-input" data-validate = "Introduction is required">
					<input class="input2" type="text" name="email">
					<span class="focus-input2" data-placeholder="INTRODUCTION"></span>
				</div>

				<div class="wrap-input2 validate-input" data-validate = "Blog is required">
					<textarea class="input2" name="message"></textarea>
					<span class="focus-input2" data-placeholder="BLOG"></span>
				</div>
            <div class="form-group"><button class="btn btn-primary" type="submit">Add Blog </button></div>
        </form>
    </div>
    
    
	<script src="js/menu.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'UA-23581568-13');
	</script>   
</body></html>
