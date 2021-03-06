<%-- 
    Document   : bookLanding
    Created on : 20 Jan, 2021, 9:55:58 PM
    Author     : maulik
--%>

<%@page import="dao.equipmentDAO"%>
<%@page import="entities.Equipment"%>
<%@page import="helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="entities.Book"%>
<%@page import="dao.bookDAO"%>
<%@page import="helper.FactoryProvider"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Equipment Landing</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">


        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <link rel="stylesheet" href="assets/css/font-awesome.min.css">



        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="bookLandingCSS.css">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>





        <title>Books and Equipments</title>
    </head>
    <body>
        <%
//   HttpSession session = request.getSession();
            String name = (String) session.getAttribute("fname") + " " + (String) session.getAttribute("lname");
            String email = (String) session.getAttribute("email");
        %>
        <!--<nav class="navbar navbar-dark bg-dark">-->
        <!--<a class="navbar-brand" href="welcomePage.jsp">Generosity</a>-->

        <!--<div class="nav navbar-nav navbar-right">-->
        <!--<a href="index.html" class="navbar-brand"><strong>Logout</strong></a>-->
        <!--</div>-->
        <!--<div class="nav navbar-nav navbar-center">-->
            <!--<span id="welcomeMessage">Hello, <%=name%></span>-->
        <!--</div>-->
        <!--<div class="nav bavbar-nav">-->
        <!--<a href="myupload.jsp" value="My uploads" style="margin-left: 1325px; margin-top: -70px; color: white; text-decoration: underline">My Uploads</a>-->
        <!--<a href="myrequest.jsp" value="My Requests" style="margin-left: -85px; margin-top: -20px; color: white; text-decoration: underline">My Requests</a>-->

        <!--</div>-->
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
                                <a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#add-book-modal" href="#">Book</a>
                                <a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#add-equipment-modal" href="#">Equipment</a>
                                <a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#add-video-modal" href="#">Video</a>
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
        <%
            String dept = (String) session.getAttribute("dept");
        %>
        <nav class="navbar bg-light navbar-toggleable-md">
            <div class="container">
                <!--                <a class="navbar-brand" href="#">Center nav</a>
                                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarsExampleCenteredNav" aria-controls="navbarsExampleCenteredNav" aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>    -->
                <div class="collapse navbar-collapse navbar-collapse justify-content-md-center" id="navbarsExampleCenteredNav">
                    <ul class="nav nav-tabs">
                        <%
                            if (email.equals("adm@ddu.ac.in")) {
                        %>
                        <a class="nav-link" href="bookLanding.jsp">Books</a>

                        <% } else if (dept.equalsIgnoreCase("it")) {
                        %>

                        <a class="nav-link" href="itBooks.jsp">Books</a>
                        <%
                        } else if (dept.equalsIgnoreCase("ce")) {
                        %>
                        <a class="nav-link" href="ceBooks.jsp">Books</a>
                        <%
                        } else if (dept.equalsIgnoreCase("ec")) {
                        %>
                        <a class="nav-link" href="ecBooks.jsp">Books</a>
                        <%
                        } else if (dept.equalsIgnoreCase("mh")) {
                        %>
                        <a class="nav-link" href="mhBooks.jsp">Books</a>
                        <%
                        } else if (dept.equalsIgnoreCase("cl")) {
                        %>
                        <a class="nav-link" href="clBooks.jsp">Books</a>
                        <%
                        } else if (dept.equalsIgnoreCase("ch")) {
                        %>
                        <a class="nav-link" href="chBooks.jsp">Books</a>
                        <%
                            }
                        %>
                        <li class="nav-item">
                            <a class="nav-link active" href="equipmentLanding.jsp">Equipments</a>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>


        <!--</nav>-->

        <div class="container">
            <!--<div class="row mt-3">-->
            <!--                <div class="col-lg-6">
                                <div class="card" data-bs-toggle="modal" data-bs-target="#add-book-modal">
                                    <div class="card-body text-center">
                                        <div class="container">
                                            <img style="max-width: 200px; margin-left: -5px"class="img-fluid rounded-circle" src="plus.jpg" alt="add">
                                        </div>
                                        <p class="mt-2">Click here to upload a book!</p>
                                        <h1 class="text-uppercase text-muted">Books</h1>
                                    </div>
                                </div>
                            </div>-->
            <!--                <div class="col-lg-12">
                                <div class="card h-60" data-bs-toggle="modal" data-bs-target="#add-equipment-modal">
                                    <div class="card-body text-center">
                                        <div class="container">
                                            <img style="max-width: 200px; margin-left: -5px"class="img-fluid rounded-circle" src="plus.jpg" alt="add">
                                        </div>
                                        <p class="mt-2">Click here to upload an equipment!</p>
                                        <h1 class="text-uppercase text-muted">Equipments</h1>
                                    </div>
                                </div>
                            </div>-->
            <!--</div>-->

            <!--<div class="btn-group" style="width:100%">-->
            <!--<button class="btn btn-outline-danger active"style="width:50%">Books</button>-->
            <!--<button class="btn btn-outline-danger"style="width:50%">Equipments</button>-->
            <!--</div>-->

            <!-- <div class="row mt-3 mx-2">-->


            <div class="row">




                <%
                    equipmentDAO ed = new equipmentDAO(FactoryProvider.getFactory());
                    List<Equipment> e_list = ed.getEquipments();
                %>
                <%
                    if (email.equals("adm@ddu.ac.in")) {
                        for (Equipment e : e_list) {
                %>
                <div class="col-lg-4 mt-4">
                    <div class="card mt-4 mb-2 h-100">
                        <div class="container text-center">
                            <img src="<%= e.getE_image()%>" style="max-height: 350px; max-width: 100%; width: auto" class="card-image-top" alt="<%= e.getE_name()%>">
                        </div> 
                        <div class="card-body">
                            <h5 class="card-title"><%= e.getE_name()%></h5>
                            <p class="card-text"><%= Helper.get20Words(e.getE_desc())%></p>
                        </div>

                        <div class="card-footer text-center">
                            <form method="post" action="deletePost" id="<%= e.getE_id()%>">
                                <input type="hidden" name="d_email" value="<%= e.getD_email()%>">
                                <input type="hidden" name="b_name" value="<%= e.getE_name()%>">
                                <input type="hidden" name="b_id" value="<%= e.getE_id()%>">
                                <input type="hidden" name="category" value="equipment">
                                <div class="card">
                                    <!--<input type="submit" class="btn btn-success" value="Want it" onclick=" return swal('Confirmation' ,'Are you sure you want to request?',{buttons: ['Oh noez!', 'Aww yiss!'],})"></input>-->
                                    <input type="button" class="btn btn-danger delEqu" id="<%= e.getE_id()%>"  value="Delete"></input>
                                </div>
                            </form>


                        </div>
                    </div>
                </div>

                
                <%
                        }
                    }
                %>

                <% if(!email.equals("adm@ddu.ac.in")) {
                    for (Equipment e : e_list) {
                        if (!e.getD_email().equals(session.getAttribute("email"))) {
                %>

                <div class="col-lg-4 mt-4">
                    <div class="card mt-4 mb-2 h-100">
                        <div class="container text-center">
                            <img src="<%= e.getE_image()%>" style="max-height: 350px; max-width: 100%; width: auto" class="card-image-top" alt="<%= e.getE_name()%>">
                        </div> 
                        <div class="card-body">
                            <h5 class="card-title"><%= e.getE_name()%></h5>
                            <p class="card-text"><%= Helper.get20Words(e.getE_desc())%></p>
                        </div>

                        <div class="card-footer text-center">
                            <form method="post" action="smailRequest" id="<%= e.getE_id()%>">
                                <input type="hidden" name="d_email" value="<%= e.getD_email()%>">
                                <input type="hidden" name="b_name" value="<%= e.getE_name()%>">
                                <input type="hidden" name="b_id" value="<%= e.getE_id()%>">
                                <input type="hidden" name="category" value="equipment">
                                <div class="card">
                                    <!--<input type="submit" class="btn btn-success" value="Want it" onclick=" return swal('Confirmation' ,'Are you sure you want to request?',{buttons: ['Oh noez!', 'Aww yiss!'],})"></input>-->
                                    <input type="button" class="btn btn-success getbtn_equ" id="<%= e.getE_id()%>"  value="Want it"></input>
                                </div>
                            </form>
                            <a class="text-primary upbtn mr-5" data-bs-toggle="modal" data-bs-target="#upvote-modal<%= e.getE_id()%>" style="font-size: 110%" id="<%= e.getE_id()%>s"> Helpful<i class='fa fa-thumbs-up'> <%= e.getUpvotes()%></i></a> 

                            <a class="text-danger downbtn ml-5" data-bs-toggle="modal" data-bs-target="#downvote-modal<%= e.getE_id()%>" style="font-size: 110%" id="<%= e.getE_id()%>s" >Spam<i class="fa fa-thumbs-down"> <%= e.getDownvotes()%></i></a> 

                        </div>
                    </div>
                </div>

                <div class="modal fade" id="downvote-modal<%= e.getE_id()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Your Valuable Feedback is Appreciated!</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <!---->
                                <form action="downvoteServlet" method="post" id="<%= e.getE_id()%>">
                                    <input type="hidden" name="d_email" value="<%= e.getD_email()%>" id="<%= e.getD_email()%>">
                                    <input type="hidden" name="e_name" value="<%= e.getE_name()%>" id="<%= e.getE_name()%>">
                                    <input type="hidden" name="e_id" value="<%= e.getE_id()%>" id="<%= e.getE_id()%>">
                                    <input type="hidden" name="category" value="equipment">
                                    <input type="hidden" name="downvotes" value="<%= e.getDownvotes()%>" id="<%= e.getDownvotes()%>">
                                    <input type="hidden" name="operation" value="downvote"/>    
                                    <p>Please provide the primary reason for this downvote!</p>

                                    <div class="form-group">
                                        <input type="radio" id="impc<%= e.getE_id()%>" name="problem" value="improper content" class="ml-2">
                                        <label for="impc<%= e.getE_id()%>">Improper Content</label>

                                        <input type="radio" id="fd<%= e.getE_id()%>" name="problem" value="false description" class="ml-2">
                                        <label for="fd<%= e.getE_id()%>">False Description</label>

                                        <input type="radio" id="id<%= e.getE_id()%>" name="problem" value="improper donor" class="ml-2">
                                        <label for="id<%= e.getE_id()%>">Improper Donor</label>

                                        <input type="radio" id="ot<%= e.getE_id()%>" name="problem" value="other" class="ml-2">
                                        <label for="ot<%= e.getE_id()%>">Other</label>

                                    </div>

                                    <div class="form-group">
                                        <textarea style="height: 300px;" class="form-control"placeholder="Any other comments" name="ac"></textarea>     
                                    </div>
                                    <!--                    <div class="form-group">
                                                            <label for="vPath">Select Video!</label><BR>
                                                            <input type="file" name="vPath" id="vPath" required/>
                                                        </div>
                                    
                                    -->                   
                                    <div class="container text-center">
                                        <button class="btn btn-outline-success">Submit Feedback</button>
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                                    </div>



                                </form>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="upvote-modal<%= e.getE_id()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Your Valuable Feedback is Appreciated!</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <!---->
                                <form action="upvoteServlet" method="post" id="<%= e.getE_id()%>">
                                    <input type="hidden" name="d_email" value="<%= e.getD_email()%>" id="<%= e.getD_email()%>">
                                    <input type="hidden" name="e_name" value="<%= e.getE_name()%>" id="<%= e.getE_name()%>">
                                    <input type="hidden" name="e_id" value="<%= e.getE_id()%>" id="<%= e.getE_id()%>">
                                    <input type="hidden" name="category" value="equipment">
                                    <input type="hidden" name="upvotes" value="<%= e.getUpvotes()%>" id="<%= e.getUpvotes()%>">
                                    <input type="hidden" name="operation" value="upvote"/>    
                                    <p>Please provide any primary reason for this upvote!(Optional)</p>

                                    <div class="form-group">
                                        <textarea style="height: 300px;" class="form-control"placeholder="Any other comments" name="ac"></textarea>     
                                    </div>

                                    <div class="container text-center">
                                        <button class="btn btn-outline-success">Submit Feedback</button>
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                                    </div>



                                </form>

                            </div>
                        </div>
                    </div>
                </div>
                <%
                            }
                        }
                    }
                %>
                <!--</div>-->

            </div>



        </div>

    </div>
</div>


<!-- Modal -->
<div class="modal fade" id="add-book-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Fill Book Details!</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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

                    <div class="container text-center">
                        <button class="btn btn-outline-success">Add Book</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

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
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

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
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

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
<script src='request_confirmation.js'></script>
<script src='delete_confirmation.js'></script>

</body>
</html>
