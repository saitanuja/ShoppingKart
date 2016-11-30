<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="ISO-8859-1"> 
<title>User</title>
 </head>
<body>
<pre>
<c:url var="addAction" value="adduser"></c:url>
<form:form action="${addAction}" commandName="user" method="post">
<center>
<table>
<h3><font color=green>This is Register page</font>
</h3>
<tr>
<td><form:label class="btn btn-default btn-block" path="name"><spring:message text="Name" />
	</form:label></td>
	<td><form:input class="form-control" path="name" required="true" /></td>
	</tr>
	<tr>
<td><form:label class="btn btn-default btn-block" path="username"><spring:message text="UserName" />
	</form:label></td>
	<td><form:input class="form-control" path="username" required="true" /></td>
	</tr>
	<tr>
<td><form:label class="btn btn-default btn-block" for="pwd" path="password"><spring:message text="Password" />
	</form:label></td>
	<td><form:input type="password" class="form-control" id="pwd" path="password" required="true" /></td>
	</tr>
	<tr>
<td><form:label class="btn btn-default btn-block" path="mobile"><spring:message text="Mobile" />
	</form:label></td>
	<td><form:input class="form-control" path="mobile" required="true" /></td>
	</tr>
	<tr>
<td><form:label class="btn btn-default btn-block" path="email"><spring:message text="Email" />
	</form:label></td>
	<td><form:input class="form-control" path="email" required="true" /></td>
	</tr>
	</table>
     <input class="btn btn-danger" type="submit"
						value="signup" />
</center>
</form:form>
</pre>


</body>
</html>