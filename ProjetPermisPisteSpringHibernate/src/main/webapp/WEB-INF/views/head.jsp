<%-- <%@ page contentType="text/html; charset=UTF-8"%> --%>
<%-- <%@ page pageEncoding="UTF-8"%> --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- 		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> -->
		<title>${title}</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
  		<meta name="description" content="">
  		<meta name="author" content="">
		<link rel="stylesheet" href="resources/css/style.css" />
		<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<!-- 		<link rel="shortcut icon" href="resources/images/favicon.jpg"> -->
		 
		<script type="text/javascript" src="resources/js/jquery.min.js"></script>
		<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>	
		<script type="text/javascript" src="resources/js/main.js"></script>
<!-- 		<script type="text/javascript" src="resources/js/js_verification.js"></script> -->

<script language="JavaScript">
      function checkAll(field)
      {
          for (i=0; i < field.length; i++)
          {   field[i].checked = true; }
      }
      function Chargement()
      {
          var obj = document.getElementById("id_erreur");
          if (obj.value!='')
             alert('Erreur signalée  : "'+obj.value+"'");
      }
  </script>
</head>
 

<!-- <body onLoad="Chargement();" style="padding-bottom : 75px;"> -->
<body style="padding-bottom : 75px;">
	<nav class="navbar navbar-default navbar-inverse">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
<!--       <a class="navbar-brand" href="Accueil" style="padding : 2px 15px 2px 4px;"><img src="resources/images/favicon.jpg" height="55px" width="50px" class="img-thumbnail" alt="Gestion Stage"></a> -->
    <a class="navbar-brand" href="index.htm">Accueil</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="dropdown" id="Action">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
					Actions<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="afficherAction.htm">Afficher une action</a></li>
						<li><a href="listeActions.htm">Afficher toutes les actions</a></li>
						<li><a href="afficherApprenant.htm">Afficher un apprenant</a></li>
					</ul>
					</li>
					
					<li class="dropdown" id="Apprenant">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
					Apprenants<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
<!-- 						<li><a href="listeApprenants.htm">Afficher les apprenants</a></li> -->
						<li><a href="ajoutApprenant.htm">Ajouter un apprenant</a></li>
					</ul>
					</li>
					
			</ul>
		</div><!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->
</nav>

<input type ="hidden" name="uneErreur"  value="${MesErreurs}"  id ="id_erreur" >






<c:if test="${not empty messageSuccess}">
<div class="alert alert-success alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <p>${messageSuccess}</p>
</div>
</c:if>

<c:if test="${not empty messageInfo}">
<div class="alert alert-info alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <p>${messageInfo}</p>
</div>
</c:if>

<c:if test="${not empty messageWarning}">
<div class="alert alert-warning alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <p>${messageWarning}</p>
</div>
</c:if>

<c:if test="${not empty messageDanger}">
<div class="alert alert-danger alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <p>${messageDanger}</p>
</div>
</c:if>




<script> 
$( document ).ready(function() {
	// met l'onglet courrant de la barre head en gras
    if(window.location.pathname.indexOf("Action") >= 0){
        $('.dropdown#Action > a').attr('style', "font-weight: bold; font-size: 1.3em;"); 
        }
});
</script>

<footer>
    <div class="navbar navbar-inverse navbar-fixed-bottom">
        <div class="container" style="color : white; text-align: center;">
            Créé par : Jéremy DeSousa, Marc-Antoine Sayn-Urpar, Sébastien Duret et Quentin Dégrange
        </div>
    </div>
</footer>
