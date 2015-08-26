<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="edu.pccu.student.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>這是我的練習</title>
</head>
<%
String s = request.getParameter("id");
Student stu = null;
if (s != null)
{
	try
	{
		int student_id = Integer.valueOf(s);
		StudentDAO dao = new StudentDAODBImpl();
		stu = dao.findById(student_id);
	}
	catch(Exception e)
	{
		out.println("No Data!");
	}
		
}
else
{
	out.println("No Data!");
}

%>
<body>
<p>This is a Edit Page</p>
<form name="student" action="StudentEditCode.jsp" method="post">
<input type="hidden" name="student_id" value="<% out.print(stu.student_id); %>" />
<p>Student Name:<input type="text" name="student_name" value="<% out.print(stu.student_name); %>" /></p>
<p>Student Tel:<input type="text" name="student_tel" value="<% out.print(stu.student_tel); %>" /></p>
<p><input type="submit" value="Update!" />
</form>
</body>
</html>