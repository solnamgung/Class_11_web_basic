<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajaxPro</title>
</head>
<body>

	<%
	
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String dbId = "admin";
		
		String result = "N";
		
		if (id.equals(dbId)){
			result = "Y";
		}
	
	%>
	<p id="res"><%=result %></p>
	
</body>
</html>


 --%>