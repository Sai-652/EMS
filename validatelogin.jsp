<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("uname");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "elections";
String userid = "sairam";
String password = "#Cherla@143";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<%
try{
int flag=0;
String uid=request.getParameter("uname");
String name=request.getParameter("pwd");
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql1="",sql2="",sql3="";

   
    sql3="select * from citizens where username='"+uid+"' and       password='"+name+"'";
     resultSet = statement.executeQuery(sql3);
  if(resultSet.next()){

  sql1="SELECT * FROM election WHERE status = 1";
  resultSet = statement.executeQuery(sql1);
  if(resultSet.next()){
    sql2 ="select * from citizens where username='"+uid+"' and       password='"+name+"' and cast=0";
  resultSet = statement.executeQuery(sql2);
  if(resultSet.next())
  response.sendRedirect("cast.jsp?uid="+uid);
  else
    response.sendRedirect("Elogin.jsp?msg='you have already casted your vote!'");
 }
  else {
   response.sendRedirect("Elogin.jsp?msg='elections not yet started!'");
 }
}
else
   response.sendRedirect("Elogin.jsp?msg='Invalid Credentials!'");
}
catch(Exception e){
    out.println(e.getMessage());
}
%>


