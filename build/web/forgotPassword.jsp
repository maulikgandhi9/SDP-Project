<%-- 
    Document   : forgotPassword
    Created on : 18 Jan, 2021, 10:42:07 AM
    Author     : maulik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        
        <!--<title>JSP Page</title>-->
    </head>
    <body>
        <div class="container" >
            <div class="col-lg-4"> </div>
            <div class="col-lg-4">
                <div class="jumbotron" style="margin-top: 150px">
                    <h3>Please enter your email!</h3><br>
                    
                    <form action="smail" method="post">
                        
                        
                        <div class="form-group">
                            <input type="email" class="form-control" placeholder="Enter DDU email" id="uemail" name="uemail">
                        </div>
                        <span id="errorMessage"></span>
                        
                        <button type="submit" class="btn-primary form-control" id="reset" disabled>Reset Password</button>
                                                
                    </form>
                </div>
            </div>
            
            <div class="col-lg-4"></div>
        </div>
                    
                </div>
            </div>
        </div>
       
        
        <script type="text/javascript" src="forgotPageCheck.js"></script> 
    </body>
</html>
