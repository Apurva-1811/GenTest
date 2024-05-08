<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.lang.*, dao.Test"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f2f2f2;
	background-color: #ffffff;
}

header {
	background-color: #333;
	color: #fff;
	padding: 10px 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

header h1 {
	margin: 0;
}

.header-buttons {
	display: flex;
	align-items: center;
}

.header-buttons a {
	color: #fff;
	text-decoration: none;
	padding: 5px 10px;
	margin-left: 10px;
	border: 1px solid #fff;
	border-radius: 5px;
}

.header-buttons a:hover {
	background-color: #f5b700;
	color: #333;
	border: 1px solid #f5b700;
	border-radius: 5px;
}

.container {
	background-color: lightgray;
	width: 80vw;
	margin: 80px auto 20px;
	padding: 20px;
	background-color: #f2f2f2;
	border-radius: 10px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ddd;
	border: 1px solid darkgray;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #333;
	color: #fff;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

.btn {
	padding: 6px 10px;
	background-color: #f5b600;
	color: black;
	font-size: 13px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.logout-btn {
	padding: 6px 10px;
	background-color: red;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

#displaymsg{
	font-size: 20px;
}

.btn:hover {
	background-color: #f3a200;
}
</style>


</head>
<body>

	<%
	HttpSession session2 = request.getSession(false);
	if (session2 != null && session2.getAttribute("username") != null) {
		ArrayList<Test> tests = (ArrayList<Test>) request.getAttribute("tests");
		ArrayList<String> allTopics = (ArrayList<String>) request.getAttribute("allTopics");
		ArrayList<String> allLang = (ArrayList<String>) request.getAttribute("allLang");
	%>

	<header>
		<h1>
			Take<span style="color: #f5b700;">Test</span>
		</h1>
		<div class="header-buttons">
			<a href="/TakeTest/adminPages/addTest.jsp">Add New Test</a> 
			<a href="./Logout" onclick="return confirmLogout();">Logout</a>
		</div>
	</header>

	<div class="container">
		<h2>Display All Tests</h2>
		
		<div style="margin-bottom: 10px;">
		<form action="/TakeTest/FilterTest" method="post">
	
            <input type="hidden" id="person" name="person" value="admin" >
			<label for="languageSelect">Select Language:</label> <select id="languageSelect" name="languageSelect">
			<option value="all" selected>All</option>
			<% 
				for(String lang: allLang){
			%>
				<option value = "<%= lang%>"> <%= lang%>  </option>
			<%
				}
			%>
			
			</select> <label for="topicSelect" style="margin-left: 10px;">Select Topic:</label> <select id="topicSelect" name="topicSelect">
			<option value="all" selected>All</option>
			
			<% 
				for(String topic: allTopics){
			%>
				<option value = "<%= topic%>"> <%= topic%>  </option>
			<%
				}
			%>
			</select>
			<label for="DifficultyLevel" style="margin-left: 10px;">Select Difficulty Level:</label> <select id="DifficultyLevel" name="DifficultyLevel">
			<option value="all" selected>All</option>
			<option value = "easy"> Easy </option>
			<option value = "medium"> Medium  </option>
			<option value = "hard"> Hard </option>
			</select>

			<button class="btn" onclick="searchTests()" style="margin-left: 15px;">Search</button>
			</form>
		</div>
		
		<% if(tests.size() > 0) { %>

		<table>
			<tr>
				<th>S. No</th>
				<th>Tag</th>
				<th>No of Questions</th>
				<th>No of People Who Took the Test</th>
				<th>Language</th>
				<th>Topic</th>
				<th>Difficulty Level</th>
				<th>Action</th>
			</tr>
			<%
				int serialNumber = 1;
				for (Test test : tests) {
			%>
			<tr>
				<td><%=serialNumber++%></td>
				<td><%=test.getTestTag()%></td>
				<td><%=test.getNoOfQuestions()%></td>
				<td><%=test.getNoOfCandidates()%></td>
				<td><%=test.getLang()%></td>
				<td><%=test.getTopic()%></td>
				<td><%=test.getLevel() %></td>
				<td>
					<button class="btn" onclick="editTest(<%=test.getTestId()%>)">
						<img width="20" height="20"
							src="https://img.icons8.com/ios/20/pen.png" alt="waste" />
					</button>
					<button class="logout-btn" id="deleteTestButton"
						onclick="deleteTest(<%=test.getTestId()%>)">
						<img width="20" height="20"
							src="https://img.icons8.com/ios/20/000000/waste.png" alt="waste" />
					</button>

				</td>
			</tr>
			<%
			}
			%>
		</table>
		<%
		} else {
		%>

		<p id = "displaymsg">No tests available.</p>

		<%
		}
		%>
	</div>

	<script>
    
    function editTest(testId) {
        const form = document.createElement('form');
        form.setAttribute('method', 'post');
        form.setAttribute('action', '/TakeTest/EditTest');

        const testIdInput = document.createElement('input');
        testIdInput.setAttribute('type', 'hidden');
        testIdInput.setAttribute('name', 'test_id');
        testIdInput.setAttribute('value', testId);

        form.appendChild(testIdInput);
        document.body.appendChild(form);
        form.submit();
    } 


    function deleteTest(testId){
    	if (confirmTestDeletion()) {
    	    window.location.href = "/TakeTest/DeleteTest?what=test&test_id=" + testId;
        }
    }

    function confirmTestDeletion() {
        return confirm("Are you sure you want to delete this test?");
    }	
    
    function confirmLogout(){
    	return confirm("Do you want to log out?");
    }
    
    </script>

	<%
	} else
	response.sendRedirect("/TakeTest/adminPages/adminLogin.jsp");
	%>

</body>
</html>
