<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<jsp:include page="includes/head.jsp" />
<link rel="stylesheet" type="text/css" href="css/styleIndex.css" />
</head>

<body>
	
    <!-- ======= Header ======= -->
    <header id="header" class="fixed-top d-flex align-items-center head-edit">
        <div class="container d-flex align-items-center" style="max-width: none;">
            <div class="logo mr-auto">
                <a href="handleShowAllContent"><img src="img/logo.png" alt="" class="img-fluid"></a>
            </div>
            <nav class="nav-menu d-none d-lg-block" style="float: right;">
                <ul>
                    <li class="active"><a href="handleShowAllContent">Home</a></li>
                    <li><a href="#portfolio">Images</a></li>
                    <li><a href="#artists">Artists</a></li>
                    <li><a href="handleTop10">Top 10</a></li>
                    
                    <jsp:include page="includes/logged.jsp" />
                    
                </ul>
            </nav>
        </div>
    </header>

    <!-- ======= Hero Section ======= -->
    <section id="hero" class="d-flex flex-column justify-content-center align-items-center" style="margin: 0;">
        <div class="container text-center text-md-left" data-aos="fade-up">
            <h1>Welcome to <span>Content Land</span></h1>
            <h2>Here you can find the best content</h2>
        </div>
    </section>

    <main id="main">
        <!-- ======= Content ======= -->
        <section id="portfolio" class="portfolio">
            <div class="container">

                <div class="section-title">
                    <h2>Content</h2>
                    <h4>Here you can see content posted by users</h4>
                    <p style="padding-top:10px;">There is also some content that you can only see if you're logged in</p>
                </div>

				<div style="text-align:center; padding-bottom:30px;">
					<form autocomplete="off" action="handleAutoComplete"  onsubmit="">
						<div class="autocomplete" style="width: 300px;">
							<input id="myInput" type="text" name="myCountry" placeholder="Relevant word" style="border-radius:5px">
						</div>
						<input type="submit" style="border-radius:5px" value=" Submit ">
						<% if(session.getAttribute("search") != null){%>
							<p id="invalid" class="invalid" style="font-size: 20px; color:#7f7fff; padding-top:20px;">Search for word: <%=session.getAttribute("search")%></p>
							<p id="invalid"  style="padding-top:10px;">
								<a href="handleShowAllContent" class="invalid" style="font-size:16px;">Return to homepage</a>
							</p>
						<%}%>
						<% if(session.getAttribute("top") != null){%>
							<p id="invalid" class="invalid" style="font-size: 20px; color:#7f7fff; padding-top:20px;">Search for Top 10</p>
							<p id="invalid" class="invalid" style="font-size: 16px; color:#7f7fff;">(For the most recent uploads)</p>
							<p id="invalid"  style="padding-top:10px;">
								<a href="handleShowAllContent" class="invalid" style="font-size:16px;">Return to homepage</a>
							</p>
						<%}%>
						
					</form>
				</div>

				<div class="row">
                    <div class="col-lg-12">
                        <ul id="portfolio-flters">
                            <li data-filter="*" class="filter-active" style="border: 2px solid black;font-size: 13px;">
                                All</li>
                            <li data-filter=".filter-1" style="border: 2px solid black;font-size: 13px;">Photographs</li>
                            <li data-filter=".filter-2" style="border: 2px solid black;font-size: 13px;">Videos</li>
                            <li data-filter=".filter-3" style="border: 2px solid black;font-size: 13px;">Musics</li>
                            <li data-filter=".filter-4" style="border: 2px solid black;font-size: 13px;">Poems</li>
                        </ul>
                    </div>
                </div>

                <div class="row portfolio-container">
                	
                	<% if(session.getAttribute("content") != null){%>
                		<%=session.getAttribute("content")%>
                	<%}%>
                    <!-- ======= Conteúdo de imagem ======= 
                    <!-- <div class="col-lg-4 col-md-6 portfolio-item filter-1 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="portfolio-wrap" href="#">
                            <figure>
                                <img src="img/deus/bom-jesus-monte.jpg" class="img-fluid" alt="" width="800" height="600">
                            </figure>
                            <div class="portfolio-info">
                                <h4>
                                    <a href="#">Nome sds</a>
                                </h4>
                                <p>Nome Imagem</p>
                            </div>
                        </div>
                    </div>-->
                    
                    <!-- ======= Conteúdo de video ======= -->
                     <!--<div class="col-lg-4 col-md-6 portfolio-item filter-2 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="portfolio-wrap" href="#">
                            <div class="card">
                                <figure>
                                    <video class="img-fluid" width="800" height="600" playsinline autoplay muted loop>
                                        <source src="C:/Users/migue/OneDrive/Ambiente de Trabalho/Da_police.mp4" type="video/mp4">
                                    </video>
                                </figure>
                            </div>
                            <div class="portfolio-info">
                                <h4><a href="#">Não sei</a></h4>
                                <p>Pois tambem nao</p>
                            </div>
                        </div>
                    </div>-->
                    
                    <!-- ======= Conteúdo de audio ======= -->
                    <!--<div class="col-lg-4 col-md-6 portfolio-item filter-2 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="portfolio-wrap" href="#">
                            <div class="card">
                                <figure style="background:#201e1f">
                                	<audio class="img-fluid" controls>
                                        <source src="Lil Peep - Save That Shit.mp3" type="audio/mpeg">
                                    </audio>
                                	<img src="img/default.jpg" class="img-fluid" alt="" width="800" height="600">
                                </figure>
                            </div>
                            <div class="portfolio-info">
                                <h4><a href="#">Não sei</a></h4>
                                <p>Pois tambem nao</p>
                            </div>
                        </div>
                    </div>-->
                    
                    
                    
                    <!--<div class="col-lg-4 col-md-6 portfolio-item filter-4 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="portfolio-wrap" href="#">
                            <div class="card">
                                <figure style="background-color:#fff">
                                	 <h5>afhashfashfsdhgfhsdghsdghsdhfsdhf</h5>
                                </figure>
                            </div>
                            <div class="portfolio-info">
                                <h4><a href="#">Não sei</a></h4>
                                <p>Pois tambem nao</p>
                            </div>
                        </div>
                    </div>-->

                </div>
            </div>
        </section>
        
        <% if(session.getAttribute("artists") != null){%>
        	<%=session.getAttribute("artists")%>
        <%}%>

       
        <!--  <section id="artists" class="portfolio">
            <div class="container">
                <div class="section-title">
                    <h2>Artist: </h2>
                    <h4>Artist is a: </h4>
                </div>
                <div class="row portfolio-container">
                	
                </div>
            </div>
        </section>-->

    </main><!-- End #main -->
    
    


    <jsp:include page="includes/footer.jsp" />

    <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

    <!-- scripts Vendor -->
    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <!--seta e animação-->
    <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
    <!--animação subir-->
    <script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
    <!--organização do conteudo-->
    <script src="assets/vendor/counterup/counterup.min.js"></script>
    <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>

    <script src="scripts/anim.js"></script>
    
    <script src="scripts/autocomplete.js"></script>
    
    <script>
    	var countries = [<%=session.getAttribute("words")%>];
		autocomplete(document.getElementById("myInput"), countries);
	</script>

</body>

</html>