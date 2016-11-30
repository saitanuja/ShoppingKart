<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/css/w3.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/background.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/font-awesome.min.css" />"
	rel="stylesheet">
<script>
	var app = angular.module('myApp', []);
	function MyController($scope, $http) {
		$scope.sortType = 'name'; // set the default sort type
		$scope.sortReverse = false; // set the default sort order
		$scope.search = '';
		$scope.getDataFromServer = function() {
			$http({
				method : 'GET',
				url : 'productgson'
			}).success(function(data, status, headers, config) {
				$scope.products = data;// alert(data); 
			}).error(function(data, status, headers, config) {
			});
		};
	};
</script>
</head>
<body style="padding-top: 75px">

	<div class="container row ">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<c:url var="addAction" value="addproduct"></c:url>
			<form:form action="${addAction}" method="post" enctype="multipart/form-data"  modelAttribute="product"
				>
				<table>
					<tr>
						<c:choose>
							<c:when test="${!empty SuccessMessage}">
								<td colspan="2">
									<div class="alert alert-success fade in">
										<a href="#" class="close" data-dismiss="alert"
											aria-label="close">&times;</a>${SuccessMessage}
									</div>
								</td>
							</c:when>
							<c:when test="${!empty DeleteMessage}">
								<td colspan="2">
									<div class="alert alert-danger fade in">
										<a href="#" class="close" data-dismiss="alert"
											aria-label="close">&times;</a>${DeleteMessage}
									</div>
								</td>
							</c:when>
						</c:choose>
					<tr>
                       <h3><font color=green><center>Product page</center></font></h3>
						<c:choose>
						 <c:when test="${product.id gt 0}"> 
								<td><form:label class="btn btn-default btn-block" path="id">
										<spring:message text="Id" />
									</form:label></td>
								<td><form:input class="form-control" path="id" readonly="true" /></td>
							 </c:when> 
							<%-- <c:otherwise>
								<td><form:input class="form-control" path="id"
										pattern=".{2,10}" required="true"
										title="id should contains 2 to 10 characters" /></td>
							</c:otherwise> --%>
						</c:choose>
					<tr>
						<td><form:label class="btn btn-default btn-block" path="name">
								<spring:message text="Name" />
							</form:label></td>
						<td><form:input class="form-control" path="name"
								required="true" /></td>
					</tr>
					<tr>
						<td><form:label class="btn btn-default btn-block"
								path="description">
								<spring:message text="Description" />
							</form:label></td>
						<td><form:input class="form-control" path="description"
								required="true" /></td>
					</tr>
					<tr>
						<td><form:label class="btn btn-default btn-block"
								path="price">
								<spring:message text="Price" />
							</form:label></td>
						<td><form:input type="number" class="form-control" min="100"
								step="1" path="price" required="true" /></td>
					</tr>
					 <tr>
						<td><form:label class="btn btn-default btn-block"
								path="supplierid">
								<spring:message text="Supplier" />
							</form:label></td>
						<td><form:select path="supplierid" class="form-control"
								required="true">
								<c:forEach items="${supplierList}" var="supplier">
									<form:option class="form-control" value="${supplier.sid}">${supplier.sname}</form:option>
								</c:forEach>
							</form:select></td>
					</tr>
					<tr>
						<td><form:label class="btn btn-default btn-block"
								path="categoryid">
								<spring:message text="Category" />
							</form:label></td>
						<td><form:select class="form-control" path="categoryid"
								required="true">
								<c:forEach items="${categoryList}" var="category">
									<form:option class="form-control" value="${category.cid}">${category.cname}</form:option>
								</c:forEach>
							</form:select></td>
					</tr> 
					<tr>
					<td><form:label class="btn btn-default btn-block"
								path="image">
								<spring:message text="image" />
							</form:label></td>
					<td><form:input type="file"
							class=" btn btn-default btn-block form-control" path="image"
							required="true" /></td>
				</tr>
					
					<tr>
				</table>
				<br>
				<c:if test="${!empty product.name}">
					<input class="btn btn-block btn-primary" type="submit" value="Edit Product" />
				</c:if>
				<c:if test="${empty product.name}">
					<input class="btn btn-block btn-primary" type="submit" value="Add Product" />
				</c:if>
			</form:form>
		</div>
		<div class="col-sm-3"></div>
	</div>
	<!--  -->

	<c:choose>
		<c:when test="${!EditProduct}">

			<div class="container" data-ng-app="myApp"
				data-ng-controller="MyController" data-ng-init="getDataFromServer()"
				style="overflow: auto; height: 400px; width: 80%">
				<%-- <form>
					<input
						class="w3-input w3-animate-input w3-border w3-round w3-small"
						data-ng-model="search" type="text" placeholder=" Search Product"
						style="width: 20%">

				</form> --%>
				<br>
				<table class="table table-bordered table-hover ">
					<thead>
						<tr>
							<th> ID</th>
							<th> Name</th>
							<th> Description</th>
							<th> Price</th>
							 <th>Supplier</th> 
							<th>Category </th> 
							<th>Image</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<c:forEach var="obj" items="${productList}">
					<tbody>
						<tr
							data-ng-repeat="product in products | orderBy:sortType:sortReverse | filter:search">
							<td><c:out value="${obj.id}"/></td>
							<td><c:out value="${obj.name}"/></td>
							<td><c:out value="${obj.description}"/></td>
							<td><c:out value="${obj.price}"/></td>
							 <td><c:out value="${obj.supplierid}"/></td> 
							<td><c:out value="${obj.categoryid}"/></td> 
							<td><div class="thumbnail">
								<img height="300px" width="100px" alt="${obj.id }"
									src="<c:url value="F:\ShoppingKart\src\main\webapp\images/${obj.id }.jpg"></c:url>">
							</div>
						    <td><a class="btn btn-info btn-xs"
								href="editById/${obj.id}">Edit</a></td>
							<td><a class="btn btn-danger btn-xs"
								href="deleteById/${obj.id}">Delete</a></td>
						</tr>
					</tbody>
					</c:forEach>
				</table>
			</div>

		</c:when>
		<c:otherwise>
			<div style="margin-bottom: 70px"></div>
		</c:otherwise>
	</c:choose>

</body>
</html>