<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

    <%
        } else {
            // Redirect to the login page if the session is not valid
            response.sendRedirect("/TakeTest/index.html");
        }
    %>
	


</body>
</html>