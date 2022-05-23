<%-- 
    Document   : newjsp
    Created on : 9 May, 2022, 11:35:53 AM
    Author     : AASHISH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Logging In</h1>
        <ul>
            <%@page import="java.sql.*,java.io.IOException,java.io.PrintWriter,java.sql.Connection"%>
            <%@page import="java.sql.DriverManager,java.sql.PreparedStatement,java.sql.*,javax.servlet.http.HttpServletResponse"%>
            <%@page import="java.lang.*,javax.servlet.ServletException,javax.servlet.*,javax.servlet.annotation.WebServlet"%>
            <%@page import="javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,java.util.*"%>
            <% String Name= request.getParameter("UserName");%>
            <% String Pass=request.getParameter("Password");%>
            <%Class.forName("com.mysql.jdbc.Driver");%>
            <%Connection con;%>
            <%con = DriverManager.getConnection("jdbc:mysql://localhost:3306/final", "root","");%>
            <%Statement stmt=con.createStatement();%>
            <%ResultSet rs=stmt.executeQuery("Select Password from final where UserName='"+Name+"'");%>
            <%
                while(rs.next())
                {
                if(rs.getString(1).equalsIgnoreCase(Pass))
                        {
                            rs=stmt.executeQuery("Select DOB from final where UserName='"+Name+"'");
                            long millis=System.currentTimeMillis();  
                            java.util.Date date=new java.util.Date(millis); 
                            if(date.equals(rs.getDate(1)))
                            {
                                out.print("Happy Birthday");
                            }
                            else
                            {
                            out.print("You are Allowed to enter");
                            }
                        }
                else
                {
                    out.print("You are not allowed to enter");
                }
                }
             %>
             
            
        </ul>
    </body>
</html>
