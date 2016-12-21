<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<!DOCTYPE html>
<html lang="en">
<head>
  <title>Online of shoppingKart</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
<div class="w3-container">
 <ul class="w3-navbar w3-black">
    
 <li class="w3-dropdown-hover">
      <a href="#">Category</a>
      <div class="w3-dropdown-content w3-white w3-card-4">
          <c:forEach items="${categoryList}" var="obj">
				<a href="navproduct/${obj.cid }"><c:out value="${obj.cname}" /></a> 
						
					</c:forEach>
					</div>
					</li>
       <sec:authorize access="!isAuthenticated()">
     <li><li class="w3-right"><a href="Register">Signup</a></li>
   <li><li class="w3-right"><a href="Login"><i class="fa fa-sign-in"></i></a></li>
   </sec:authorize>
  
     <sec:authorize access="isAuthenticated()">
      <ul class="nav navbar-nav navbar-right">
      <li><a href="Cart"><span class="glyphicon glyphicon-user"></span>Cart</a></li>
	<li><a href="<c:url value="/perform_logout" />">Logout</a></li>
	<li><a href="">Welcome  <sec:authentication property="principal.username"/></a></li></ul>
</sec:authorize>
  </ul>
 
  </div>
<%-- <nav class="navbar navbar-inverse">
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
</nav> --%>

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
<c:if test="${Clickedcatproduct}">
<jsp:include page="catproducts.jsp"></jsp:include></c:if>  
<div>  
<c:if test="${UserClickedContact}">
<jsp:include page="Contact.jsp"></jsp:include></c:if>  
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
<c:choose>
		<c:when test="${Clickedcatproduct}">
			<c:import url="/WEB-INF/jspviews/catproducts.jsp">
			</c:import>
		</c:when>
		</c:choose> 

 <c:choose>
		<c:when test="${UserClickedContact}">
			<c:import url="/WEB-INF/jspviews/Contact.jsp">
			</c:import>
		</c:when>
		</c:choose> 
		
		<div>
		<c:choose>
			<c:when test="${!Administrator}">
				<c:if test="${empty HideOthers}">
					<table class="table">
						<thead>
							<tr>
								<th>OUR COMPANY</th>
								<th>TOP CATEGORIES</th>
								<th>POLICIES AND INFO</th>
							</tr>
						</thead>
						<tbody>

							<tr>

								<td>About us<br> Online Bazaar <br> Ethnico<br>
									Place of Origin<br> Blog<br>
								</td>

								<td>Sarees<br> Lehenga<br> Jewellery<br>
									Accessories<br> Salwar Suits<br></td>
								<td>Terms & Conditions<br> Policy for Sellers<br>
									Policy for Buyers<br> Shipping & Refund Policies<br>
									Wholesale Policy<br> Privacy Policy<br></td>
							</tr>

							<tr>
								<th>SUPPORT</th>
								<th>PAYMENT OPTIONS</th>
								<th>STAY CONNECTED</th>
							</tr>


							<tr>
								<td><i class="fa fa-envelope"
									style="font-size: 30px; color: blue"></i> <a
									href="mailto:support@company.com">support@onlineBazaar.com</a><br>
									
									
									<br></td>
								<td><div class="footer-icons">
										<a href=""><i class="fa fa-facebook-official"
											style="font-size: 30px; color: blue"></i> <a href=""><i
												class="fa fa-twitter"
												style="font-size: 30px; color: #00ffff"></i></a> <a href=""><i
												class="fa fa-linkedin-square"
												style="font-size: 30px; color: blue"></i></a> <a href=""><i
												class="fa fa-google" style="font-size: 30px; color: #3366ff"></i></a>
											<a href=""><i class="fa fa-google-plus-official"
												style="font-size: 30px; color: red"></i></a> <a href=""><i
												class="fa fa-whatsapp"
												style="font-size: 30px; color: #33ff00"></i></a>
									</div></td>
								<td><a href=""><i class="fa fa-paypal"
										aria-hidden="true" style="font-size: 30px; color: #0066ff"></i>
								</a> . <a href=""><i class="fa fa-cc-amex" aria-hidden="true"
										style="font-size: 30px; color: #0066ff"></i> </a> . <a href=""><i
										class="fa fa-cc-mastercard" aria-hidden="true"
										style="font-size: 30px; color: #0066ff"></i> </a> . <a href=""><i
										class="fa fa-cc-visa" aria-hidden="true"
										style="font-size: 30px; color: #0066ff"></i> </a> . <a href=""><i
										class="fa fa-credit-card" aria-hidden="true"
										style="font-size: 30px; color: #0066ff"></i> </a> . <a href=""><i
										class="fa fa-google-wallet" aria-hidden="true"
										style="font-size: 30px; color: #0066ff"></i> </a> . <a href=""><i
										class="fa fa-cc-stripe" aria-hidden="true"
										style="font-size: 30px; color: #0066ff"></i> </a></td>
						</tbody>
					</table>
				</c:if>
			</c:when>
		</c:choose>
	</div>
		
</body>
</html>
