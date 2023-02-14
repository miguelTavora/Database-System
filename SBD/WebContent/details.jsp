<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html class="desktop mbr-site-loaded">

    <jsp:include page="includes/headDetails.jsp" />

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
                        <jsp:include page="includes/logged.jsp" />
                    </ul>
                </nav>
            </div>
        </header>

        <section class="cid-qv7rmTfhmn" id="footer2-6y" data-rv-view="6029" style="background-color: #f7fbfe;color:#000;padding-bottom: 110px;">
            <div class="container">
                <div class="section-title">
                    <h2>Details</h2>
                    <p>Here you can see the details of the publication</p>
                    <% if(session.getAttribute("resultSubmission") != null){%>
                		<%=session.getAttribute("resultSubmission")%>
                	<%}%>
                    <!--<h4 style="color:#D21404;padding-top:15px;">SUCESSS SUBMITTING THE CONTENT</h4> -->
                </div>
                <div class="row mt-5 justify-content-center">
                    <div class="container" style="background-color: #fff">
                        <div class="media-container-row content">
                            <div class="col-12 col-md-5 mbr-fonts-style display-7">
                                <p class="mbr-text">
                                    <br/>
                                    <%=session.getAttribute("info")%>
                                    <!--  <strong>Title:</strong>
                                    <br/>
                                    <br/>XXXXXXXXXXXX<br/>
                                    <br/>
                                    <br/>
                                    <strong>Date:</strong>
                                    <br/>
                                    <br/>XXXXXXXXXXXXXXXX<br/>
                                    <br/>
                                    <br/>
                                    <strong>Age Required:</strong>
                                    <br/>
                                    <br/>XXXXXXXXXXXXXXXX<br/>
                                    <br/>
                                    <br/>
                                    <strong>User who posted:</strong>
                                    <br/>
                                    <br/>XXXXXXXXXXXXXXXX<br/>
                                    <br/>
                                    <br/>
                                    <strong>Artist:</strong>
                                    <br/>
                                    <br/>XXXXXXXXXXXXXXXX-->
                                    <!--  <span class="fa fa-star checked"></span>
									<span class="fa fa-star checked"></span>
									<span class="fa fa-star checked"></span>
									<span class="fa fa-star"></span>
									<span class="fa fa-star"></span>-->
                                </p>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="portfolio-wrap" style="padding-top:30px;padding-left:50px;">
                                	<%=session.getAttribute("image")%>
								<!--<h5>
									Cerca de grandes muros quem te sonhas.<br> Depois, onde é
									visível o jardim<br> Através do portão de grade dada,<br>
									Põe quantas flores são as mais risonhas,<br> Para que te
									conheçam só assim.<br> Onde ninguém o vir não ponhas nada.<br>
									<br> Faze canteiros como os que outros têm,<br> Onde
									os olhares possam entrever<br> O teu jardim como lho vais
									mostrar.<br> Mas onde és teu, e nunca o vê ninguém,<br>
									Deixa as flores que vêm do chão crescer<br> E deixa as
									ervas naturais medrar.<br> <br> Faze de ti um duplo
									ser guardado;<br> E que ninguém, que veja e fite, possa<br>
									Saber mais que um jardim de quem tu és –<br> Um jardim
									ostensivo e reservado,<br> Por trás do qual a flor nativa
									roça<br> A erva tão pobre que nem tu a vês…
								</h5>-->
								<!--<figure>
                                		<video class="img-fluid" width="500" height="350" controls>
                                        	<source src="tell_clock.mp4" type="video/mp4">
                                    	</video>
                           	 		</figure>-->
                           	 		
                           	 		<!--<figure>
                                		<img src="daisy5.png" class="img-fluid" alt="" width="450" height="300">
                                		<img src="<%=session.getAttribute("image")%>" class="img-fluid" alt="" width="450" height="300">
                           	 		</figure>-->
                           	 		
                           	 		<!--<figure style="background:#201e1f">
                                		<audio class="img-fluid" controls>
                                        	<source src="Lil Peep - Awful Things ft. Lil Tracy.mp3" type="audio/mpeg">
                                    	</audio>
                                		<img src="img/default.jpg" class="img-fluid" alt="" width="800" height="600">
                                	</figure>
                                </figure>-->
                                	
                           	 		
                                </div>
                            </div>
                        </div>
                        
                        <div class="footer-lower" style="margin-bottom:120px;">
                            <div class="media-container-row">
                                <div class="col-sm-12">
                                    <hr style="border-color: #000;"/>
                                </div>
                            </div>
                            <div class="media-container-row" style="float:left !important;width:100%">
                                <p class="mbr-text mbr-fonts-style display-7"style="padding-left: 2%;width:100%;padding-right: 2%;">
                                	<%=session.getAttribute("resume")%>
                                    <!--  <strong>Description</strong>
                                    <br/>
                                    <br/>-->
                                </p>
                            </div>
                        </div>
                        
                        
                        <% if(session.getAttribute("classComment") != null){%>
                			<%=session.getAttribute("classComment")%>
                		<%}%>
                        <!--  <div class="footer-lower" style="margin-top:120px;">
                            <div class="media-container-row">
                                <div class="col-sm-12">
                                    <hr style="border-color: #000;"/>
                                </div>
                            </div>
                            <form action="handleClassification?content=4" method="POST" onsubmit="return validationClassification()">
	                            <div class="media-container-row" style="float:left !important;width:100%">
									<div class="dropdown" style="width:100%">
										<input type="hidden" name="classification" id="classification">
										<button  class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" style="background-color:#3CBC8D;border:none;margin:2rem;padding: 0.5rem 1.5rem;">Select classification</button>
										<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
											<a id="cl1" class="dropdown-item">1</a> 
											<a id="cl2" class="dropdown-item">2</a> 
											<a id="cl3" class="dropdown-item">3</a>
											<a id="cl4" class="dropdown-item">4</a>
											<a id="cl5" class="dropdown-item">5</a>
											<a id="cl6" class="dropdown-item">6</a>
											<a id="cl7" class="dropdown-item">7</a>
											<a id="cl8" class="dropdown-item">8</a>
											<a id="cl9" class="dropdown-item">9</a>
											<a id="cl10" class="dropdown-item">10</a>
										</div>
									</div>
								</div>
								<button type="submit" style="margin-left:3%;border-radius:5px;background-color:DodgerBlue;border:none;padding:0.5rem 1.5rem;color:#fff">Submit classification</button>
								<p id="invalid-class" class="invalid" style="font-size: 16px;color:#D21404;padding-left:3%;padding-top:15px;"/>
							</form>
                        </div>-->
                        
                        <!-- <div class="footer-lower">
                        	<form action="handleComment?content=4" method="POST" onsubmit="return validationComment()">
	                            <div class="media-container-row">
	                                <div class="col-sm-12">
	                                    <hr style="border-color: #000;"/>
	                                </div>
	                            </div>
	                            <div class="media-container-row" style="float:left !important;width:100%">
	                                <div class="media-container-row" style="float:left !important;width:100%">
	                            		<input type="text" class="comment-text" name="comment" id="comment" placeholder="Write here your comment" />
	                            	</div>
	                            </div>
	                            <button type="submit" style="margin-left:3%;margin-top:20px;border-radius:5px;background-color:DodgerBlue;border:none;padding:0.5rem 1.5rem;color:#fff">Submit comment</button>
	                            <p id="invalid-comment" class="invalid" style="font-size: 16px;color:#D21404;padding-left:3%;padding-top:15px;"/>
                            </form>
                        </div>-->
                        
                        <% if(session.getAttribute("comments") != null){%>
                			<%=session.getAttribute("comments")%>
                		<%}%>
                        
                       <!--  <div class="footer-lower" style="margin-top:10px;">
                            <div class="media-container-row">
                                <div class="col-sm-12">
                                    <hr style="border-color: #000;"/>
                                </div>
                            </div>
                            <div class="media-container-row" style="float:left !important;width:100%">
                                <div class="media-container-row" style="float:left !important;width:100%">
                                	<p class="mbr-text mbr-fonts-style display-7"style="padding-left: 2%;width:100%;padding-right: 2%;">
                                    	<strong>Comment by user: XXXXXXX</strong>
                                    	<br/>XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                                    	<br/>Date: 2000-06-01
                                    	<br/>
                                    	<br/>
                                    	<strong>Comment by user: XXXXXXX</strong>
                                    	<br/>
                                    	<br/>XXXXXXXXXX
                               		</p>
                            	</div>
                            </div>
                        </div>-->
                        
                        
                    </div>
                </div>
             </div>
        </section>

        <jsp:include page="includes/footer.jsp" />
        
        <script>
        	setClassification();
        </script>
		
    </body>
</html>