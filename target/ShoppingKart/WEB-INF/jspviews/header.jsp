<%@ page language ="java" contentType="text/html;  charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Tanuja Online</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
  </style>
   <style>
  /* Note: Try to remove the following lines to see the effect of CSS positioning */
  .affix {
      top: 0;
      width: 100%;
  }
  .affix + .container-fluid {
      padding-top: 70px;
  }
  </style>
  <style>
  body{
       background-color:  #E8E3E3;
  }
  </style>
  <style>
  body{
       background-names: #FFB6C1;
  }
  </style>
</head>
<body>

<nav class="navbar navbar-inverse"data-spy="affix" data-offset-top="197">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <!-- <a class="navbar-brand" href="#">ShoppingKart</a> -->
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <!--  <li class="active"><a href="#">Home</a></li> 
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Admin<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="Category">category</a></li>
            <li><a href="Supplier">supplier</a></li>
            <li><a href="Product">product</a></li> -->
            <li><a href="User">Signup</a></li>
          </ul>
        </li>
        </ul>
     
      <ul class="nav navbar-nav navbar-right">
       <!--  <li><a href="registerHere"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li> -->
        <li><a href="login"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
        
      </ul>
    </div>
  </div>
</nav>
 <div class="container">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

   
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="F:\ShoppingKart\src\main\webapp\images\Gitar.jpg" alt="Gitar" width="460" height="345">
      </div>

      <div class="item">
        <img src="F:\ShoppingKart\src\main\webapp\images\apple laptop.jpg" alt="laptop" width="460" height="345">
      </div>
    
      <div class="item">
        <img src="F:\ShoppingKart\src\main\webapp\images\castle nature.jpg" alt="Nature" width="460" height="345">
      </div>

      <div class="item">
        <img src="F:\ShoppingKart\src\main\webapp\images\pencils nature.jpg" alt="Sea" width="460" height="345">
      </div>
    </div>

    
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div> 

</body>
   <c:choose>
  <c:when test="${UserClickedProducts}">
  <c:import url="/WEB-INF/jspviews/product.jsp"></c:import>
  </c:when>
  </c:choose> 
 <c:choose>
  <c:when test="${UserClickedsuppliers}">
  <c:import url="/WEB-INF/jspviews/supplier.jsp"></c:import>
  </c:when>
  </c:choose>
<c:choose>
  <c:when test="${UserClickedCategorys}">
  <c:import url="/WEB-INF/jspviews/category.jsp"></c:import>
  </c:when>
  </c:choose>
 <c:choose>
  <c:when test="${UserClickedLogin}">
  <c:import url="/WEB-INF/jspviews/login.jsp"></c:import>
  </c:when>
  </c:choose>
  <c:choose>
  <c:when test="${UserClickedRegister}">
  <c:import url="/WEB-INF/jspviews/User.jsp"></c:import>
  </c:when>
  </c:choose>   
</body>
</html>