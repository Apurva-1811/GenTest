<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	result page
	<% 
	 int score = (int)request.getAttribute("score");
	 int total = (int)request.getAttribute("total");
	%>
	
	<h1> score : <%= score %> </h1>
	<h1> total : <%= total %> </h1>
	
	<a href = "/TakeTest/UserDashboard" onclick="return goToDashboard()"> Test Options </a>
    <a href="./Logout" onclick="return confirmLogout();">Logout</a>
    
</body>

<script>

	function goToDashboard(){
		if( confirm ("Check other test options?")){
			<%
			session.removeAttribute("test_id");
			session.removeAttribute("questions");			
			%>
			return true;
		}else return false;
	}

	function confirmLogout(){
		return confirm("Do you want to log out?");
	}
</script>
</html>