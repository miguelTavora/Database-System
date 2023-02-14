<% if(session.getAttribute("username") == null ||  session.getAttribute("password") == null){%>
	<li class="log">
		<a href="handleRemoveLogin">Log in</a>
	</li>
	<li class="log">
		<a href="handleRemoveRegister">Register</a>
	</li>
<%} else if(session.getAttribute("username") != null &&  session.getAttribute("password") != null && (Integer)session.getAttribute("admin") == 0) {%>
<li class="drop-down log"><a href="#"><%= session.getAttribute("username") %></a>
	<ul>
		<li><a href="handleUserInfo">User</a></li>
	</ul>
</li>
<li class="log"><a href="handleLogout" name="logout" type="submit">Log out</a></li>
<%} else if(session.getAttribute("username") != null &&  session.getAttribute("password") != null && (Integer)session.getAttribute("admin") == 1) {%>
<li class="drop-down log"><a href="#"><%= session.getAttribute("username") %></a>
	<ul>
		<li><a href="handleUserInfo">User</a></li>
    	<li><a href="#">Add content</a></li>
	</ul>
</li>
<li class="log"><a href="handleLogout" name="logout" type="submit">Log out</a></li>
<%} else if(session.getAttribute("username") != null &&  session.getAttribute("password") != null && (Integer)session.getAttribute("admin") == 2) {%>
<li class="drop-down log"><a href="#"><%= session.getAttribute("username") %></a>
	<ul>
		<li><a href="handleUserInfo">User</a></li>
    	<li><a href="#">Admin</a></li>
    	<li><a href="#">Add content</a></li>
    </ul>
</li>
<li class="log"><a href="handleLogout" name="logout" type="submit">Log out</a></li>
<%} %>

