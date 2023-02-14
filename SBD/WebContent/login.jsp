<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="includes/head.jsp" />
<link rel="stylesheet" href="css/styleRegister.css" />
</head>

<body>
	<div class="main">
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<form action="handleLogin" method="POST" id="signup-form" name="myform"
						class="signup-form" onsubmit="return validateLogin()">
						<h2 class="form-title">Login</h2>
						<div class="form-group">
							<input type="text" class="form-input" name="username"
								id="username" placeholder="Username" />
						</div>
						<div class="form-group">
							<input type="password" class="form-input" name="password"
								id="password" placeholder="Password" />
						</div>

						<div class="form-group">
							<input type="submit" name="submit" id="submit"
								class="form-submit" value="Login" />
						</div>
						<% if(session.getAttribute("errorlog") != null){%>
							<% if(session.getAttribute("errorlog").equals("true")){%>
								<p class="invalid" style="font-size: 20px;color:#790604;">Username or password is not correct</p>
							<%} %>
						<%} %>
						<p id="invalid" class="invalid" style="font-size: 16px;" />
					</form>
					<p class="loginhere">
						Don't have an account yet ? <a href="handleRemoveRegister"
							class="loginhere-link">Register here</a>
					</p>
					<p class="loginhere" style="margin-top:30px;">
						<a href="handleShowAllContent" class="loginhere-link" style="font-size:12px;">Return to homepage</a>
					</p>
				</div>
			</div>
		</section>
	</div>
</body>
</html>