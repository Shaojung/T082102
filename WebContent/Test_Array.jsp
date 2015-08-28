<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String s1;
	s1 = request.getParameter("d1");
	if (s1 != null)
	{
		out.println("汽水");
	}
	String s2;
	s2 = request.getParameter("d2");
	if (s2 != null)
	{
		out.println("果汁");
	}
	String s3;
	s3 = request.getParameter("d3");
	if (s3 != null)
	{
		out.println("紅茶");
	}
%>
</body>
</html>