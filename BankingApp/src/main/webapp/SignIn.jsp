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
String s3=request.getParameter("t3");
String s4=request.getParameter("t4");
String s5=request.getParameter("t5");

try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/advancedJava?autoReconnect=true&useSSL=false","root","root");
	PreparedStatement pstmt=con.prepareStatement("insert into Register values(?,?,?,?,?)");
	
	pstmt.setString(1,s1);
	pstmt.setString(2,s2);
	pstmt.setString(3,s3);
	pstmt.setString(4,s4);
	pstmt.setInt(5,Integer.parseInt(s5));
	
	pstmt.executeUpdate();
	out.println("Account opened successfully...!");	
	
	con.close();
	out.close();
}
catch(Exception e)
{
	e.printStackTrace();
}
%>

</body>
</html>