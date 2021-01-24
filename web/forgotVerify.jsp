<%-- 
    Document   : forgotVerify
    Created on : 18 Jan, 2021, 2:50:38 PM
    Author     : maulik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="bootstrap.min.css">


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verify Page</title>
    </head>
    <body>
        <div class="container" >
            <div class="col-lg-4"> </div>
            <div class="col-lg-4">
                <div class="jumbotron" style="margin-top: 150px">
                    <h3>Please Enter verification code!</h3><br>

                    <form action="VerifyCode" method="post">
                        <span>A verification code has been sent to your mail!</span>
                        <input type="text" name="authcode">
                        <input type="submit" class="btn-primary" name="verify">

                    </form>
                </div>
            </div>

            <div class="col-lg-4"></div>
        </div>

    </div>
</div>
</div>

</body>
</html>
