 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="ISO-8859-1"> 
<title>Login</title>
 </head>
<body>
<pre>
<%-- <c:url var="addAction" value="/validate"></c:url> --%>
<form:form action="${addAction}" method="post">
<center>
<table>
<h3><font color=green>This is Login page</font>
</h3>
<tr>
<tr>
<td><form:label class="btn btn-default btn-block" path="userID"><spring:message text="UserName" />
	</form:label></td>
	<td><form:input class="form-control" path="userID" required="true" pattern=".{5,10}" /></td>
	</tr>
	<tr>
<td><form:label class="btn btn-default btn-block" for="pwd" path="password"><spring:message text="Password" />
	</form:label></td>
	<td><form:input type="password" class="form-control" id="pwd" path="password" required="true"  pattern=".{3,8}"  title="Enter Valid credentials" /></td>
	</tr>
	<tr>
    </table>
     <input class="btn btn-danger" type="submit"
						value="login" />
						
</center>
</form:form>
</pre>


</body>
</html> 