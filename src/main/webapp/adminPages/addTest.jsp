<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Add new test </title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: lightgray;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        font-size: 18px; /* Increased font size */
    }
    
    .container {
        background-color: #ffffff;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 20px;
        width: 400px;
        margin: 20px; /* Decreased margin */
    }
    
    h1 {
        text-align: center;
        margin-top: 0;
    }
    
    form {
        display: flex;
        flex-direction: column;
    }
    
    input[type="text"],
    input[type="number"],
    button[type="submit"] {
        margin-bottom: 10px;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 16px;
    }
    
    button[type="submit"] {
        background-color: #f5b700;
        color: white;
        cursor: pointer;
        transition: background-color 0.3s;
        transition: font-size 0.5s;
    }
    
    button[type="submit"]:hover {
        font-size: 18px;
    }
    
    .dashboard-btn {
        float: right;
        background-color: #008CBA;
        color: white;
        border: none;
        border-radius: 4px;
        padding: 10px 20px;
        margin-bottom: 10px;
        cursor: pointer;
        transition: background-color 0.3s;
        transition: font-size 0.5s;
    }
    
    .dashboard-btn:hover {
    	font-size: 17px;
        background-color: #005f79;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>Add new test</h1>
        <form action="../AddTest" method="post">
            <input type="text" name="test_tag" placeholder="Enter test tag" required>
            <input type="number" name="questions" placeholder="Enter number of questions" required >
            <input type="number" name="pass_marks" placeholder="Enter pass marks" required>
            <button type="submit">Add Test</button>
        </form>
            <% 
        String error = request.getParameter("error");
    	String toprint = "";
        if(error != null){
        	if(error.equals("invalid_passing_marks")) toprint = "Pass marks should be between 0 and "+ request.getParameter("ques");
        	else if(error.equals("try_again")) toprint = "Error.";
        	else if(error.equals("invalid_ques")) toprint = "Invalid number of questions";
        	
    %>
    	<p style="font-size:16px;"><%= toprint %>. Try again.</p>
    <%
        }
    %>
        <button class="dashboard-btn"  onclick="redirectToDashboard()">Back to Dashboard</button>
    </div>
    

    
    <script>
	  function redirectToDashboard() {
	    window.location.href = '/TakeTest/AdminDashboard';
	  }
	</script>
</body>
</html>
