<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<html>

<head>
</head>

<style>

a{
  font-size:32px;
 }
 
</style>

</head>


<body>




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
String uid=request.getParameter("uid");

connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql1="";

sql1="update citizens set cast=1 where username='"+uid+"'";


statement.executeUpdate(sql1);
%> 
<a href="Elogin.jsp?msg='successfully casted your vote'"> cast vote </a>

<%
}
catch(Exception e){
    out.println(e.getMessage());
}
%>



</body>

</html>
