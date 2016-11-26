<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Supplier</title>
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
				url : 'suppliergson'
			}).success(function(data, status, headers, config) {
				$scope.suppliers = data;// alert(data); 
			}).error(function(data, status, headers, config) {
			});
		};
	};
</script>
</head>
<body style="padding-top: 75px">
	<div class="container row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<c:url var="addAction" value="addsupplier"></c:url>
			<form:form action="${addAction}" modelAttribute="supplier">
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

						<c:choose>
							<c:when test="${supplier.sid gt 0}">
								<td><form:label class="btn btn-default btn-block" path="sid">
										<spring:message text="Id" />
									</form:label></td>
								<td><form:input class="form-control" path="sid"
										readonly="true" /></td>
							</c:when>
							<%-- <c:otherwise>
								<td><form:input class="form-control" path="id"
										pattern=".{2,10}" required="true"
										title="id should contains 2 to 10 characters" /></td>
							</c:otherwise> --%>
						</c:choose>
					<tr>
						<td><form:label class="btn btn-default btn-block" path="sname">
								<spring:message text="Name" />
							</form:label></td>
						<td><form:input class="form-control" path="sname"
								required="true" /></td>
					</tr>
					<tr>
						<td><form:label class="btn btn-default btn-block" path="saddress">
								<spring:message text="Address" />
							</form:label></td>
						<td><form:input class="form-control" path="saddress"
								required="true" /></td>
					</tr>
				</table>
				<br>
				<c:if test="${!empty supplier.sname}">
					<input class="btn btn-block btn-primary" type="submit"
						value="Edit Supplier" />
				</c:if>
				<c:if test="${empty supplier.sname}">
					<input class="btn btn-block btn-primary" type="submit"
						value="Add Supplier" />
				</c:if>
			</form:form>
		</div>
		<div class="col-sm-3"></div>
	</div>

	<!--  -->
	<c:choose>
		<c:when test="${!EditSupplier}">
			<div class="container" data-ng-app="myApp"
				data-ng-controller="MyController" data-ng-init="getDataFromServer()"
				style="overflow: auto; height: 400px; width: 70%">
				<form>
					<input
						class="w3-input w3-animate-input w3-border w3-round w3-small"
						data-ng-model="search" type="text" placeholder=" Search Supplier"
						style="width: 20%">
				</form>
				<br>
				<table class="table table-bordered table-hover ">
					<thead>
						<tr>
							<th> ID</th>
							<th> Name</th>
							<th> Address</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<c:forEach var="obj" items="${supplierList}">
					<tbody>
						<tr
							data-ng-repeat="supplier in suppliers | orderBy:sortType:sortReverse | filter:search">
							<td><c:out value="${obj.sid}"/></td>
							<td><c:out value="${obj.sname}"/></td>
							<td><c:out value="${obj.saddress}"/></td>
							<td><a class="btn btn-info btn-xs"
								href="editBySupplier/${obj.sid}">Edit</a></td>
							<td><a class="btn btn-danger btn-xs"
								href="deleteBySupplier/${obj.sid}">Delete</a></td>
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