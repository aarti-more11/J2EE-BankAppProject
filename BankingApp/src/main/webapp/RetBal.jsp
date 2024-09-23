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

try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/advancedJava?autoReconnect=true&useSSL=false","root","root");
	PreparedStatement pstmt=con.prepareStatement("Select balance from Register where accountNo=?");
	pstmt.setString(1,s1);
	
    ResultSet rs=pstmt.executeQuery();
	
	if(rs.next())
	{
		out.println("Your balance is="+rs.getInt(1));
	}
	else
	{
		out.println("Invalid account no");
	}
	con.close();
	
}
catch(Exception e)
{
	e.printStackTrace();
}
%>

</body>
</html>