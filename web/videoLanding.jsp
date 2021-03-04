<%-- 
    Document   : bookLanding
    Created on : 20 Jan, 2021, 9:55:58 PM
    Author     : maulik
--%>

<%@page import="entities.Video"%>
<%@page import="dao.videoDAO"%>
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
        <title>Book Landing</title>
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
        <link rel="stylesheet" href="videoLandingCSS.css">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>





        <title>Books and Equipments</title>
    </head>
    <body style="color: ">
        <%
//   HttpSession session = request.getSession();
            String name = (String) session.getAttribute("fname") + " " + (String) session.getAttribute("lname");
        %>


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




        <!--</nav>-->

        <div class="container">

            <div class="row">

                <%
                    videoDAO vd = new videoDAO(FactoryProvider.getFactory());
                    List<Video> v_list = vd.getVideos();
                %>

                <%
                    for (Video v : v_list) {
                        if (!v.getD_email().equals(session.getAttribute("email"))) {
                %>
                <div class="col-lg-4 mt-4">


                    <div class="card mt-4 mb-2 h-70">

                        <div class="card-body">


                            <video style="max-height: 1000px; max-width: 100%; width: auto" poster="<%= v.getV_thumbnail()%>">
                                <source src="<%= v.getV_path()%>">
                            </video>


                        </div>

                        <div class="card-footer text-center">
                            <h5 class="card-title"><%= v.getV_name()%></h5>
                        </div>

                        <div class="card-footer text-center">

                            <a class="text-primary upbtn mr-5" data-bs-toggle="modal" data-bs-target="#upvote-modal<%= v.getV_id()%>" style="font-size: 110%" id="<%= v.getV_id()%>s"> Helpful<i class='fa fa-thumbs-up'> <%= v.getUpvotes()%></i></a> 

                            <a class="text-danger downbtn ml-5" data-bs-toggle="modal" data-bs-target="#downvote-modal<%= v.getV_id()%>" style="font-size: 110%" id="<%= v.getV_id()%>s" >Spam<i class="fa fa-thumbs-down"> <%= v.getDownvotes()%></i></a>  
                        </div>

                    </div>
                </div>
                <div class="modal fade" id="downvote-modal<%= v.getV_id()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Your Valuable Feedback is Appreciated!</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <!---->
                                <form action="downvoteServlet" method="post" id="<%= v.getV_id()%>">
                                    <input type="hidden" name="d_email" value="<%= v.getD_email()%>" id="<%= v.getD_email()%>">
                                    <input type="hidden" name="v_name" value="<%= v.getV_name()%>" id="<%= v.getV_name()%>">
                                    <input type="hidden" name="v_id" value="<%= v.getV_id()%>" id="<%= v.getV_id()%>">
                                    <input type="hidden" name="category" value="video">
                                    <input type="hidden" name="downvotes" value="<%= v.getDownvotes()%>" id="<%= v.getDownvotes()%>">
                                    <input type="hidden" name="operation" value="downvote"/>    
                                    <p>Please provide the primary reason for this downvote!</p>

                                    <div class="form-group">
                                        <input type="radio" id="impc<%= v.getV_id()%>" name="problem" value="improper content" class="ml-2">
                                        <label for="impc<%= v.getV_id()%>">Improper Content</label>

                                        <input type="radio" id="fd<%= v.getV_id()%>" name="problem" value="false description" class="ml-2">
                                        <label for="fd<%= v.getV_id()%>">False Description</label>

                                        <input type="radio" id="id<%= v.getV_id()%>" name="problem" value="improper donor" class="ml-2">
                                        <label for="id<%= v.getV_id()%>">Improper Donor</label>

                                        <input type="radio" id="ot<%= v.getV_id()%>" name="problem" value="other" class="ml-2">
                                        <label for="ot<%= v.getV_id()%>">Other</label>

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

                <div class="modal fade" id="upvote-modal<%= v.getV_id()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Your Valuable Feedback is Appreciated!</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <!---->
                                <form action="upvoteServlet" method="post" id="<%= v.getV_id()%>">
                                    <input type="hidden" name="d_email" value="<%= v.getD_email()%>" id="<%= v.getD_email()%>">
                                    <input type="hidden" name="v_name" value="<%= v.getV_name()%>" id="<%= v.getV_name()%>">
                                    <input type="hidden" name="v_id" value="<%= v.getV_id()%>" id="<%= v.getV_id()%>">
                                    <input type="hidden" name="category" value="video">
                                    <input type="hidden" name="upvotes" value="<%= v.getUpvotes()%>" id="<%= v.getUpvotes()%>">
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
<script src='request_confirmation.js'></script>
<script src='video.js'></script>

</body>
</html>
