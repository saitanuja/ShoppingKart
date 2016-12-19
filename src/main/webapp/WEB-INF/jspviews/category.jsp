 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
     pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
     <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en-US">
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css"><title>Category</title>
</head>
<style>
.w3-btn {margin-bottom:10px;}
</style>

<body>
  <c:url var="addAction" value="addcategory" ></c:url>

<form:form action="${addAction}" modelAttribute="category" id="btn-add" >
<center>
 <table>
  <tr>
                        <h3> <font color=green>Category page</font></h3> 
						<c:choose>

							<c:when test="${category.cid gt 0}">
								<td><form:label class="btn btn-default btn-block" path="cid">
										<spring:message text="Id" />
									</form:label></td>
								<td><form:input class="form-control" path="cid"
										readonly="true" /></td>
							</c:when>
							
						</c:choose>
					<tr>
	 
	  
	  <tr>
						<td><form:label class="btn btn-default btn-block" path="cname">
								<spring:message text="Name" />
							</form:label></td>
						<td><form:input class="form-control" path="cname"
								required="true" /></td>
					</tr>
					<tr>
						<td><form:label class="btn btn-default btn-block"
								path="cdescription">
								<spring:message text="Description" />
							</form:label></td>
						<td><form:input class="form-control" path="cdescription"
								required="true" /></td>
					</tr>
				<tr> 
	    <td colspan="2">
	    <div class="w3-container">
    	        <c:if test="${!empty category.cname}">
					<button class="w3-btn w3-white w3-border w3-border-blue w3-round-xlarge">Edit category</button>
				</c:if>
				
				<c:if test="${empty category.cname}">
					
					<button class="w3-btn w3-white w3-border w3-border-blue w3-round-xlarge">Add category</button>
					</c:if>
				</div>
		</td> 
		<tr> <td colspan="2" class="success-msg">
		   <c:out value="${msg}"/>
		</td> 
		</center>
	  </table>
	  <table class="table table-bordered table-hover ">
    <thead>
      <tr>
        <th>Category ID</th>
        <th>Category  Name</th>
        <th>Category  DESCRIPTION</th>
          <th>Edit</th>
					<th>Delete</th>
        
      </tr>
    </thead>
    	      <c:forEach var="obj" items="${categoryList}">
		      <tr>
		                 <td> <c:out value="${obj.cid}"/> </td>
		                 <td> <c:out value="${obj.cname}"/> </td>
				 <td> <c:out value="${obj.cdescription}"/> </td>
				
				<td><a class="btn btn-info btn-xs"
								href="editBycid/${obj.cid}">Edit</a></td>
							<td><a class="btn btn-danger btn-xs"
								href="deleteBycid/${obj.cid}">Delete</a></td>
		      </tr>
	      </c:forEach>
          </table> 
         
 </form:form>
  
</body>
</html>
 



 