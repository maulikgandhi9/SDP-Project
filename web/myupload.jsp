<%-- 
    Document   : myupload
    Created on : 24 Jan, 2021, 12:40:01 PM
    Author     : maulik
--%>

<%@page import="entities.Video"%>
<%@page import="dao.videoDAO"%>
<%@page import="entities.Equipment"%>
<%@page import="dao.equipmentDAO"%>
<%@page import="helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="entities.Book"%>
<%@page import="dao.bookDAO"%>
<%@page import="helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Uploads</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">


        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="bookLandingCSS.css">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


    </head>
    <body>

        <%
//   HttpSession session = request.getSession();
            String name = (String) session.getAttribute("fname") + " " + (String) session.getAttribute("lname");
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
                                <a class="dropdown-item" href="index.html">Logout</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav> 

        <div class="container">
            <h1 class="mt-5 text-center text-warning bg-dark">Books And Equipments</h1>
            <%
                bookDAO bd = new bookDAO(FactoryProvider.getFactory());
                List<Book> list = bd.getBooks();
            %>

            <div class="row">
                <%
                    for (Book b : list) {
                        if (b.getD_email().equals(session.getAttribute("email"))) {
                %>
                <div class="col-lg-4">
                    <div class="card mt-4 mb-2 h-100">
                        <div class="container text-center">
                            <img src="<%= b.getB_image()%>" style="max-height: 350px; max-width: 100%; width: auto" class="card-image-top" alt="<%= b.getB_name()%>">
                        </div> 
                        <div class="card-body">
                            <h5 class="card-title"><%= b.getB_name()%></h5>
                            <p class="card-text"><%= Helper.get20Words(b.getB_desc())%></p>
                        </div>

                        <div class="card-footer text-center" >
                            <form method="post" action="deletePost" id="<%= b.getB_id()%>">
                                <input type="hidden" name="d_email" value="<%= b.getD_email()%>">
                                <input type="hidden" name="b_name" value="<%= b.getB_name()%>">
                                <input type="hidden" name="b_desc" value="<%= b.getB_desc()%>">
                                <input type="hidden" name="b_id" value="<%= b.getB_id()%>">
                                <input type="hidden" name="b_image" value="<%= b.getB_image()%>">
                                <input type="hidden" name="category" value="book">
                                <input type="button" class="btn btn-danger delBook" id="<%= b.getB_id()%>" value="Delete this Book"></input>

                                <!--<input type="button" onclick="return confirm('Are you sure you want to delete this book?')" class="btn btn-danger" value="Delete this book"></input>-->
                            </form>
                        </div>
                    </div>
                </div>

                <%
                        }
                    }

                    equipmentDAO ed = new equipmentDAO(FactoryProvider.getFactory());
                    List<Equipment> e_list = ed.getEquipments();
                %>
                <%
                    for (Equipment e : e_list) {
                        if (e.getD_email().equals(session.getAttribute("email"))) {
                %>

                <div class="col-lg-4">
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
                                <input type="hidden" name="e_desc" value="<%= e.getE_desc()%>">
                                <input type="hidden" name="e_name" value="<%= e.getE_name()%>">
                                <input type="hidden" name="e_id" value="<%= e.getE_id()%>">
                                <input type="hidden" name="e_image" value="<%= e.getE_image()%>">
                                <input type="hidden" name="category" value="equipment">


                                <div class="card">
                                    <!--<input type="submit" class="btn btn-success" value="Want it" onclick=" return swal('Confirmation' ,'Are you sure you want to request?',{buttons: ['Oh noez!', 'Aww yiss!'],})"></input>-->
                                    <input type="button" class="btn btn-danger delEqu" id="<%= e.getE_id()%>" value="Delete this Equipment"></input>


                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <%
                        }
                    }
                %>
            </div>
        </div>

        <div class="container">
                <h1 class="mt-5 text-center text-warning bg-dark">Videos</h1>
            <%
                videoDAO vd = new videoDAO(FactoryProvider.getFactory());
                List<Video> v_list = vd.getVideos();
            %>

            <div class="row">
                <%
                    for (Video v : v_list) {
                        if (v.getD_email().equals(session.getAttribute("email"))) {
                %>
                <div class="col-lg-4 mt-4">
                    <div class="card mt-4 mb-2 h-70">
                                              
                        <div class="card-body">
                            <video style="max-height: 350px; max-width: 100%; width: auto" poster="<%= v.getV_thumbnail()%>" controls>
                                <source src="<%= v.getV_path()%>">
                            </video>
                            <h5 class=" mt-2 text-center card-title"><%= v.getV_name()%></h5>

                        </div>

                        <div class="card-footer text-center">
                            <form method="post" action="deletePost" id="<%= v.getV_id()%>">
                                <input type="hidden" name="d_email" value="<%= v.getD_email()%>">
                                <input type="hidden" name="v_name" value="<%= v.getV_name()%>">
                                <input type="hidden" name="v_id" value="<%= v.getV_id()%>">
                                <input type="hidden" name="v_image" value="<%= v.getV_thumbnail()%>">
                                <input type="hidden" name="v_path" value="<%= v.getV_path()%>">
                                <input type="hidden" name="category" value="video">
                                <input type="button" class="btn btn-danger delBook" id="<%= v.getV_id()%>" value="Delete this Video"></input>

                                <!--<input type="button" onclick="return confirm('Are you sure you want to delete this book?')" class="btn btn-danger" value="Delete this book"></input>-->
                            </form>
                        </div>


                    </div>
                </div>

                <%
                        }
                    }

                %>
            </div>
        </div>

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
        <script src='delete_confirmation.js'></script>
    </body>
</html>
