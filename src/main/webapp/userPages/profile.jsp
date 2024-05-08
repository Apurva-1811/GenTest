<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.lang.*, dao.Result"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> User Profile </title>

<style>
    /* General styling */
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f0f0f0;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
    }

    .container {
      max-width: 1100px;
      width: 100%;
      padding: 20px;
      background-color: #fff;
      border-radius: 10px;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
      display: grid;
      grid-template-columns: 1fr 2fr;
      gap: 20px;
    }

    /* User details styling */
    .user-details {
      background-color: rgba(245, 183, 0, 1);
      border-radius: 10px;
      padding: 20px;
      color: #333;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
      height: 170px; 
      overflow-y: auto; 
      font-size: 16px;
    }

    .user-details h2 {
      margin-top: 0;
    }

    /* Table styling */
    table {
      width: 100%;
      border-collapse: collapse;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
      background-color: #fff;
      border-radius: 10px;
      max-height: 400px; 
      overflow-y: auto; 
    }

    th, td {
      padding: 12px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    th {
      background-color:  rgba(245, 183, 0, 1);
      color: #333;
    }

    /* Button styling */
    .button-container {
      text-align: right;
    }

    .button {
      background-color: #333;
      color: #fff;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .button:hover {
      background-color: #555;
    }

    /* Responsive styling */
    @media (max-width: 768px) {
      .container {
        grid-template-columns: 1fr;
      }
    }
    
    
.header-buttons {
	margin-top: 5px;	
	display: flex;
	align-items: center;
}

.header-buttons a {
	text-decoration: none;
	padding: 5px 10px;
	margin-left: 10px;
	border-radius: 5px;	
	background-color: #333;
    color: #fff;
    padding: 10px 20px;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
      
}

.header-buttons a:hover {
	color: #fff;
	border: 1px solid #f5b700;
     background-color: #555;
}
   
  </style>
</head>
<body>

	<%
	HttpSession session2 = request.getSession(false);
	if (session2 != null && session2.getAttribute("user_id") != null) {
		int user_id = (int) session2.getAttribute("user_id");
		String name = (String) session2.getAttribute("name");
		ArrayList<Result> arr = (ArrayList<Result>) request.getAttribute("resultarr");
		String phone = (String)request.getAttribute("phone");
		String email = (String)request.getAttribute("email");
	%>		
	
	<div class="container">
    <!-- User details -->
    <div class="user-details">
      <h2>Welcome, <%= name %></h2>
      <p>Phone Number: <%= phone %></p>
      <p>Email: <%= email %></p>
      <!-- Button container -->
      <div class="button-container">        
        <div class="header-buttons">
			<a href="/TakeTest/UserDashboard"> Dashboard</a> 
			<a href="./Logout" onclick="return confirmLogout();">Logout</a>
		</div>
      </div>
    </div>
    
    <%
   	 	if(arr.size() != 0){
    %>

    <table>
      <thead>
        <tr>
          <th>Test Name</th>
          <th>Max Marks</th>
          <th>Scored Marks</th>
          <th>Percentage</th>
          <th>Pass/Fail</th>
          <th>Date</th>
        </tr>
      </thead>
      
      <tbody>
        <% for (Result result : arr) { %>
            <tr>
                <td><%= result.getTestTag() %></td>
                <td><%= result.getMaxMarks() %></td>
                <td><%= result.getScore() %></td>
                <td><%= (result.getScore()*100) / result.getMaxMarks() %></td>
                <td><%= result.getStatus() %></td>
                <td><%= result.getDate() %></td>
            </tr>
        <% } %>
        </tbody>
    </table>
    
    	<%
	} else {
	%>

	<p id = "displaymsg">No tests given.</p>

	<%
	}
	%>
    
  </div>
	
	  
  <script>
  function confirmLogout(){
  	return confirm("Do you want to log out?");
  }
  </script>
  
  <%
	} else{
	response.sendRedirect("/TakeTest/userPages/userLogin.jsp");
	}
	%>

</body>
</html>


