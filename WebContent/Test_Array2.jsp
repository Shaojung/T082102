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
	String s1[] = request.getParameterValues("d1");
	out.println(s1.length);
	
	for (String s : s1)
	{
		String tmp = new String(s.getBytes("ISO-8859-1"), "UTF-8");
		out.println(tmp);
		
	}

%>
</body>
</html>