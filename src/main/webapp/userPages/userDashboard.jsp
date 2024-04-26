<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.lang.*, dao.Test" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .logout-btn {
        	padding: 6px 10px;
            background-color: #bb0a21;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        
        .btn:hover {
            background-color: #f3a200;
        }
    </style>
</head>
<body>



	<%
        HttpSession session2 = request.getSession(false);
        if (session2 != null && session2.getAttribute("user_id") != null) {
        	int user_id = (int) session2.getAttribute("user_id");
            String name = (String) session2.getAttribute("name");
    %>

      <div class="container">
        <h1>Welcome, <%= name %>!</h1>
        you can <a href="/TakeTest/Logout"> LOGOUT </a> securely.
      </div>
      
      <div class="container">
    <h2> Take your Test </h2>
    <table>
        <tr>
            <th>S. No</th>
            <th>Tag</th>
            <th>No of Questions</th>
            <th>Action</th>
        </tr>
        <% 
            // Assuming 'tests' is the list of Test objects passed from the servlet
            ArrayList<Test> tests = (ArrayList<Test>) request.getAttribute("tests");
            if (tests != null) {
                int serialNumber = 1;
                for (Test test : tests) {
        %>
                    <tr>
                        <td><%= serialNumber++ %></td>
                        <td><%= test.getTestTag() %></td>
                        <td><%= test.getNoOfQuestions() %></td>
                        <td> 
                        	<button class = "btn" onclick = "taketest(<%= test.getTestId() %>, <%= test.getNoOfQuestions() %>)" > Take this Test </button> 
                        </td>
                    </tr>
        <%      }
            }
        %>
    </table>
</div>

    <%
        } else response.sendRedirect("/TakeTest/userPages/userLogin.jsp");
    %>
</body>

    <script>

    function taketest(testId, ques_num) {
        if (confirmTakeTest(ques_num)) {
            window.location.href = "/TakeTest/TestLive?test_id=" + testId + "&ques_num=" + ques_num;
        }
    }

    function confirmTakeTest(ques_num) {
    	var a = "Duration for the test is " + (ques_num * 2) + " minutes";
        return confirm("Ready to take Test?");
    }

    
    </script>
</html>