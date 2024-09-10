<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>boardDelPro.jsp</h3>
<%
String bno = request.getParameter("c");
String sql="delete from board1 where bno="+bno;
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "hr";
String pw = "123456";
Connection con = DriverManager.getConnection(url,user,pw);
//실행
PreparedStatement pstmt = con.prepareStatement(sql);

pstmt.executeUpdate();

response.sendRedirect("board.jsp");

%>

</body>
</html>

<%
pstmt.close();
con.close();
%>