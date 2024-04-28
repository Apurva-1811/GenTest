<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Test Result</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: lightgray;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 100vh;
      }
      .container {
        display: flex;
        flex-direction: column;
        align-items: center;
        background-color: #fff;
        padding: 40px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 80%;
        max-width: 800px;
      }
      .score-card {
        text-align: center;
        margin-bottom: 20px;
      }
      .score-card h1 {
        margin-top: 0;
        color: #333;
      }
      .score-card h2 {
        margin-top: 0;
        color: #333;
      }
      .score-graphic {
        position: relative;
        width: 150px;
        height: 150px;
        margin-bottom: 20px;
      }
      .score-graphic-inner {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        color: white;
        padding: 20px;
        border-radius: 50%;
        width: 100px;
        height: 100px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        font-size: 40px;
        font-weight: bold;
      }
      .score-graphic-inner.passed {
        background-color: green;
      }
      .score-graphic-inner.failed {
        background-color: red;
      }
      .score-graphic-circle {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        border-radius: 50%;
        border: 10px solid #ccc;
        box-sizing: border-box;
        display: flex;
        justify-content: center;
        align-items: center;
        overflow: hidden;
      }
      .score-graphic-circle:before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        width: 50%;
        height: 100%;
        background-color: #007bff;
        border-radius: 50% 0 0 50%;
        transform-origin: right center;
        transform: rotate(180deg);
      }
      .actions {
        display: flex;
        justify-content: center;
        margin-top: 20px;
      }
      .actions a {
        display: block;
        margin: 0 10px;
        padding: 10px 20px;
        background-color: #f5b700;
        color: white;
        text-align: center;
        text-decoration: none;
        border-radius: 5px;
        cursor: pointer;
        transition: font-size 0.5s;
      }
      .actions a.logout {
        background-color: red;
      }
      .actions a:hover {
        font-size: 18px;
      }
      .review-questions {
        margin-top: 20px;
        text-align: left;
      }
      .review-questions h2 {
        color: #333;
      }
      .review-questions ul {
        list-style-type: none;
        padding: 0;
      }
      .review-questions li {
        margin-bottom: 10px;
      }
      .review-questions .correct {
        color: green;
      }
      .review-questions .incorrect {
        color: red;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <% 
        HttpSession session2 = request.getSession(false);
        if (session2 != null && session2.getAttribute("user_id") != null) {
          String name = (String) session2.getAttribute("name");
          String test = ((String)session2.getAttribute("test_tag")).toUpperCase();
          int score = (int) request.getAttribute("score");
          int total = (int) request.getAttribute("total");
          int passMarks = (int)request.getAttribute("pass_marks");
      %>
      <div class="score-card">
        <% if (score >= passMarks) { %>
          <h1>Congratulations! You have passed!</h1>
        <% } else { %>
          <h1>Sorry, better luck next time!</h1>
        <% } %>
        <h2>Test: <%= test %> </h2>
        <h1>Your Score: <%= score %> / <%= total %></h1>
      </div>
      <div class="score-graphic">
        <div class="score-graphic-circle"></div>
        <div class="score-graphic-inner <%= (score >= passMarks) ? "passed" : "failed" %>">
          <span><%= score %></span>
        </div>
      </div>
      <div class="actions">
        <a href="/TakeTest/UserDashboard" onclick="return goToDashboard()">Test Options</a>
        <a href="./Logout" onclick="return confirmLogout();" class="logout">Logout</a>
        <a href="#" onclick="printResults()">Print Results</a>
      </div>

      <%} else
        response.sendRedirect("/TakeTest/userPages/userLogin.jsp");%>
    </div>

    <script>
      function confirmLogout() {
        return confirm("Do you want to log out?");
      }

      function printResults() {
        window.print();
      }

      function goToDashboard() {
        if (confirm("Check other test options?")) return true;
        else return false;
      }
    </script>
  </body>
</html>
