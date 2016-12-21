<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<body style="padding-top:">
	<div class="container">
		<section id="content">
			<form action="perform_login" method="post">
			 <center>

			 <h3> <font color=green>Login page</font></h3>
			
			
		 		  <div>
					<input type="text" placeholder="Username" required id="username" name="username" 
						pattern=".{5,10}" title="minimum length for name is 5"/>
				</div>
				<br>
				<div>
					<input type="password" placeholder="Password" required id="password" name="password" 
					 pattern=".{3,8}" title="Enter Valid credentials"/>
				</div>
				<br>
				<!-- <div>
					<input type="submit" value="Login" />  <a href="Register">Register</a>
				</div> -->
				
				
				<input class="btn btn-primary disabled" type="submit"
						value="Login" /> <a href="Register">Register</a>
						 
						 </center>
			</form>
			
			
		</section>
		
	</div>
	

 
</body>
</html>