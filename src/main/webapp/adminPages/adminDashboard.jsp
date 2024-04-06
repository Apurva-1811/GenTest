<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.lang.*, dao.Test" %>

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

<header>
    <h1>Take<span style="color: #f5b700;">Test</span></h1>
    <div class="header-buttons">
        <a href="/TakeTest/adminPages/addTest.jsp">Add New Test</a>
        <a href="./Logout" onclick="return confirmLogout();">Logout</a>
    </div>
</header>

<div class="container">
    <h2>Display All Tests</h2>
    <table>
        <tr>
            <th>S. No</th>
            <th>Tag</th>
            <th>No of Questions</th>
            <th>No of People Who Took the Test</th>
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
                        <td><%= test.getNoOfCandidates() %></td>
                        <td>
                            <button class="btn" onclick="window.location.href='editTest?id=<%= test.getTestId() %>'">Edit</button>
                         <!-- 
                         	<a href="/TakeTest/DeleteTest?test_id=<%= test.getTestId() %>"> 
                            <button class="logout-btn" id="deleteTestButton">Delete</button>   </a>
                          -->   
                            
                            <button class="logout-btn" id="deleteTestButton" data-test-id="<%= test.getTestId() %>">Delete</button>
                       
                        </td>
                    </tr>
        <%      }
            }
        %>
    </table>
    
    <script>
    document.querySelectorAll('.logout-btn').forEach(item => {
        item.addEventListener('click', event => {
            const testId = event.target.dataset.testId;
            if (confirmTestDeletion()) {
                window.location.href = "/TakeTest/DeleteTest?test_id=" + testId;
            }
        });
    });

    function confirmTestDeletion() {
        return confirm("Are you sure you want to delete this test?");
    }	
    
    function confirmLogout(){
    	return confirm("Do you want to log out?");
    }
    </script>
</div>

</body>
</html>
