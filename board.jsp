<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
<%
String sql = "Select bno,bsub,bwriter,bmemo,bdate,cnt from board1 order by bno desc";
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "hr";
String pw = "123456";

Connection conn = DriverManager.getConnection(url,user,pw);
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);

%>

<table border="1px" width="100%">
	<tr>
		<td>글 번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>메모</td>
		<td>작성일</td>
		<td>조회수</td>
		<td></td>
	</tr>

<%
	while(rs.next()){		
%>
	<tr>
		<td><%=rs.getInt("bno") %></td>
		<td><a href="boardDetail.jsp?c=<%=rs.getInt("bno") %>"><%=rs.getString("bsub") %></a></td>
		<td><%=rs.getString("bwriter") %></td>
		<td><%=rs.getString("bmemo") %></td>
		<td><%=rs.getTimestamp("bdate") %></td>
		<td><%=rs.getInt("cnt") %></td>
		<td style="background-color: lightgray;"><a href="boardEdit.jsp?c=<%=rs.getInt("bno") %>">글 수정</a></td>
	</tr>
<%			
	}
%>
</table><br />
<a href="boardReg.jsp">글 추가</a>


</body>
</html>
<%
rs.close();
stmt.close();
conn.close();
%>