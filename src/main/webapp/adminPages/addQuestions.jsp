<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Questions</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: lightgray;
    }
    
    .container {
        max-width: 600px;
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
    
    .error {
        color: red;
    }
    
    .questionForm {
        margin-top: 40px;
        display: none; /* Hide all question forms by default */
    }
    
    .questionForm.active {
        display: block; /* Display only the active question form */
    }
    
    label {
        display: block;
        margin-top: 10px;
        color: #555;
    }
    
    input[type="text"],
    input[type="number"] {
        width: calc(100% - 20px);
        padding: 8px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    
    button {
        margin-top: 20px;
        padding: 10px 20px;
        background-color: #f5b700;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: font-size 0.5s;
        
    }
    
    button.goBack {
        background-color: red;
    }
    button:hover {
        font-size: 18px;
    }
    
    .hidden {
        display: none;
    }
</style>
</head>
<body>
    <div class="container">
        <h2>Add Questions</h2>
        
        <% 
            String error = (String) request.getAttribute("error");
            if (error != null && error.equals("invalid passing marks")) {
        %>
           <p class="error">Invalid passing marks entered. Try again</p>
        <%
            }
        %>
        
        <form id="questionForm" action="/TakeTest/AddQuestion" method="post">
            <% 
                String questions = (String) request.getAttribute("ques");
                String test_id = (String) request.getAttribute("testId");
                if (questions != null && test_id != null) {
                    int numberOfQuestions = Integer.parseInt(questions);
                    
                    for (int i = 1; i <= numberOfQuestions; i++) {
            %>
                <div class="questionForm <%= i == 1 ? "active" : "" %>">
                    <h3>Question <%= i  %></h3>
                    
                    <label for="question<%= i %>">Question statement:</label>
                    <input type="text" id="question<%= i %>" name="ques_text<%= i %>" required>
                    
                    <label for="option1<%= i %>">Option 1:</label>
                    <input type="text" id="option1<%= i %>" name="option1<%= i %>" required>
                    
                    <label for="option2<%= i %>">Option 2:</label>
                    <input type="text" id="option2<%= i %>" name="option2<%= i %>" required>
                    
                    <label for="option3<%= i %>">Option 3:</label>
                    <input type="text" id="option3<%= i %>" name="option3<%= i %>" required>
                    
                    <label for="option4<%= i %>">Option 4:</label>
                    <input type="text" id="option4<%= i %>" name="option4<%= i %>" required>
                    
                    <label for="correctAnswer<%= i %>">Correct Answer:</label>
                    <input type="number" id="correctAnswer<%= i %>" name="correctAnswer<%= i %>" required min="1" max="4">
                </div>
            <% 
                    }
                } else {
                    // Handle the case when questions or test_id is null
                    // For example, display an error message or redirect back to the previous page
                }
            %>
            <input type ="hidden" name="num_ques" value = <%= questions %>> 
            <input type="hidden" name="testId" value="<%= test_id %>">
            <button id="prevButton" type="button" class="hidden">Previous</button>
            <button id="nextButton" type="button">Next</button>
            <button type="submit" class="hidden" id="submitButton">Submit Questions</button>
            <b><p id="errorMsg" class="error hidden" style="color: black;">Make sure you have filled all the columns properly.</p></b>
        </form>				
		<button class="goBack" id="deleteTestButton" data-test-id="<%= test_id %>">Go Back</button>
                       
    </div>
    
<script>
    var currentQuestion = 0;
    var questionForms = document.querySelectorAll('.questionForm');
    var nextButton = document.getElementById('nextButton');
    var prevButton = document.getElementById('prevButton');
    var submitButton = document.getElementById('submitButton');
    var goBackButton = document.getElementById('goBackButton');
    var errorMsg = document.getElementById('errorMsg');
    
    // Function to show the current question and handle button states
    function showQuestion() {
        questionForms.forEach(function(form, index) {
            if (index === currentQuestion) {
                form.classList.add('active');
            } else {
                form.classList.remove('active');
            }
        });
        if (currentQuestion === 0) {
            prevButton.classList.add('hidden');
        } else {
            prevButton.classList.remove('hidden');
        }
        if (currentQuestion === questionForms.length - 1) {
            submitButton.classList.remove('hidden');
            nextButton.classList.add('hidden');
        } else {
            submitButton.classList.add('hidden');
            nextButton.classList.remove('hidden');
        }
    }
    
    // Initial setup
    showQuestion();
    
 // Event listener for the Next button
    nextButton.addEventListener('click', function() {
        var inputs = document.querySelectorAll('.questionForm.active input[type="text"], .questionForm.active input[type="number"]');
        var isValid = true;
        inputs.forEach(function(input) {
            if (!input.value.trim()) {
                isValid = false;
            }
        });
        var correctAnswerInput = document.getElementById('correctAnswer' + (currentQuestion + 1));
        if (correctAnswerInput) {
            var correctAnswer = parseInt(correctAnswerInput.value);
            if (isNaN(correctAnswer) || correctAnswer < 1 || correctAnswer > 4) {
                isValid = false;
            }
        }
        if (isValid) {
            currentQuestion++;
            showQuestion();
            errorMsg.classList.add('hidden'); // Hide error message on next click
        } else {
            errorMsg.textContent = "Enter the valid correct option.";
            errorMsg.classList.remove('hidden');
        }
    });

    // Event listener for input fields to hide error message on change
    var formInputs = document.querySelectorAll('.questionForm input[type="text"], .questionForm input[type="number"]');
    formInputs.forEach(function(input) {
        input.addEventListener('input', function() {
            errorMsg.classList.add('hidden');
        });
    });

    
    // Event listener for the Previous button
    prevButton.addEventListener('click', function() {
        currentQuestion--;
        showQuestion();
    });
    
    // Event listener for form submission
    submitButton.addEventListener('click', function() {
        var inputs = document.querySelectorAll('.questionForm.active input[type="text"], .questionForm.active input[type="number"]');
        var isValid = true;
        inputs.forEach(function(input) {
            if (!input.value.trim()) {
                isValid = false;
            }
        });
        // Additional validation for correct answer
        var correctAnswerInput = document.getElementById('correctAnswer' + (currentQuestion + 1));
        if (correctAnswerInput) {
            var correctAnswer = parseInt(correctAnswerInput.value);
            if (isNaN(correctAnswer) || correctAnswer < 1 || correctAnswer > 4) {
                isValid = false;
            }
        }
        if (!isValid) {
            errorMsg.textContent = "Invalid format on question number " + (currentQuestion + 1);
            errorMsg.classList.remove('hidden');
        } else {
            errorMsg.classList.add('hidden');
            // Uncomment the line below to submit the form
             document.getElementById('questionForm').submit();
        }
    });
    
    document.querySelectorAll('.goBack').forEach(item => {
        item.addEventListener('click', event => {
            const testId = event.target.dataset.testId;
            if (confirmGoBack()) {
                window.location.href = "/TakeTest/DeleteTest?test_id=" + testId;
            }
        });
    });

    function confirmGoBack() {
        return confirm("Current test will not be added. Are you sure you want to go back?");
    }
</script>


</body>
</html>
