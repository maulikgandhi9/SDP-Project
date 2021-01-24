<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Welcome to Generosity!</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="welcomepageCSS.css">
        <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">-->

    </head>

    <body>
<% 
//   HttpSession session = request.getSession();
   String name = (String)session.getAttribute("email");
%>
        <nav class="navbar navbar-dark bg-primary">
            <a class="navbar-brand" href="#">Generosity</a>
            
            <div class="nav navbar-nav navbar-right">
                <a href="index.html" class="navbar-brand"><strong>Logout</strong></a>
            </div>
            <div class="nav navbar-nav navbar-center">
                <span id="welcomeMessage">Hello, <%=name%></span>
            </div>
            <div class="nav bavbar-nav">
               <a href="myupload.jsp"> <input type="button" value="My uploads" class="btn btn-primary" style="margin-left: 1325px; margin-top: -65px"></input></a>
            </div>


        </nav>
        <div class="container" style="height: 80%">
            <!--<p class="jumbotron"> Welcome to Generosity!</p>-->
            <div id="myCarousel" class="carousel slide" data-ride="carousel" style="height: 80%">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner">

                    <div class="item active">
                        <img src="book.jpg" alt="Books" style="width:100%; height: 40%">
                        <div class="carousel-caption">
                            <h3><a href="bookLanding.jsp">Books and Equipments</a></h3>
                            <p>Want some books?!!</p>
                        </div>
                    </div>

                    <div class="item">
                        <img src="sm.jpg" alt="Study material" style="width:100%;height: 50%">
                        <div class="carousel-caption">
                            <h3>Study Materials</h3>
                            <p>We guess exams are near!</p>
                        </div>
                    </div>

                    <div class="item">
                        <img src="video1.png" alt="Videos" style="width:100%;height: 40%">
                        <div class="carousel-caption">
                            <h3>Videos</h3>
                            <p>Real learning Happens here!</p>
                        </div>
                    </div>

                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </body>
</html>
