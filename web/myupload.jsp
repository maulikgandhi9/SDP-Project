<%-- 
    Document   : myupload
    Created on : 24 Jan, 2021, 12:40:01 PM
    Author     : maulik
--%>

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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="bookLandingCSS.css">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


    </head>
    <body>

        <%
//   HttpSession session = request.getSession();
            String name = (String) session.getAttribute("email");
        %>
        <nav class="navbar navbar-dark bg-dark">
            <a class="navbar-brand" href="welcomePage.jsp">Generosity</a>

            <div class="nav navbar-nav navbar-right">
                <a href="index.html" class="navbar-brand"><strong>Logout</strong></a>
            </div>
            <div class="nav navbar-nav navbar-center">
                <span id="welcomeMessage">Hello, <%=name%></span>
            </div>
            <div class="nav navbar-nav">
                <a href="myupload.jsp" value="My uploads" style="margin-left: 1325px; margin-top: -70px; color: white; text-decoration: underline">My Uploads</a>
            </div>


        </nav>

        <div class="container">
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
        <script src='delete_confirmation.js'></script>
    </body>
</html>
