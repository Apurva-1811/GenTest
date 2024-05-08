<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.lang.*, dao.Question" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Test</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f2f2f2;
    }

    .container {
        max-width: 800px;
        margin: 40px auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h2 {
        margin-top: 0;
        text-align: center;
        color: #333;
    }

    .question-item {
    position: relative;
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 20px;
    margin-bottom: 20px;
    background-color: lightgray;
}

.close-icon {
    position: absolute;
    top: 5px;
    right: 5px;
    cursor: pointer;
    width: 23px; /* Adjust the size of the icon */
    height: 23px; /* Adjust the size of the icon */
    background-color: red; /* Set the background color to red */
    border-radius: 5px; /* Make the icon circular */
    display: flex;
    justify-content: center;
    align-items: center;
    color: white; /* Set the color of the icon to white */
    font-size: 14px; /* Adjust the font size of the icon */
    transition: background-color 0.3s, color 0.3s; /* Add transition effects */
}

.close-icon:hover {
    background-color: darkred; /* Change the background color on hover */
}



    .question-item h3 {
        margin-top: 0;
        color: #333;
    }

    .question-item input[type="text"] {
        width: 100%;
        padding: 8px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 5px;
        max-width: 700px;
        margin-right: 100px;
    }

    .question-item input[type="number"] {
        width: 50px;
        padding: 8px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .dashboard-btn {
        display: block;
        margin: 20px auto 0;
        padding: 10px 20px;
        background-color: #f5b700;
        color: black;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: font-size 0.5s;
    }

    .dashboard-btn:hover, .add-ques:hover {
        background-color: #f3a200;
        font-size: 16px;

    }

    .save-btn {
        display: block;
        margin: 20px auto 0;
        padding: 10px 20px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: font-size 0.5s;
        font-size: 15px;
    }
    .add-ques {
    	display: block;
        padding: 8px 15px;
        font-size: 15px;
        background-color: #f5b700;
        color: black;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: font-size 0.5s;
    }

    .save-btn:hover {
        background-color: #45a049;
        font-size: 17px;
    }
</style>
</head>
<body>
    <%
        HttpSession session2 = request.getSession(false);
        if (session2 != null && session2.getAttribute("username") != null) {
        	int test_id = (int)session.getAttribute("test_id");
        	int passmarks = (int)request.getAttribute("pass_marks");
        	String topic = (String)request.getAttribute("topic");
        	String lang = (String)request.getAttribute("lang");
            ArrayList<Question> questions = (ArrayList<Question>) request.getAttribute("questions");
    %>
    <div class="container">
    
        <h2>Edit Questions</h2>
        
        <form id="questionForm" action="/TakeTest/DummyQues" method="post">
        	<input type="hidden" name="test_id" value="<%= test_id %>">
			<button type="submit" class="add-ques" id="addQuestionBtn">Add a new Question</button>
		</form>
		<br>
        
        <form id="editQuestionForm" action="/TakeTest/UpdateTest" method="post">
        
            <label for="pass_marks">Pass Marks:</label>
            <input type="number" id="pass_marks>" name="pass_marks" value="<%= passmarks %>" style="margin-bottom: 15px;" required min="0" max="<%= questions.size() %>" > 
            
            <label for="lang">Language:</label>           
            <input type="text" id="lang>" name="lang" value="<%= lang %>" style="margin-bottom: 15px;" required maxlength="20" >
            
            <label for="topic">Test Topic:</label>
            <input type="text" id="topic" name="topic" value="<%= topic %>" style="margin-bottom: 15px;" required maxlength="20" >
            
            <input type="hidden" id="num_ques" name="num_ques" value="<%= questions.size() %>">
            
        <% 
            if (questions.size() != 0) {
                int serialNumber = 1;
                for (Question ques : questions) {
        %>
        <div class="question-item">
        
        <span class="close-icon"  onclick="deleteQues(<%= ques.getQuesId()%>)">X</span>
            <h3>Question <%= serialNumber %>:</h3>
            <input type="hidden" name="questionId<%= serialNumber %>" value="<%= ques.getQuesId() %>">
            
            <label for="question<%= serialNumber %>" style="font-size: 14px;">Question text:</label>
            <input type="text" id="question<%= serialNumber %>" name="ques_text<%= serialNumber %>" value="<%= ques.getQuesText() %>" style="margin-bottom: 5px;" required>
            
            <label for="option1<%= serialNumber %>" style="font-size: 14px;">Option 1:</label>
            <input type="text" id="option1<%= serialNumber %>" name="option1<%= serialNumber %>" value="<%= ques.getOption1() %>" style="margin-bottom: 5px;" required>
            
            <label for="option2<%= serialNumber %>" style="font-size: 14px;">Option 2:</label>
            <input type="text" id="option2<%= serialNumber %>" name="option2<%= serialNumber %>" value="<%= ques.getOption2() %>" style="margin-bottom: 5px;" required>
            
            <label for="option3<%= serialNumber %>" style="font-size: 14px;">Option 3:</label>
            <input type="text" id="option3<%= serialNumber %>" name="option3<%= serialNumber %>" value="<%= ques.getOption3() %>" style="margin-bottom: 5px;" required>
            
            <label for="option4<%= serialNumber %>" style="font-size: 14px;">Option 4:</label>
            <input type="text" id="option4<%= serialNumber %>" name="option4<%= serialNumber %>" value="<%= ques.getOption4() %>" style="margin-bottom: 5px;" required>
            
            <label for="correctAnswer<%= serialNumber %>" style="font-size: 14px;">Correct Answer:</label>
            <input type="number" id="correctAnswer<%= serialNumber %>" name="correctAnswer<%= serialNumber %>" value="<%= ques.getCorrectAnswer() %>" style="margin-bottom: 5px;" required min="1" max="4">
        </div>
        <% 
                serialNumber++; 
                } 
            } 
        %>
        
        
    
   		 <button type="submit" class="save-btn">Save Changes</button>
    </form>
    	<button class="dashboard-btn" onclick="redirectToDashboard()">Back to Dashboard</button>
	</div>

    <script>
    
    function isAnyInputEmpty() {
        var inputs = document.querySelectorAll('input');
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].value.trim() === '') {
                return true;
            }
        }
        return false;
    }
    
    function redirectToDashboard() {
        if (isAnyInputEmpty()) {
            alert("Please fill in all the required fields before going back to the dashboard.");
        } else {
            window.location.href = '/TakeTest/AdminDashboard';
        }
    }
       
        function deleteQues(quesId) {
            var confirmDelete = confirm("Are you sure you want to delete this question?");
            if (confirmDelete) {
        	    window.location.href = "/TakeTest/DeleteTest?what=ques&ques_id=" + quesId;
            }
        }
    </script>
    
            <%
        } else response.sendRedirect("/TakeTest/adminPages/adminLogin.jsp");
    %>
</body>
</html>
