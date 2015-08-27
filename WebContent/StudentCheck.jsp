<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="edu.pccu.student.*"%><%
    String s = request.getParameter("name");
    Student stu = null;
    if (s != null)
    {
    	try
    	{    		
    		StudentDAO dao = new StudentDAODBImpl();
    		stu = dao.findByName(s);
    		
    	    if (stu == null)
    	    {
    	    	out.print("0");	// 0 代表沒有重複可以新增
    	    }
    	    else
    	    {
    	    	out.print("1");	// 1 代表有重複不可以新增
    	    }
    		
    	}
    	catch(Exception e)
    	{
    		out.print("1");
    	}
    		
    }
    else
    {
    	out.print("1");
    }


    
    
    
    %>
