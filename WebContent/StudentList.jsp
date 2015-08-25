<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="edu.pccu.student.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<p><a href="StudentAdd.jsp">Add a student</a></p>
<%
String strPage = request.getParameter("p");
int p;
if (strPage == null)
{
	p = 1;
}
else
{
	try
	{
		p = Integer.valueOf(strPage);	
	}
	catch (Exception e)
	{
		p = 1;
	}
	
}

final int PAGE_SIZE = 3;
int start_loc = (p-1)* PAGE_SIZE + 1;
StudentDAO dao = new StudentDAODBImpl();
ArrayList<Student> list = dao.getRangeStudents(start_loc, PAGE_SIZE);
int TotalRows = dao.getSize();
int TotalPages = (int) Math.ceil((double) TotalRows / (double) PAGE_SIZE);
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
<p>
<% if (p > 1) { %>
<a href="StudentList.jsp?p=<%= (p-1) %>">上一頁</a>
<% } %>
<% if (p < TotalPages) { %>
<a href="StudentList.jsp?p=<%= (p+1) %>">下一頁</a>
<% } %>
</p>
<p>
<form name="page1" action="StudentList.jsp" method="get">
	<input type="number" name="p" size="3" />
	<input type="submit" value="GO" />
</form>
</p>

</body>
</html>