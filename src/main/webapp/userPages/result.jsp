<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.container {
	display: flex;
	background-color: #fff;
	padding: 40px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 80%;
	max-width: 800px;
}

.left-section {
	flex: 1;
	padding: 20px;
}

.right-section {
	flex: 1;
	display: flex;
	justify-content: center;
	align-items: center;
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
	font-size: 35px;
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
</style>
</head>
<body>

	<%
	HttpSession session2 = request.getSession(false);
	if (session2 != null && session2.getAttribute("user_id") != null) {
		String name = (String) session2.getAttribute("name");
		String test = ((String) session2.getAttribute("test_tag")).toUpperCase();
		int score = (int) request.getAttribute("score");
		int tab_switch = (int) request.getAttribute("tab_switches");
		int total = (int) request.getAttribute("total");
		int passMarks = (int) request.getAttribute("pass_marks");
		int percentage = (score * 100) / total;
		String status = (String) request.getAttribute("status");
		String lang = (String) request.getAttribute("lang");
		String topic = (String) request.getAttribute("topic");
	%>


	<div class="container">

		<div class="left-section">
			<div class="score-card">
				<h1>You <%= status %>ed!</h1>
				<h2>Test: <%= test %> </h2>
				<p>Status: <%= status %></p>
				<p>Test Lang: <%= lang %></p>
				<p>Test Topic: <%= topic %></p>
				<p>
					Test ended at: <span id="current-time"></span>
				</p>
				<b><p class="tab-switches">
						Tab Switches:
						<%=tab_switch%></p></b>
				<div class="actions">
					<a href="/TakeTest/UserDashboard" onclick="return goToDashboard()">Test
						Options</a> <a href="./Logout" onclick="return confirmLogout();"
						class="logout">User Logout</a> <a href="#" onclick="printResults()">Print
						Results</a>
				</div>
			</div>
		</div>
		<div class="right-section">
			<div class="score-graphic">
				<div class="score-graphic-circle"></div>
				<div class="score-graphic-inner <%= (status.equals("pass")) ? "passed" : "failed" %>">
					<span><%=percentage%>%</span>
				</div>
			</div>
		</div>
	</div>

	<form name="submit-to-google-sheet">
		<input type="hidden" name="Name" value="<%=name%>" required> <input
			type="hidden" name="TestTag" value="<%=test%>" required> <input
			type="hidden" name="MaxMarks" value="<%=total%>" required> <input
			type="hidden" name="passMarks" value="<%=passMarks%>" required>
		<input type="hidden" name="MarksScored" value="<%=score%>" required>
		<input type="hidden" name="Percentage" value="<%=percentage%>"
			required> <input type="hidden" name="TabSwitches"
			value="<%=tab_switch%>" required>
	</form>

	<script>
  
	
	const scriptURL = 'https://script.google.com/macros/s/AKfycbwHnQvkEQS3wsGf0rWW8ML2CyPtBDqaxWMMKRRjjSOPBbHPL1sL4y_q4tHi1igRUCJG/exec';
  const form = document.forms['submit-to-google-sheet'];
  document.addEventListener('DOMContentLoaded', (e) => {
	    e.preventDefault();
	    fetch(scriptURL, { method: 'POST', body: new FormData(form) })
	      .then(response => console.log('Success!', response))
	      .catch(error => console.error('Error!', error.message));

  });	
  
  
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

    // Add this script to display the current time
    var currentTime = document.getElementById("current-time");
    var date = new Date();
    var hours = date.getHours();
    var minutes = date.getMinutes();
    var seconds = date.getSeconds();
    var IST = "IST";
    currentTime.innerHTML = hours + ":" + minutes + ":" + seconds + " " + IST;
  </script>

	<%
	} else
	response.sendRedirect("/TakeTest/userPages/userLogin.jsp");
	%>
</body>
</html>