<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- <style>
form {
    border: 3px solid #f1f1f1;
}

input[type=text], input[type=password] {
    width: 50%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

button {
    background-color: #e699ff;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 30%;
}

/* .cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
} */

/* .imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
/* @media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
} */
 */</style>
 -->

<body style="padding-top:">
	<div class="container">
		<section id="content">
			<form action="perform_login" method="post">
			 <center>

			 <h3> <font color=green>Login page</font></h3>
			<%-- <form action="action_page.php"> 
  <!-- <div class="imgcontainer">
    <img src="img_avatar2.png" alt="Avatar" class="avatar">
  </div> -->

  <div class="container">
    <label><b>Username</b></label>
    <input type="text" placeholder="Enter Username" name="uname" required><br>

    <label><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" required><br>
        
    <button type="submit">Login</button>
   <!--  <input type="checkbox" checked="checked"> Remember me -->
  </div>

  <div class="container" style="background-color:#f1f1f1">
    <!-- <button type="button" class="cancelbtn">Cancel</button> -->
    <span class="psw">Forgot <a href="Login">password?</a></span>
  </div>
</form> --%>
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