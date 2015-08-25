<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="edu.pccu.student.*"%>
<%
Student s = new Student(0, request.getParameter("student_name"), request.getParameter("student_tel"));
StudentDAO dao = new StudentDAODBImpl();
dao.add(s);
response.sendRedirect("StudentList.jsp");
%>    
