<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<title>Admin Page</title>
<body background="C:\Users\majjipoojihta\Desktop\dha3\s8.jpg" ng-app="myApp">
</head>
<body ng-app="myApp">
<h3><centre><font color=green>Online Bazaar</font></centre></h3>
${message}
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <!-- --<a class="navbar-brand" href="#"><img alt="logo" src="D:\images\R1.jpg" width="35" height="35"></a>-->
    </div>
    <ul class="nav navbar-nav">
     <!-- <i class="fa fa-opencart" aria-hidden="true"></i> Online Bazaar</a> -->
          <a class="navbar-brand" style="font-size:15px;"><span class="glyphicon glyphicon-user"></span> WELCOME ADMIN </a>
       <li><a class="active" href="Supplier">Supplier</a></li>
      <li><a href="Product">Product</a></li>
      <li><a href="Category">Category</a></li>
       
    </ul>
    <ul class="nav navbar-nav navbar-right" style="margin-bottom:-2px;"> 
       <!-- <li><a href="Home">CONTACT US</a></li> -->  
	  <li><a href="perform_logout">LOGOUT</a></li>

					  
   </ul>
  </div>
</nav>
${msg}
${msg1 }
<h1>welcome tanuja </h1>

<c:choose>
<c:when test="${UserClickedsuppliers}">
<c:import url="/WEB-INF/jspviews/supplier.jsp"></c:import>
</c:when>
</c:choose>

<c:choose>
<c:when test="${UserClickedProducts}">
<c:import url="/WEB-INF/jspviews/product.jsp"></c:import>
</c:when>
</c:choose> 
<c:choose>
<c:when test="${UserClickedCategorys}">
<c:import url="/WEB-INF/jspviews/category.jsp"></c:import>
</c:when>
</c:choose>
<%-- <c:choose>
<c:when test="${UserClickedContactUs}">
<c:import url="/WEB-INF/jspviews/Home.jsp"></c:import>
</c:when>
</c:choose> --%>

<div class="ng-view"></div>

<script>
var app = angular.module("myApp", ["ngRoute"]);
app.config(function($routeProvider) {
    $routeProvider
    .when("/Supplier", {
        templateUrl : "Supplier"
    })
    .when("/Category", {
        templateUrl : "Category"
    })
    .when("/Product", {
        templateUrl : "Product"
    });
});
</script> 
</body>
</html>