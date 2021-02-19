<%-- 
    Document   : myrequest
    Created on : 30 Jan, 2021, 1:52:41 PM
    Author     : maulik
--%>

<%@page import="java.util.List"%>
<%@page import="entities.Request"%>
<%@page import="dao.requestDAO"%>
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
            <%
                requestDAO bd = new requestDAO(FactoryProvider.getFactory());
                List<Request> list = bd.getRequests();
            %>

            <table class="table">
                <tr>
                    <th>Request ID</th>
                    <th>Requester_email</th>
                    <th>Resource Name</th>
                    <th>Request Status</th>
                    <th>Accept/Reject</th>
                </tr>
                <%
                    for (Request req : list) {
                        if (req.getD_email().equals(session.getAttribute("email"))) {

                %>
                <tr>
                    <td><%=req.getReq_id()%></td>
                    <td><%=req.getR_email()%></td>
                    <td><%=req.getRes_name()%></td>
                    <td><%=req.getReq_status()%></td>
                    <%
                        if (req.getReq_status().equalsIgnoreCase("pending")) {
                    %>
                    <td>
                        <form method="post" id="<%=req.getReq_id()%>" >
                            <input type="hidden" name="r_email" value="<%= req.getR_email()%>">
                            <input type="hidden" name="d_email" value="<%= req.getD_email()%>">
                            <input type="hidden" name="res_name" value="<%= req.getRes_name()%>">
                            <input type="hidden" name="req_id" value="<%= req.getReq_id()%>">
                            <input type="hidden" name="category" value="<%= req.getCategory()%>">
                            <input type="submit" formaction="smailAccept" value="Accept" class="btn btn-success"></input>
                            <input type="submit" formaction="smailReject" value="Reject" class="btn btn-danger"></input>
                        </form>
                    </td>
                    <%
                        }
                    %>
                </tr>
                <%                        }
                    }
                %>
            </table>

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
    </body>
</html>
