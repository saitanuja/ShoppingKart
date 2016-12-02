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

<title>Admin</title>
<!-- <body background="C:\Users\majjipoojihta\Desktop\dha3\s8.jpg" ng-app="myApp"> -->
</head>
<body ng-app="myApp">
${message}
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
         </div>
    <ul class="nav navbar-nav">
       <li><a class="active" href="Supplier">Supplier</a></li>
      <li><a href="Product">Product</a></li>
      <li><a href="Category">Category</a></li>
       
    </ul>
  </div>
</nav>
${msg}
${msg1 }
<h1>Welcome Admin</h1>
<div align="right"><a href=<c:url value="perform_logout"/>>logout</a></div>

<c:choose>
<c:when test="${UserClickedsuppliers}">
<c:import url="/WEB-INF/jspview/Supplier.jsp"></c:import>
</c:when>
</c:choose>

<c:choose>
<c:when test="${UserClickedProducts}">
<c:import url="/WEB-INF/jspview/Product.jsp"></c:import>
</c:when>
</c:choose> 
<c:choose>
<c:when test="${UserClickedCategorys}">
<c:import url="/WEB-INF/jspview/Category.jsp"></c:import>
</c:when>
</c:choose>
<div class="ng-view"></div>

<!-- <script>
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
</script>  -->
</body>
</html>