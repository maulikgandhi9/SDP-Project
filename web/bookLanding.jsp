<%-- 
    Document   : bookLanding
    Created on : 20 Jan, 2021, 9:55:58 PM
    Author     : maulik
--%>

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

        <!--<link rel="stylesheet" href="bootstrap.min.css">-->

        <!--        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
        <!--        <link rel="stylesheet" href="bootstrap.css">
        --><link rel="stylesheet" href="bookLandingCSS.css">



        <title>Books and Equipments</title>
    </head>
    <body>
        <%
//   HttpSession session = request.getSession();
            String name = (String) session.getAttribute("email");
        %>
        <nav class="navbar navbar-dark bg-dark">
            <a class="navbar-brand" href="#">Generosity</a>

            <div class="nav navbar-nav navbar-right">
                <a href="index.html" class="navbar-brand"><strong>Logout</strong></a>
            </div>
            <div class="nav navbar-nav navbar-center">
                <span id="welcomeMessage">Hello, <%=name%></span>
            </div>
            <div class="nav bavbar-nav">
                <a href="myupload.jsp" value="My uploads" style="margin-left: 1325px; margin-top: -70px; color: white; text-decoration: underline">My Uploads</a>
            </div>


        </nav>

        <div class="container">
            <div class="row mt-5">
                <div class="col-lg-12">
                    <div class="card" data-bs-toggle="modal" data-bs-target="#add-book-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 200px; margin-left: -5px"class="img-fluid rounded-circle" src="plus.jpg" alt="add">
                            </div>
                            <p class="mt-2">Click here to upload a book!</p>
                            <h1 class="text-uppercase text-muted">Books</h1>
                        </div>
                    </div>
                </div>
            </div>
            <%
                bookDAO bd = new bookDAO(FactoryProvider.getFactory());
                List<Book> list = bd.getBooks();
            %>

            <div class="row">
                <%
                    for (Book b : list) {
                        if (!b.getD_email().equals(session.getAttribute("email"))) {
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

                        <div class="card-footer text-center">
                            <form method="post" action="smailRequest">
                                <input type="hidden" name="d_email" value="<%= b.getD_email()%>">
                                <input type="hidden" name="b_name" value="<%= b.getB_name()%>">
                                <input type="submit" class="btn btn-success" value="Want it"></input>
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
</body>
</html>