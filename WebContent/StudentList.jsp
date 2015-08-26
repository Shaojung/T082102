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
<tr><th>ID</th><th>Name</th><th>Tel</th><th>Edit</th><th>Del</th></tr>
<%
for (Student s : list) {
%>
<tr>
<td><%=s.student_id %></td>
<td><a href="StudentDetail.jsp?id=<%=s.student_id %>"><%=s.student_name %></a></td>
<td><%=s.student_tel %></td>
<td><a href="StudentEdit.jsp?id=<%=s.student_id %>">Edit</a></td>
<td><a href="StudentDelCode.jsp?id=<%=s.student_id %>" onclick="return confirm('確認刪除?');">Del</a></td>
</tr>
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
<p>
<form id="page2" name="page2" action="StudentList.jsp" method="get">
	<select name="p" onchange="page2.submit()">
		<% for(int i=1;i<=TotalPages;i++) { %>
		<option value="<%=i %>" <% if (p==i) { %>selected="selected"<% } %>>第 <%=i %> 頁</option>
		<% } %>		
		
	</select>
</form>
</p>

<p>
<table border="1">
<tr>
<% 
	final int PAGE_RANGE = 3;
	int loc = (p-1) / PAGE_RANGE;
	int start_num = loc*PAGE_RANGE+1;
	int end_num = loc*PAGE_RANGE+PAGE_RANGE;
	int uplimit = (TotalPages > end_num) ? end_num : TotalPages;
	int i;
	for (i=start_num;i<=uplimit;i++) {
%>
	<% if (p != i) { %>
	<td width="30px"> <a href="StudentList.jsp?p=<%=i %>"><%=i %></a> </td>
	<% } else { %>
	<td width="30px"> <%=i %> </td>
	<% } %>
<%		
	}
	if (TotalPages > end_num)
	{
	%>
		<td><a href="StudentList.jsp?p=<%=i %>">Next <%=PAGE_RANGE %> Pages</a></td>
	<%
	}
	
%>

</tr>
</table>
</p>
</body>
</html>