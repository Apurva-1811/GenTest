<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add new test</title>
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
        margin: 25px; /* Decreased margin */
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
    <%
        HttpSession session2 = request.getSession(false);
        if (session2 != null && session2.getAttribute("username") != null) {
    %>
    <div class="container">
        <h1>Add new test</h1>
        <form action="../AddTest" method="post">
            <label for="test_tag" style="font-size: 14px">Enter Test Tag</label>
            <input type="text" id="test_tag" name="test_tag" placeholder="Test Tag (Max 20 characters)" required maxlength="20">
            
            <label for="questions" style="font-size: 14px; margin-top: 10px">Enter Number of Questions</label>
            <input type="number" id="questions" name="questions" placeholder="Questions (Max 10 ques)" required max="10" min = "1">
            
            <label for="pass_marks" style="font-size: 14px; margin-top: 10px"> Enter Pass Marks</label>
            <input type="number" id="pass_marks" name="pass_marks" min="0" placeholder="Pass marks (considering 1 mark for each question)" required>
            
            <label for="language" style="font-size: 14px; margin-top: 10px">Enter Language</label>
			<input type="text" id="lang" name="lang" placeholder="Programming Language (Max 20 characters)" required maxlength="20">
			
			<label for="topics" style="font-size: 14px; margin-top: 10px">Enter Topics</label>
			<input type="text" id="topic" name="topic" placeholder="Topic Name (Max 20 characters)" required maxlength="20">
			
			<label for="difficulty" style="font-size: 14px; margin-top: 10px">Select a difficulty</label>
			<select id="difficulty" name="difficultyLevel" required style="height: 30px"> 
			    <option value="" selected disabled hidden>None</option>
			    <option value="easy">Easy</option>
			    <option value="medium">Medium</option>
			    <option value="hard">Hard</option>
			</select>
			            
            <button type="submit" style="margin-top: 10px;">Add Test</button>
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
        <button class="dashboard-btn" onclick="redirectToDashboard()">Back to Dashboard</button>
    </div>

    <script>
        function redirectToDashboard() {
            window.location.href = '/TakeTest/AdminDashboard';
        }
    </script>
    
           <%
        } else response.sendRedirect("/TakeTest/adminPages/adminLogin.jsp");
    %>
</body>
</html>
