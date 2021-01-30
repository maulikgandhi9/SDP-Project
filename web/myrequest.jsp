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
                            <input type="submit" formaction="smailAccept" value="Accept" class="btn btn-primary"></input>
                            <input type="submit" formaction="smailReject" value="Reject" class="btn btn-primary"></input>
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

    </body>
</html>
