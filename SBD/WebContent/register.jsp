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
					<form action="handleRegister" method="POST" id="signup-form" class="signup-form"
						onsubmit="return validateRegister()">


						<h2 class="form-title">Create account</h2>
						<div class="form-group">
							<input type="text" class="form-input" name="username"
								id="username" placeholder="Username" />
						</div>
						<div class="form-group">
							<input type="text" class="form-input" name="nacionality" id="nationality"
								placeholder="Your nationality" />
						</div>
						<div class="form-group">
							<input type="text" class="form-input" name="birthday" id="birthday"
								placeholder="Your birthday" />
						</div>
						<div class="form-group">
							<input type="password" class="form-input" name="password"
								id="password" placeholder="Password" />
						</div>
						<div class="form-group">
							<input type="submit" name="submit" id="submit"
								class="form-submit" value="Sign up" />
						</div>
						<% if(session.getAttribute("register") != null){%>
							<% if(session.getAttribute("register").equals("1")){%>
								<h2 style="padding-top: 10px; color:#7f7fff;">Register with success</h2>
							<%}else if(session.getAttribute("register").equals("0")){%>
								<p class="invalid" style="font-size: 20px;color:#790604;">The username already exists</p>
							<%}else if(session.getAttribute("register").equals("-1")){%>
								<p class="invalid" style="font-size: 20px;color:#790604;">The data is not valid</p>
							<%} %>
						<%} %>
						<p id="invalid" class="invalid" style="font-size: 16px;" />
					</form>
					<p class="loginhere">
						Have already an account ? <a href="handleRemoveLogin"
							class="loginhere-link">Login here</a>
					</p>
					<p class="loginhere" style="margin-top:30px;">
						<a href="index.jsp" class="loginhere-link" style="font-size:12px;">Return to homepage</a>
					</p>
				</div>
			</div>
		</section>
	</div>
</body>
</html>