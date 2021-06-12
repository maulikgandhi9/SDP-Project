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
        <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">-->

        <!--original-->
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>-->
        <!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>-->

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">-->
        <!--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>-->


        <link rel="stylesheet" href="welcomepageCSS.css">
        <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">-->

    </head>

    <body>
        <%
            //   HttpSession session = request.getSession();
            String name = (String) session.getAttribute("fname") + " " + (String) session.getAttribute("lname");
            String email = (String) session.getAttribute("email");
        %>
        <nav class="navbar navbar-inverse navbar-toggleable-md">
            <div class="container">
                <a class="navbar-brand" href="welcomePage.jsp">Generosity</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarsExampleCenteredNav" aria-controls="navbarsExampleCenteredNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>    
                <div class="collapse navbar-collapse navbar-collapse justify-content-md-end" id="navbarsExampleCenteredNav">
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">About Us </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Contact</a>
                        </li>
                        <!--                        <li class="nav-item">
                                                    <a class="nav-link disabled" href="#">Disabled</a>
                                                </li>-->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-plus-circle"> Upload</i></a>
                            <div class="dropdown-menu position-absolute" aria-labelledby="dropdown03">
                                <a class="dropdown-item" data-toggle="modal" data-target="#add-book-modal" href="#">Book</a>
                                <a class="dropdown-item" data-toggle="modal" data-target="#add-equipment-modal" href="#">Equipment</a>
                                <a class="dropdown-item" data-toggle="modal" data-target="#add-video-modal" href="#">Video</a>
                                <a class="dropdown-item" data-toggle="modal" data-target="#add-sm-modal" href="#">Study Material</a>

                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user-circle" aria-hidden="true"><%=name%></i></a>
                            <div class="dropdown-menu position-absolute" aria-labelledby="dropdown03">
                                <a class="dropdown-item" href="myupload.jsp">My Uploads</a>
                                <a class="dropdown-item" href="myrequest.jsp">Approvals</a>
                                <a class="dropdown-item" href="mygrievance.jsp">Grievances</a>
                                <a class="dropdown-item" href="myResRequest.jsp">My Requests</a>
                                <a class="dropdown-item" href="index.html">Logout</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <%  String dept = (String) session.getAttribute("dept");
        %>
        <div class="container" style="height: 90%">

            <div id="demo" class="carousel slide mt-5" data-ride="carousel" style="height: 100% ;width: 80%; margin-left: 100px">

                <!-- Indicators -->
                <ul class="carousel-indicators">
                    <li data-target="#demo" data-slide-to="0" class="active"></li>
                    <li data-target="#demo" data-slide-to="1"></li>
                    <li data-target="#demo" data-slide-to="2"></li>
                </ul>


                <!-- The slideshow -->
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="book.jpg" alt="Books and Equipments" style="width: 100%">
                        <div class="carousel-caption">
                            <%
                                if (email.equals("adm@ddu.ac.in")) {
                            %>
                            <h3><a href="bookLanding.jsp">Books and Equipments</a></h3>

                            <%
                            } else if (dept.equalsIgnoreCase("it")) {                  %>

                            <h3><a href="itBooks.jsp">Books and Equipments</a></h3>
                            <%
                            } else if (dept.equalsIgnoreCase("ce")) {
                            %>
                            <h3><a href="ceBooks.jsp">Books and Equipments</a></h3>
                            <%
                            } else if (dept.equalsIgnoreCase("ec")) {
                            %>
                            <h3><a href="ecBooks.jsp">Books and Equipments</a></h3>
                            <%
                            } else if (dept.equalsIgnoreCase("mh")) {
                            %>
                            <h3><a href="mhBooks.jsp">Books and Equipments</a></h3>
                            <%
                            } else if (dept.equalsIgnoreCase("cl")) {
                            %>
                            <h3><a href="clBooks.jsp">Books and Equipments</a></h3>
                            <%
                            } else if (dept.equalsIgnoreCase("ch")) {
                            %>
                            <h3><a href="chBooks.jsp">Books and Equipments</a></h3>
                            <%
                                }
                            %>
                            <p>Want some books?!!</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="sm.jpg" alt="Study Materials" style="width: 100%">
                        <div class="carousel-caption">
                            <%
                                if (email.equals("adm@ddu.ac.in")) {
                            %>
                            <h3><a href="smLanding.jsp">Study Materials</a></h3>

                            <%
                                }else if (dept.equalsIgnoreCase("it")) {
                            %>

                            <h3><a href="itSM.jsp">Study Materials</a></h3>
                            <%
                            } else if (dept.equalsIgnoreCase("ce")) {
                            %>
                            <h3><a href="ceSM.jsp">Study Materials</a></h3>
                            <%
                            } else if (dept.equalsIgnoreCase("ec")) {
                            %>
                            <h3><a href="ecSM.jsp">Study Materials</a></h3>
                            <%
                            } else if (dept.equalsIgnoreCase("mh")) {
                            %>
                            <h3><a href="mhSM.jsp">Study Materials</a></h3>
                            <%
                            } else if (dept.equalsIgnoreCase("cl")) {
                            %>
                            <h3><a href="clSM.jsp">Study Materials</a></h3>
                            <%
                            } else if (dept.equalsIgnoreCase("ch")) {
                            %>
                            <h3><a href="chSM.jsp">Study Materials</a></h3>
                            <%
                                }
                            %>
                            <p>We guess exams are near!</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="video1.png" alt="Videos" style="width: 100%; height:50%">
                        <div class="carousel-caption">
                            <h3><a href="videoLanding.jsp">Videos</a></h3>
                            <p>Real learning Happens here!</p>
                        </div>
                    </div>
                </div>

                <!-- Left and right controls -->
                <a class="carousel-control-prev" href="#demo" data-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                </a>
                <a class="carousel-control-next" href="#demo" data-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </a>

            </div>
        </div>


        <div class="modal fade" id="add-book-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Book Details!</h5>
                        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="bookOperationServlet" method="post" enctype="multipart/form-data">

                            <input type="hidden" name="operation" value="addbook"/>
                            <div class="form-group">
                                <input type="text" class="form-control" name="b_name" placeholder="Enter book name">

                            </div>

                            <div class="form-group">
                                <textarea style="height: 300px;" class="form-control"placeholder="Enter book description" name="b_desc" required></textarea>     
                            </div>
                            <div class="form-group">
                                <label for="bPic">Select book's picture</label><BR>
                                <input type="file" name="bPic" id="bPic" required/>
                            </div>

                            <div class="form-group">
                                <label for="branch">Choose Book Branch:</label>

                                <select name="branch" id="branch">
                                    <option value="IT">IT</option>
                                    <option value="CE">CE</option>
                                    <option value="EC">EC</option>
                                    <option value="MH">MH</option>
                                    <option value="CL">CL</option>
                                    <option value="CH">CH</option>

                                </select>
                            </div>

                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Book</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                            </div>



                        </form>

                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="add-equipment-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Equipment Details!</h5>
                        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="bookOperationServlet" method="post" enctype="multipart/form-data">

                            <input type="hidden" name="operation" value="addequipment"/>
                            <div class="form-group">
                                <input type="text" class="form-control" name="e_name" placeholder="Enter Equipment name">

                            </div>

                            <div class="form-group">
                                <textarea style="height: 300px;" class="form-control"placeholder="Enter Equipment description" name="e_desc" required></textarea>     
                            </div>
                            <div class="form-group">
                                <label for="ePic">Select equipment's picture</label><BR>
                                <input type="file" name="ePic" id="ePic" required/>
                            </div>

                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Equipment</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                            </div>



                        </form>

                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="add-video-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Video Details!</h5>
                        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="bookOperationServlet" method="post" enctype="multipart/form-data">

                            <input type="hidden" name="operation" value="addvideo"/>
                            <div class="form-group">
                                <input type="text" class="form-control" name="v_name" placeholder="Enter Video name">

                            </div>

                            <div class="form-group">
                                <label for="vPic">Select video's thumbnail</label><BR>
                                <input type="file" name="vPic" id="vPic" required/>
                            </div>
                            <div class="form-group">
                                <label for="vPath">Select Video!</label><BR>
                                <input type="file" name="vPath" id="vPath" required/>
                            </div>



                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Video</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                            </div>



                        </form>

                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="add-sm-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Study Material Details!</h5>
                        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="bookOperationServlet" method="post" enctype="multipart/form-data">

                            <input type="hidden" name="operation" value="addsm"/>
                            <div class="form-group">
                                <input type="text" class="form-control" name="s_name" placeholder="Enter title for pdf">

                            </div>


                            <div class="form-group">
                                <label for="sPath">Select Study Material!(Please upload pdf format only)</label><BR>
                                <input type="file" name="sPath" id="sPath" required/>
                            </div>

                            <div class="form-group">
                                <label for="branch">Choose Study Material Branch:</label>

                                <select name="branch" id="branch">
                                    <option value="IT">IT</option>
                                    <option value="CE">CE</option>
                                    <option value="EC">EC</option>
                                    <option value="MH">MH</option>
                                    <option value="CL">CL</option>
                                    <option value="CH">CH</option>

                                </select>
                            </div>

                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Material</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                            </div>



                        </form>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
