<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

String s1=request.getParameter("t1");
String s2=request.getParameter("t2");

try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/advancedJava?autoReconnect=true&useSSL=false","root","root");
	PreparedStatement pstmt=con.prepareStatement("Select * from Register where username=? and password=?");
	pstmt.setString(1,s1);
	pstmt.setString(2,s2);
	out.println("<h1>Welcome "+s1+"</h1>");
	
	ResultSet rs=pstmt.executeQuery();
	
	if(rs.next())
	{

   %>
		<form method="post" action="RetBal.jsp">
		Account Number:<input type="text" name="t1"><br><br>
		<input type="submit" value="Retrieve Balance">
		</form>
	<% 

	}
	else
	out.println("Login failed");
	rs.close();
	con.close();
}
catch(Exception e)
{
	e.printStackTrace();
}

%>

</body>
</html>