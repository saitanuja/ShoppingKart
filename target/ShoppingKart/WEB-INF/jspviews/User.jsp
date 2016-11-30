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
  <%-- <meta name="viewport" content="width=device-width, initial-scale=1">

<link href="<c:url value="/resources/css/w3.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/font-awesome.min.css" />" rel="stylesheet"> --%>
</head>
<body>
<pre>
<c:url var="addAction" value="adduser"></c:url>
<form:form action="${addAction}" commandName="user" method="post">
<table>
<tr>
<td><form:label class="btn btn-default btn-block" path="name"><spring:message text="Name" />
	</form:label></td>
	<td><form:input class="form-control" path="name" required="true" /> </td>
	</tr>
	<tr>
<td><form:label class="btn btn-default btn-block" path="username"><spring:message text="Name" />
	</form:label></td>
	<td><form:input class="form-control" path="username"required="true" /></td>
	</tr>
	<tr>
<td><form:label class="btn btn-default btn-block" path="password"><spring:message text="password" />
	</form:label></td>
	<td><form:input class="form-control" path="password"required="true" /></td>
	</tr>
	<tr>
<td><form:label class="btn btn-default btn-block" path="mobile"><spring:message text="Mobile" />
	</form:label></td>
	<td><form:input class="form-control" path="mobile"required="true" /></td>
	</tr>
	<tr>
<td><form:label class="btn btn-default btn-block" path="email"><spring:message text="Email" />
	</form:label></td>
	<td><form:input class="form-control" path="email"required="true" /></td>
	</tr>
	</table>
	<br>
	<input class="btn btn-block btn-primary" type="submit"
						value="signup" />
<%--  <form:label path="name"><spring:message text="Name" /></form:label><form:input path="name" required="true" /> 
<form:label path="username"><spring:message text="username" /></form:label><form:input path="username" required="true" />
<form:label path="password"><spring:message text="Password" /></form:label><form:input path="password" required="true" />
<form:label path="mobile"><spring:message text="Mobile Number" /></form:label><form:input path="mobile" required="true" />
<form:label path="email"><spring:message text="Email" /></form:label><form:input path="email" required="true" /> --%>
<!-- <input type="submit" value="signup"/> -->

</form:form>
</pre>


</body>
</html>