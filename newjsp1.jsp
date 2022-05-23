<%-- 
    Document   : newjsp1
    Created on : 9 May, 2022, 12:47:59 PM
    Author     : AASHISH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
    </head>
    <body>
        <h1>Signing Up</h1>
        <%@page import="java.sql.*,java.io.IOException,java.io.PrintWriter,java.sql.Connection"%>
        <%@page import="java.sql.DriverManager,java.sql.PreparedStatement,java.sql.*,javax.servlet.http.HttpServletResponse"%>
        <%@page import="java.lang.*,javax.servlet.ServletException,javax.servlet.*,javax.servlet.annotation.WebServlet"%>
        <%@page import="javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,java.util.*"%>
        <% out.print("Happy BIrthday);%>
        <% String Name= request.getParameter("UserName");%>
            <% String Pass=request.getParameter("Password");%>
            <% String date=request.getParameter("DOB");%>
            <%java.sql.Date dob=java.sql.Date.valueOf(date);%>
            <%Class.forName("com.mysql.jdbc.Driver");%>
            <%Connection con;%>
            <%con = DriverManager.getConnection("jdbc:mysql://localhost:3306/final", "root","");%>
            <%Statement stmt=con.createStatement();%>
            <%PreparedStatement ps=con.prepareStatement("Insert into final values(?,?,?)");%>
            <%ps.setString(1,Name);%>
            <%ps.setString(2,Pass);%>
            <%ps.setDate(3, dob);%>
            <%ps.executeUpdate();%>
            <%out.print("Added successfully\n");%>
            
    </body>
</html>
