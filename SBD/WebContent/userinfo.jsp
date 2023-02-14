<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Content Land</title>
        <link rel="stylesheet" type="text/css" href="css/styleIndex.css"/>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"/>
        <link href="css/styleUserInfo.css" rel="stylesheet" id="bootstrap-css" />
        <link rel="stylesheet" href="css/dropDown.css" />

        <!-- Favicons -->
        <link href="img/favicon.png" rel="icon">
        <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">

        <!-- j-Query -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
    <body style="background-color: #fff !important;">
        <!-- ======= Header ======= -->
        <header id="header" class="fixed-top d-flex align-items-center head-edit">
            <div class="container d-flex align-items-center" style="max-width: none;">
                <div class="logo mr-auto">
                    <a href="handleShowAllContent"><img src="img/logo.png" alt="" class="img-fluid"></a>
                </div>
                <nav class="nav-menu d-none d-lg-block" style="float: right;">
                    <ul>
                        <li class="active"><a href="handleShowAllContent">Home</a></li>
                        <jsp:include page="includes/logged.jsp" />
                    </ul>
                </nav>
            </div>
        </header>

        <!-- ======= Contact Section ======= -->
        <section id="contact" class="contact section-bg" style="padding-bottom: 250px;">
            <div class="container">
                <div class="section-title">
                	<% if(session.getAttribute("changePass") != null){%>
                		<%=session.getAttribute("changePass")%>
                	<%}%>
                	<% if(session.getAttribute("changeContent") != null){%>
                		<%=session.getAttribute("changeContent")%>
                	<%}%>
                    <h2>User profile</h2>
                    <p>Here you can see and change some information about your profile and publications</p>
                </div>

                <div class="row mt-5 justify-content-center">
                    <div class="container emp-profile">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="row" style="margin-bottom: 30px;">
                                    <div class="col-md-6">
                                        <h4>Username</h4>
                                    </div>
                                    <div class="col-md-6">
                                    	<% if(session.getAttribute("username") != null){%>
                                    		<h4 style="color: #0492C2;"><%=session.getAttribute("username")%></h4>
                						<%}%>
                                    </div>
                                </div>
                                <div class="row" style="margin-bottom: 30px;">
                                    <div class="col-md-6">
                                        <h4>Age</h4>
                                    </div>
                                    <div class="col-md-6">
                                    	<% if(session.getAttribute("age") != null){%>
                                        	<h4 style="color: #0492C2;"><%=session.getAttribute("age")%></h4>
                                        <%}%>
                                    </div>
                                </div>
                                <div class="row" style="margin-bottom: 30px;">
                                    <div class="col-md-6">
                                        <h4>Nationality</h4>
                                    </div>
                                    <div class="col-md-6">
                                    	<% if(session.getAttribute("nationality") != null){%>
                                        	<h4 style="color: #0492C2;"><%=session.getAttribute("nationality")%></h4>
                                        <%}%>
                                    </div>
                                </div>
                                <div class="row" style="margin-bottom: 30px;">
                                    <div class="col-md-6">
                                        <h4>Reputation</h4>
                                    </div>
                                    <div class="col-md-6">
                                    	<% if(session.getAttribute("reputation") != null){%>
                                        	<h4 style="color: #0492C2;"><%=session.getAttribute("reputation")%></h4>
                                        <%}%>
                                    </div>
                                </div>
                                <div class="row" style="margin-bottom: 30px;">
                                    <div class="col-md-6">
                                        <h4>User type</h4>
                                    </div>
                                    <div class="col-md-6">
                                    	<% if(session.getAttribute("typeuser") != null){%>
                                        	<h4 style="color: #0492C2;"><%=session.getAttribute("typeuser")%></h4>
                                        <%}%>
                                    </div>
                                </div>
                                
                                
                            </div>
                        </div>
                        <ul class="nav nav-tabs" id="myTab" role="tablist"></ul>
                        <div class="col-md-2" style="margin-top: 20px;margin-bottom: 20px;">
                            <button id="buttonEdit" class="profile-edit-btn" type="button">Edit Profile</button>
                        </div>
                        <div id="edition" style="display: none;" style="margin-bottom: 20px;">
                            <form action="handleChangePassword" method="POST" id="form1" class="signup-form" onsubmit="return validateNewPassword()"><!---->
                                <ul class="nav nav-tabs" id="myTab" role="tablist"></ul>
                                <h3 style="margin-top: 20px;">Change password</h3>
                                <div class="form-group" style="margin-top: 40px;">
                                    <input type="password" class="form-control" id="pass1" name="pass1"  placeholder="Current password"/> 
                                </div>
                                <div class="form-group" style="margin-top: 30px;">
                                    <input type="password" class="form-control" id="pass2" name="pass2" placeholder="New Password"/> 
                                </div>
                                <div class="form-group" style="margin-top: 30px;margin-bottom: 30px;">
                                    <input type="password" class="form-control" id="pass3" name="pass3" placeholder="Re-enter new password"/> 
                                </div>
                                <div class="col-md-2" style="margin-top: 20px;margin-bottom: 20px;">
                                    <button id="submit1" name="submit1" id="button-profile" class="profile-edit-btn" type="submit">Submit</button>
                                </div>
                                <p id="invalid" class="invalid" style="font-size: 16px; text-align: center;margin-top:10px;"/>
                            </form>
                           <% if(session.getAttribute("editContent") != null){%>
                            	<%=session.getAttribute("editContent")%>
                            <%}%>
                            <!-- <form  action="handleEditPost" method="POST" id="form2" onsubmit="return validateContentUser()">
                            	<ul class="nav nav-tabs" id="myTab" role="tablist"></ul>
                           		<h3 style="margin-top: 20px;margin-bottom: 20px;">Change content</h3>
                            	<div class="custom-select" style="border-radius: 10px;">
                            		<select id="district-name"><option value="0" selected="selected">Select content:</option>
                            			<option value="1">CONA</option>
                            			<option value="2">CONA2</option>
                            			<option value="2">CONA3</option>
                            			<option value="2">CONA4</option>
                            		</select>
                            		<input name="getidpost" id="getidpost" type="hidden">
                            		<input class="select-selected" name="dist" id="district-name2" value="Select content:" style="background-color: #ececec;border-radius:10px;" readonly>
                            		<div class="select-items select-hide" id="teste">
                            			<div id="d1">CONA</div>
                            			<div id="d2">CONA2</div>
                            			<div id="d3">CONA3</div>
                            			<div id="d4">CONA4</div>
                            		</div>
                            	</div>
                            	<div class="col-md-5" style="margin-top: 20px;margin-bottom: 20px;">
                                    <div class="align-privacy" >
                                        <div class="form-check form-check-inline" style="position:static;">
                                            <input class="form-check-input" type="radio" name="age" id="public" value="option1" required>
                                            <label class="form-check-label" for="inlineRadio1">Age: 3</label>
                                        </div>
                                        <div class="form-check form-check-inline" style="position:static;">
                                            <input class="form-check-input" type="radio" name="publicity" id="private" value="option2">
                                            <label class="form-check-label" for="inlineRadio2">Age: 12</label>
                                        </div>
                                        <div class="form-check form-check-inline" style="position:static;">
                                            <input class="form-check-input" type="radio" name="publicity" id="private" value="option3">
                                            <label class="form-check-label" for="inlineRadio2">Age: 16</label>
                                        </div>
                                        <div class="form-check form-check-inline" style="position:static;">
                                            <input class="form-check-input" type="radio" name="publicity" id="private" value="option4">
                                            <label class="form-check-label" for="inlineRadio2">Age: 18</label>
                                        </div>
                                        <div class="form-check form-check-inline" style="position:static;">
                                            <input class="form-check-input" type="radio" name="publicity" id="delete" value="option5">
                                            <label class="form-check-label" for="inlineRadio2">Delete</label>
                                        </div>
                                    </div>
                                    <button id="resetBtn" class="profile-edit-btn" type="button" style="margin-top: 20px;background-color: #7D746C; color: #fff;width:250px;">Reset</button>
                                    <button id="submitContent" name="submitContent" class="profile-edit-btn" type="submit"style="margin-top: 150px;width:250px;">Submit</button>
                                    <button id="hide" class="profile-edit-btn" type="submit"style="margin-top: 20px;background-color:#b2b2ff;width:250px;">Hide edition</button>
                                    <p id="invalid2" class="invalid" style="font-size: 16px; text-align: center;margin-top:10px;"/>
                                </div>
                            </form>-->
                            <!--  <?php echo $edit_content; ?>
                            <?php echo $user_content; ?>
                            <?php echo $edit_content2; ?>-->

                        </div>
                    </div>
                </div>
            </div>
        </section><!-- End Contact Section -->
        
        <script src="scripts/comboBox.js"></script>
        <script>selectorDistrict();document.addEventListener("click", closeAllSelect);</script>
        

        <jsp:include page="includes/footer.jsp" />
        
        
        <script src="scripts/main.js"></script>
        <script src="scripts/editUser.js"></script>
    </body>
</html>