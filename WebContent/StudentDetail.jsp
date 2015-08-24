<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="edu.pccu.student.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String s = request.getParameter("id");
int student_id = Integer.valueOf(s);
StudentDAO dao = new StudentDAODBImpl();
Student stu = dao.findById(student_id);
out.println("Name:" + stu.student_name);
%>
</body>
</html>