

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en-US">
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<title>Supplier</title>
</head>
<style>
.w3-btn {margin-bottom:10px;}
</style>

<body>
  <c:url var="addAction" value="addsupplier" ></c:url>

<form:form action="${addAction}" modelAttribute="supplier" id="btn-add">
<center>
<table>

 
                        <h3><font color=green>Supplier page</font></h3>
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
								<td><form:input class="form-control" path="sid"
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
  
	    <tr> <td colspan="2">
	     <div class="w3-container">
    	     <c:if test="${!empty supplier.sname}">
					<button class="w3-btn w3-white w3-border w3-border-blue w3-round-xlarge">Edit Supplier</button>
				</c:if>
				<c:if test="${empty supplier.sname}">
					<button class="w3-btn w3-white w3-border w3-border-blue w3-round-xlarge">Add Supplier</button>
				</c:if>
				</div>
		</td> 
		</center>
		<tr> <td colspan="2" class="success-msg">
		   <c:out value="${msg}"/>
		</td> 
	  
	   <table class="table table-bordered table-hover ">
    <thead>
      <tr>
        <th>Supplier ID</th>
        <th>Supplier Name</th>
        <th>Supplier Address</th>
        
          <th>Edit</th>
							<th>Delete</th>
        
      </tr>
    </thead>
   
    	      <c:forEach var="obj" items="${supplierList}">
		      <tr>
		                 <td> <c:out value="${obj.sid}"/> </td>
		                 <td> <c:out value="${obj.sname}"/> </td>
				 <td> <c:out value="${obj.saddress}"/> </td>
				 
				
				
				 <td><a class="btn btn-info btn-xs"
								href="editBySupplier/${obj.sid}">Edit</a></td>
							<td><a class="btn btn-danger btn-xs"
								href="deleteBySupplier/${obj.sid}">Delete</a></td>
		      </tr>
	      </c:forEach>
          </table> 
 </form:form>
  
 

</body>
</html> 