
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

 <style>
 h3{
    text-align: center;
    }
 /* table {
    border-collapse: collapse;
    width: 100%;
} */
th, td {
    text-align: center;
    padding: 8px;
}
/* tr:nth-child(even){background-color: #f2f2f2}
th {
    background-color: #ffe6e6;
    color: white;
} */
</style>


<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value="/resources/table1.css" />">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<title>New Product Details</title>
</head>
<style>
.w3-btn {margin-bottom:10px;}
</style>
<!-- <style>
body  {
   
    background-color: #ffe6e6  ;
}
</style> -->
<body>
<h3><font color=green>Product page</font></h3>

	<div class="text-center myForm">
		<c:url var="action" value="updateproduct"></c:url>
		<form:form action="${action}" modelAttribute="product"
			enctype="multipart/form-data" method="post">
			<div align="center">
			<table>
				<c:choose>
					<c:when test="${product.id gt 0}">
						<tr>
							<td><form:label class="btn btn-default btn-block" path="id">
										<spring:message text="Id" />
									</form:label></td>
	                       </tr>
					</c:when>
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
								path="categoryid">
								<spring:message text="Category" />
							</form:label></td>
						<td><form:select class="form-control" path="categoryid"
								required="true">
				<c:forEach items="${categoryList}" var="category">
								<form:option class="input1" value="${category.cid}">${category.cname}</form:option>
							</c:forEach>
								</form:select></td></tr>
						<tr>
								<td><form:label class="btn btn-default btn-block"
								path="supplierid">
								<spring:message text="Supplier" />
							</form:label></td>
						<td><form:select path="supplierid" class="form-control"
								required="true">
				<c:forEach items="${supplierList}" var="supplier">
								<form:option class="input1"  value="${supplier.sid}">${supplier.sname}</form:option>
							</c:forEach>
								</form:select></td></tr>
								
					
				
				<tr>
					<td><form:label class="btn btn-default btn-block"
								path="image">
								<spring:message text="Image" />
							</form:label></td>
					<td><form:input type="file"
							class=" btn btn-default btn-block form-control" path="image"
							required="true" /></td>
				</tr>
				</table>
				<br>
				<div class="w3-container">
					<button class="w3-btn w3-white w3-border w3-border-blue w3-round-xlarge">Add product</button>
					
				</div>
			</div>
		</form:form>
	</div>
	<div align="center">
		<table class="table table-bordered table-hover ">
			
			<thead>
			
				 <tr id="tr1">
					<th>Product Id</th>
					<th>Product Name</th>
					<th>Product Description</th>
					<th>Product Price</th>
					<th>Category</th>
					<th>Supplier</th>
					<th>Image</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${productList}" var="product">
					<tr id="tr1">
						<td id="td1"><c:out value="${product.id}" />
						<td id="td1"><c:out value="${product.name}" />
						<td id="td1"><c:out value="${product.description}" />
						<td id="td1"><c:out value="${product.price}" />
						<td id="td1"><c:out value="${product.categoryid}" />
						<td id="td1"><c:out value="${product.supplierid}" />
						<td><div class="thumbnail">
			<img height="100px" width="100px" alt="${product.id }"src="<c:url value="/resources/images/${product.id}.jpg"></c:url>">
							</div> 
						<td><a class="btn btn-info btn-xs"
								href="editById/${product.id}">Edit</a></td>
							<td><a class="btn btn-danger btn-xs"
								href="deleteById/${product.id}">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
	
	
</body>
</html> 