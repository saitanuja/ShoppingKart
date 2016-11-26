<%@ page language ="java" contentType="text/html;  charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<html>
<head>
<meta http-equiv="context-Type" content ="text/html; charset=ISO-8859-1">
</head>
<body>
<h2>
<font color=red>
<center>SHOPPING KART</center></font>
</h2>
<jsp:include page="header.jsp"></jsp:include>
<hr>

${errorMessage}
${registerMessage}

<%-- <!-- if the error message is there,I have to open login.jsp -->
<c:if test="${errorMessage}">
<jsp:include page="login.jsp"></jsp:include>
</c:if> --%>
<!-- if the user clicked login link,I have to open login.jsp -->
  <c:if test="${UserClickedLogin}">
<jsp:include page="login.jsp"></jsp:include>
</c:if>
<c:if test="${UserClickedRegister}">
<jsp:include page="register.jsp"></jsp:include>
</c:if>  

 
</body>
</html>
