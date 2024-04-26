<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.lang.*, dao.Question" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit test</title>
</head>
<body>
	
    <button class="dashboard-btn" onclick="redirectToDashboard()">Back to Dashboard</button>

    <h2> All questions: </h2>
        <% 
            // Assuming 'tests' is the list of Test objects passed from the servlet
            ArrayList<Question> questions = (ArrayList<Question>) request.getAttribute("questions");
            if (questions != null) {
                int serialNumber = 1;
                for (Question ques : questions) {
        %>
        <div class="question-item">
            <h3>Question <%= serialNumber %>:</h3>
            <p><strong>Question text:</strong> <%= ques.getQuesText() %></p>
            <p><strong>Option 1:</strong> <%= ques.getOption1() %></p>
            <p><strong>Option 2:</strong> <%= ques.getOption2() %></p>
            <p><strong>Option 3:</strong> <%= ques.getOption3() %></p>
            <p><strong>Option 4:</strong> <%= ques.getOption4() %></p>
            <p><strong>Correct answer:</strong> <%= ques.getCorrectAnswer() %></p>
        </div>
        <% 
                serialNumber++; 
                } 
            } 
        %>
</body>

    <script>
        function redirectToDashboard() {
            window.location.href = '/TakeTest/AdminDashboard';
        }
    </script>
</html>