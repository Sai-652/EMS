
<html>

<head>


<style>

 a,input{
 font-size:32px;
 }

</style>
</head>

<body>
<%
String str=request.getParameter("msg");
if(str!=null)
    out.println("<p><font size=32 color=red>"+str+"</font></p>");
%>


<br><br><br><br>

<form name=f1 action=start.jsp method=post>
 <input type=submit value=start_election id=button>
 &nbsp;&nbsp;&nbsp;
 <a href=stop.jsp>stop election</a>
</form>
 
</body>
