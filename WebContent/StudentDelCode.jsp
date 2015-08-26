<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="edu.pccu.student.*"%>
<%
Student s = new Student(
		Integer.valueOf(request.getParameter("id")),"","");
StudentDAO dao = new StudentDAODBImpl();
dao.remove(s);
response.sendRedirect("StudentList.jsp");
%>    
