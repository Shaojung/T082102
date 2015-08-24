<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="edu.pccu.student.*, java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
StudentDAO dao = new StudentDAODBImpl();
ArrayList<Student> list = dao.getAllStudents();
%>
<table border="1">
<tr><th>ID</th><th>Name</th><th>Tel</th></tr>
<%
for (Student s : list) {
%>
<tr><td><%=s.student_id %></td><td><a href="StudentDetail.jsp?id=<%=s.student_id %>"><%=s.student_name %></a></td><td><%=s.student_tel %></td></tr>
<%
}
%>
</table>
</body>
</html>