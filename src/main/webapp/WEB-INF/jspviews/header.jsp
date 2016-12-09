<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<!DOCTYPE html>
<html lang="en">
<head>
  <title>Online of shoppingKart</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:200px;
  }
  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }
  </style>
</head>
<body>
<h1><center>Online Bazaar</center></h1>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">ShoppingKart</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
       <ul>
           <sec:authorize access="!isAuthenticated()">
    
      <li><a href="Register"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="Login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li></ul>
      </sec:authorize>
      <sec:authorize access="isAuthenticated()">
     <ul class="nav navbar-nav navbar-right">
      <li><a href="Cart"><span class="glyphicon glyphicon-user"></span>Cart</a></li>
	<li><a href="<c:url value="/perform_logout" />">Logout</a></li>
	<li><a href="">Welcome  <sec:authentication property="principal.username"/></a></li></ul>
</sec:authorize>
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
        <img src="F:\ShoppingKart\src\main\webapp\resources\images\Gitar.jpg" alt="Gitar" width="460" height="345">
      </div>

      <div class="item">
        <img src="F:\ShoppingKart\src\main\webapp\resources\images\apple laptop.jpg" alt="laptop" width="460" height="345">
      </div>
    
      <div class="item">
        <img src="F:\ShoppingKart\src\main\webapp\resources\images\lumia-532.jpg" alt="phone" width="460" height="345">
      </div>

      <div class="item">
        <img src="F:\ShoppingKart\src\main\webapp\resources\images\books.jpg" alt="book" width="460" height="345">
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
  ${errorMessage} 
${registerMessage}
<!-- if the error message is there, i have to open login.jsp -->
<!-- if the user clicked login link, I have to open login.jsp -->
 <c:if test="${UserClickedCategorys}">
<jsp:include page="category.jsp"></jsp:include></c:if> 
 <c:if test="${UserClickedsuppliers}">
<jsp:include page="supplier.jsp"></jsp:include></c:if>
<c:if test="${UserClickedProducts}">
<jsp:include page="product.jsp"></jsp:include></c:if>   
<c:if test="${userClickedLoginHere}">
<jsp:include page="Login.jsp"></jsp:include></c:if>  
<c:if test="${userClickedRegistration}">
<jsp:include page="Register.jsp"></jsp:include></c:if> 
<c:if test="${UserClickedadmin}">
<jsp:include page="Admin.jsp"></jsp:include></c:if> 
 <c:if test="${UserClickedCart}">
<jsp:include page="Cart1.jsp"></jsp:include></c:if>   
<c:if test="${UserClickedshowproduct}">
<jsp:include page="ShowProduct.jsp"></jsp:include></c:if>  
<div>  

          
<c:forEach items="${productList}" var="product">
			<tr>


				<td>
					<!-- --<div class="thumbnail">-->
					<div class="col-md-4">
						<a href="ShowProduct/${product.id}"> <img height="150px"
							width="150px" alt="${product.id }"
							src="<c:url value="/resources/images/${product.id }.jpg"></c:url>"></a>

						<td><c:url var="action" value="addtocart/${product.id}"></c:url>
							<form:form action="${action}" modelAttribute="cart">
								<td id="td1"><c:out value="${product.name}" /><br>
								<td id="td1"><c:out value="${product.price}" /> <input
									type="submit" class="btn btn-primary" value="Add To Cart" /><br>
							</form:form></td>
						<br>

					</div>
			</tr>
			</td>
		</c:forEach>
	</div>

	<div ng-view></div>

	<script>
		$(document).ready(function() {
			$('.dropdown a.test').on("click", function(e) {
				$(this).next('ul').toggle();
				e.stopPropagation();
				e.preventDefault();
			});
		});
	</script>

	<c:choose>
		<c:when test="${UserClickedadmin}">
			<c:import url="/WEB-INF/jspviews/Admin.jsp"></c:import>
		</c:when>
	</c:choose>

 <c:choose>
		<c:when test="${UserClickedshowproduct}">
			<c:import url="/WEB-INF/jspviews/ShowProduct.jsp"></c:import>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${UserClickedCart}">
			<c:import url="/WEB-INF/jspviews/Cart.jsp"></c:import>
		</c:when>
	</c:choose>
<c:choose>
		<c:when test="${IfPaymentClicked}">
			<c:import url="/WEB-INF/jspviews/Payment.jsp">
			</c:import>
		</c:when>
		</c:choose> 

  <br>
<!-- <div class="container text-center">    
  <h3>What We Do</h3><br>
  <div class="row">
    <div class="col-sm-4">
      <img src="F:\ShoppingKart\src\main\webapp\resources\images\laptops.jpg" class="img-responsive" style="width:100%" alt="laptops">
      <p>Current Project</p>
    </div>
    <div class="col-sm-4"> 
      <img src="F:\ShoppingKart\src\main\webapp\resources\images\portfolio-img2.jpg" class="img-responsive" style="width:100%" alt="portfolio">
      <p>Project 2</p>    
    </div> -->
    <!-- <div class="col-sm-4">
      <div class="well">
       <p>Some text..</p>
      </div>
      <div class="well">
       <p>Some text..</p>
      </div>
    </div>
  </div> -->
</div><br>

<!-- <footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer> -->

</body>
</html>
