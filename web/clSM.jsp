<%-- 
    Document   : bookLanding
    Created on : 20 Jan, 2021, 9:55:58 PM
    Author     : maulik
--%>

<%@page import="entities.studyMaterial"%>
<%@page import="dao.smDAO"%>
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
        <title>Study Materials</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">


        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">-->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">



        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="smCSS.css">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script
            src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script>




        <title>Books and Equipments</title>
    </head>
    <body>
        <%
//   HttpSession session = request.getSession();
            String name = (String) session.getAttribute("fname") + " " + (String) session.getAttribute("lname");
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


        <nav class="navbar navbar-toggleable-md addtp">
            <div class="container">
                <!--                <a class="navbar-brand" href="#">Center nav</a>
                                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarsExampleCenteredNav" aria-controls="navbarsExampleCenteredNav" aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>    -->
                <div class="collapse navbar-collapse navbar-collapse justify-content-md-center" id="navbarsExampleCenteredNav">
                    <ul class="nav nav-pills nav-jusified">

                        <li class="nav-item">
                            <a class="nav-link" href="ceSM.jsp">CE</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="itSM.jsp">IT</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ecSM.jsp">EC</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="mhSM.jsp">MH</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="chSM.jsp">CH</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active   " href="clSM.jsp">CL</a>
                        </li>


                    </ul>
                    <!--                    <div class="btn-group">
                                            <a href="#" class="btn btn-success active" aria-current="page">CE</a>
                                            <a href="#" class="btn btn-success">EC</a>
                                            <a href="#" class="btn btn-success">IT</a>
                                        </div>-->
                </div>
            </div>
        </nav>


        <!--</nav>-->

        <div class="container">

            <%                smDAO sd = new smDAO(FactoryProvider.getFactory());
                List<studyMaterial> s_list = sd.getSm();
            %>
            <!-- <div class="row mt-3 mx-2">-->


            <div class="row">

                <%
                    for (studyMaterial s : s_list) {
                        if (!s.getD_email().equals(session.getAttribute("email")) && s.getS_dept().equalsIgnoreCase("cl")) {
                %>
                <div class="col-lg-4">
                    <div class="card mt-4 mb-2 h-100">
                        <div class="container text-center">
                            <embed src="<%= s.getS_path()%>" style="max-height: 350px; max-width: 100%; width: auto" class="card-image-top" alt="<%= s.getS_name()%>">
                        </div> 
                        <div class="card-body">
                            <h5 class="card-title"><%= s.getS_name()%></h5>
                        </div>

                        <div class="card-footer text-center">

                            <a class="text-primary upbtn mr-5" data-bs-toggle="modal" data-bs-target="#upvote-modal<%= s.getS_id()%>" style="font-size: 110%" id="<%= s.getS_id()%>s"> Helpful<i class='fa fa-thumbs-up'> <%= s.getUpvotes()%></i></a> 

                            <a class="text-danger downbtn ml-5" data-bs-toggle="modal" data-bs-target="#downvote-modal<%= s.getS_id()%>" style="font-size: 110%" id="<%= s.getS_id()%>s" >Spam<i class="fa fa-thumbs-down"> <%= s.getDownvotes()%></i></a> 

                        </div>
                    </div>
                </div>
                <div class="modal fade" id="downvote-modal<%= s.getS_id()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Your Valuable Feedback is Appreciated!</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <!---->
                                <form action="downvoteServlet" method="post" id="<%= s.getS_id()%>">
                                    <input type="hidden" name="d_email" value="<%= s.getD_email()%>" id="<%= s.getD_email()%>">
                                    <input type="hidden" name="s_name" value="<%= s.getS_name()%>" id="<%= s.getS_name()%>">
                                    <input type="hidden" name="s_id" value="<%= s.getS_id()%>" id="<%= s.getS_id()%>">
                                    <input type="hidden" name="category" value="sm">
                                    <input type="hidden" name="dept" value="<%=s.getS_dept()%>" id="<%=s.getS_dept()%>">
                                    <input type="hidden" name="downvotes" value="<%= s.getDownvotes()%>" id="<%= s.getDownvotes()%>">
                                    <input type="hidden" name="operation" value="downvote"/>    
                                    <p>Please provide the primary reason for this downvote!</p>

                                    <div class="form-group">
                                        <input type="radio" id="impc<%= s.getS_id()%>" name="problem" value="improper content" class="ml-2">
                                        <label for="impc<%= s.getS_id()%>">Improper Content</label>

                                        <input type="radio" id="fd<%= s.getS_id()%>" name="problem" value="false description" class="ml-2">
                                        <label for="fd<%= s.getS_id()%>">False Description</label>

                                        <input type="radio" id="id<%= s.getS_id()%>" name="problem" value="improper donor" class="ml-2">
                                        <label for="id<%= s.getS_id()%>">Improper Donor</label>

                                        <input type="radio" id="ot<%= s.getS_id()%>" name="problem" value="other" class="ml-2">
                                        <label for="ot<%= s.getS_id()%>">Other</label>

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

                <div class="modal fade" id="upvote-modal<%= s.getS_id()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Your Valuable Feedback is Appreciated!</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <!---->
                                <form action="upvoteServlet" method="post" id="<%= s.getS_id()%>">
                                    <input type="hidden" name="d_email" value="<%= s.getD_email()%>" id="<%= s.getD_email()%>">
                                    <input type="hidden" name="s_name" value="<%= s.getS_name()%>" id="<%= s.getS_name()%>">
                                    <input type="hidden" name="s_id" value="<%= s.getS_id()%>" id="<%= s.getS_id()%>">
                                    <input type="hidden" name="category" value="sm">
                                    <input type="hidden" name="dept" value="<%=s.getS_dept()%>" id="<%=s.getS_dept()%>">
                                    <input type="hidden" name="upvotes" value="<%= s.getUpvotes()%>" id="<%= s.getUpvotes()%>">
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
<!--<script src='downvote_confirmation.js'></script>-->

</body>
</html>