<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>
	    <link rel="stylesheet" href="UserResources/fonts/icomoon/style.css">
	    <link rel="stylesheet" href="UserResources/css/owl.carousel.min.css">
	    <link rel="stylesheet" href="UserResources/css/bootstrap.min.css">
	    <link rel="stylesheet" href="UserResources/css/newStyle.css">
    <style>
        .btn-link {
            display: inline-block;
            padding: 5px 10px;
            margin-top: 10px;
            text-decoration: none;
            color: #fff;
            background-color: #333;
            border: 1px solid #333;
            border-radius: 5px;
        }

        .btn-link:hover {
        	color: black;
            background-color: #f5b700;
            border: 1px solid #f5b700;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .btn-link:focus, .btn-link:hover, .btn-link:active {
            text-decoration: none;
            outline: none;
            border: none;
        }
    </style>
</head>
<body>

<div class="d-lg-flex half">
    <div class="bg order-1 order-md-2" style="background-image: url('../logo-white.png');"></div>
    <div class="contents order-2 order-md-1">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-md-7">
                    <h1>Register as <br><strong><span style="color: #F5B700; font-size: 4rem;">User</span></strong></h1>
                    <form action="/TakeTest/UserRegister" method="post">
                        <div class="form-group first" style="border: 2px solid #ccc; border-radius: 10px; padding: 10px;">
                            <label for="name"><b>Enter your username</b></label>
                            <input type="text" class="form-control" placeholder="Username" required id="name" name="name" style="border-radius: 5px;" required>
                        </div>
                        <div class="form-group" style="border: 2px solid #ccc; border-radius: 10px; padding: 10px;">
                            <label for="mobile"><b>Enter your mobile number</b></label>
                            <input type="tel" class="form-control" placeholder="Mobile" id="mobile" required name="mobile" style="border-radius: 5px;" required>
                        </div>
                        <div class="form-group last mb-3" style="border: 2px solid #ccc; border-radius: 10px; padding: 10px;">
                            <label for="password"><b>Enter your password</b></label>
                            <input type="password" class="form-control" placeholder="Password" required id="password" name="password" style="border-radius: 5px;" required>
                        </div>
                        
                        <input type="submit" value="Register" class="btn btn-block btn-warning">
                    </form>
                    <% 
                        String error = request.getParameter("error");
                    	String toprint = "";
                        if(error != null){
                        	if(error.equals("need 10 digits")) toprint = "Mobile should have 10 digits.";
                        	if(error.equals("mobile invalid")) toprint = "Invalid mobile number.";
                        	if(error.equals("user_already_exists")) toprint = "Already registered with this mobile.";
                        	
                    %>
                    <p><%= toprint %> Try again</p>
                    <%
                        }
                    %>
                    <div class="text-center">
                        <a href="/TakeTest/index.html" class="btn-link">Back to Home</a>
                        <a href="/TakeTest/userPages/userLogin.jsp" class="btn-link">Already a User, Login</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="UserResources/js/jquery-3.3.1.min.js"></script>
<script src="UserResources/js/popper.min.js"></script>
<script src="UserResources/js/bootstrap.min.js"></script>
<script src="UserResources/js/main.js"></script>

</body>
</html>
