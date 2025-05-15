<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>



<%
try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/elections", "sairam", "#Cherla@143");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("update election set status=1 where sno=1");
      
           response.sendRedirect("page.jsp?msg='elections started'");
         
        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
 %>
