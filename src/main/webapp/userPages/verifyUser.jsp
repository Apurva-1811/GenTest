<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> User Verification </title>
<style>

* {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background-color: #d3d3d3; /* Grey background color */
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

.container {
    width: 40%;
    padding: 30px;
    text-align: center;
    border-radius: 15px;
    border: white;
    background-color: #ffffff; /* White background */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* Box shadow */
}

.container h2 {
    margin-bottom: 20px;
    font-size: 2rem;
}

.container p {
    margin-bottom: 20px;
    font-size: 18px;
}

.code-container {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 20px;
}

.code {
    height: 50px; /* Smaller input height */
    width: 50px; /* Smaller input width */
    border: none; /* No border */
    outline: none; /* Remove outline on focus */
    font-size: 1.5rem;
    text-align: center;
    background-color: #ffffff; /* White background for inputs */
    box-shadow: 0 0 5px rgba(0, 128, 0, 0.5); /* Green box shadow for valid inputs */
    margin: 5px;
}

input[type="number"]::-webkit-inner-spin-button,
input[type="number"]::-webkit-outer-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

button {
    display: inline-block;
    padding: 10px 20px;
    margin: 10px;
    font-size: 1rem;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.button-home {
    background-color: #007bff; /* Blue background color for home button */
    color: #ffffff; /* White text color */
}

.button-verify {
    background-color: #28a745; /* Green background color for verify button */
    color: #ffffff; /* White text color */
}

</style>
</head>
<body>


	<%
	HttpSession session2 = request.getSession(false);
	if (session2 != null && session2.getAttribute("email") != null) {
	%>

	<div class="container">
        <h2>Verify your Account</h2>
        <p>
            We have sent a verification code to your email address. </br>
            Enter the verification code that you received.
        </p>
        <div class="code-container">
        	<form action="/TakeTest/UserRegister" method="post" >
            <input type="number" class="code" name="digit1" placeholder="0" min="0" max="9" maxlength="1" required>
            <input type="number" class="code" name="digit2" placeholder="0" min="0" max="9" maxlength="1" required>
            <input type="number" class="code" name="digit3" placeholder="0" min="0" max="9" maxlength="1" required>
            <input type="number" class="code" name="digit4" placeholder="0" min="0" max="9" maxlength="1" required>
            <input type="number" class="code" name="digit5" placeholder="0" min="0" max="9" maxlength="1" required>
            <input type="number" class="code" name="digit6" placeholder="0" min="0" max="9" maxlength="1" required> <br>
    		<button class="button-verify" type="submit" >Verify</button>
    		
        <button class="button-home" onclick="goToHome()">Go to Home</button>
			</form>
        </div>
    </div>
    
    <script>
    
    const codes = document.querySelectorAll(".code");
    codes[0].focus();

    codes.forEach((code, idx) => {
        code.addEventListener("keydown", (e) => {
            if( e.key >= 0 && e.key <=9){
                codes[idx].value = "";
                setTimeout(() => codes[idx+1].focus(),10);
            }else if( e.key === "Backspace"){
                setTimeout(() => codes[idx-1].focus(),10);
            }
        })
    })
    
    function goToHome(){
    	if(confirm("Back to Home? ")) {
    		window.location.href = "/TakeTest/userPages/userRegister.jsp";
    	}
    }
    
    </script>
    
    <%
	} else{
	response.sendRedirect("/TakeTest/userPages/userRegister.jsp");
	}
	%>

</body>
</html>
