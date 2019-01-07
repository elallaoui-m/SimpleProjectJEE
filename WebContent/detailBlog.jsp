<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
    
<%@page import="controlServlets.Blog,controlServlets.Commentaire,java.util.List,controlServlets.Utilisateur" %>
<%@ page errorPage="ifError.jsp" %>
<%
    Blog myBlog = (Blog)request.getAttribute("blog");
    List<Commentaire> ListC = (List<Commentaire>) request.getAttribute("comments");
    int idblogbyrequest =(int)request.getSession().getAttribute("id");
%>

<!DOCTYPE html>
<html lang="en"><head>
    <meta charset="UTF-8">
        
        <link rel="stylesheet" href="css\notification.css">
            
            <link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
            <link rel="apple-touch-icon" href="assets/img/apple-touch-icon.png">
            <link rel="shortcut icon" href="favicon.ico">
                    
                    <!-- Bootstrap Core CSS file -->
                    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
                        
                        <!-- Override CSS file - add your own CSS rules -->
                        <link rel="stylesheet" href="assets/css/styles.css">
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
                    
                    <span id="name_user_pop" class="botton_name">Aourass Hamza</span>
                    <span id="e-mail_pop" class="botton_name">hamza199738@gmail.com</span>
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
                        +99
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
                        +99
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
                        +99
                    </div>
                </div>
            </a><a>
                <div class="list_div hover_back ico_1000_drop">
                    <span class="ion-chatboxes drop_menu_ico" style="
                        color: #f71a1a;;">
                    </span>
                    <span class=" botton_name name_option_drop">
                        Admin Messages
                    </span>
                    
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
            <a>
                <div id="link_contact_drop" class="list_div hover_back ">
                    <span class="ion-android-contacts drop_menu_ico">
                    </span>
                    <span class=" botton_name name_option_drop">
                        Contact
                    </span>
                </div>
            </a>
            <a>
                <div class="list_div hover_back">
                    <span class="ion-gear-a drop_menu_ico">
                    </span>
                    <span class=" botton_name name_option_drop">
                        Parametre
                    </span>
                    
                </div>
            </a>
            <a>
                <div class="list_div hover_back">
                    <span class="ion-power drop_menu_ico">
                    </span>
                    <span class=" botton_name name_option_drop">
                        Se déconnecter
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
                        <a href="accueil.php">
                            <div class="list_div hover_back">
                                <span class="ion-home drop_menu_ico">
                                </span>
                                <span class=" botton_name name_option_drop">
                                    Accueil
                                </span>
                                
                            </div>
                        </a>
                        <a href="georefer.php">
                            <div class="list_div hover_back">
                                <span class="ion-code drop_menu_ico">
                                </span>
                                <span class=" botton_name name_option_drop">
                                    Projet
                                </span>
                                
                            </div>
                        </a>
                        
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
                            +99
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
                            +99
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
                            +99
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
                                            AH
                                        </span>
                                    </div>
                                    <div>
                                        <span id="name_user" class="botton_name">
                                            Aourass Hamza
                                        </span>
                                        <span id="user_e-mail" class="botton_name">
                                            hamza199738@gmail.com
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
                                        +99
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
                                        +99
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
                                        +99
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
                            <a>
                                <div id="link_contact_drop" class="list_div hover_back ">
                                    <span class="ion-android-contacts drop_menu_ico">
                                    </span>
                                    <span class=" botton_name name_option_drop">
                                        Contact
                                    </span>
                                </div>
                            </a>
                            <a>
                                <div class="list_div hover_back">
                                    <span class="ion-gear-a drop_menu_ico">
                                    </span>
                                    <span class=" botton_name name_option_drop">
                                        Parametre
                                    </span>
                                    
                                </div>
                            </a>
                            <a>
                                <div class="list_div hover_back">
                                    <span class="ion-power drop_menu_ico">
                                    </span>
                                    <span class=" botton_name name_option_drop">
                                        Se déconnecter
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
                                        AH
                                    </span>
                                </div>
                                <div>
                                    <span id="name_user" class="botton_name">
                                        Aourass Hamza
                                    </span>
                                    <span id="user_e-mail" class="botton_name">
                                        hamza199738@gmail.com
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
                                    +99
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
                                    +99
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
                                    +99
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
                        <a>
                            <div id="link_contact_drop" class="list_div hover_back ">
                                <span class="ion-android-contacts drop_menu_ico">
                                </span>
                                <span class=" botton_name name_option_drop">
                                    Contact
                                </span>
                            </div>
                        </a>
                        <a>
                            <div class="list_div hover_back">
                                <span class="ion-gear-a drop_menu_ico">
                                </span>
                                <span class=" botton_name name_option_drop">
                                    Parametre
                                </span>
                                
                            </div>
                        </a>
                        <a>
                            <div class="list_div hover_back">
                                <span class="ion-power drop_menu_ico">
                                </span>
                                <span class=" botton_name name_option_drop">
                                    Se déconnecter
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
  
    
    <script src="js/menu.js"></script>
    <script>
        
        </script>
    
    
    
    
    
    
</body></html>
