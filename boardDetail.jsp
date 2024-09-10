<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/addstyle.css" />
</head>
<body>
<h3>Board Detail.jsp</h3>
<%
String bno = request.getParameter("c");
String sql = "select bno,bsub,bwriter,bmemo,bdate,cnt from board1 where bno=" + bno;
//dbcon
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "hr";
String pw = "123456";
Connection con = DriverManager.getConnection(url,user,pw);
//실행
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
rs.next();
%>
<table class="twidth">
	<colgroup>
		<col width="15%"/>
		<col width="35%"/>
		<col width="15%"/>
		<col width="35%"/>
	</colgroup>
	<caption>Board Detail</caption>
	<tbody>
		<tr>
			<th class="left">글 번호</th>
			<td><%=rs.getInt("bno") %></td>
			<th class="left">조회수</th>
			<td><%=rs.getInt("cnt") %></td>
		</tr>
		<tr>
			<th class="left">작성자</th>
			<td><%=rs.getString("bwriter") %></td>
			<th class="left">작성시간</th>
			<td><%=rs.getDate("bdate") %></td>
		</tr>
		<tr>
			<th class="left">제목</th>
			<td colspan="3" id="bsub"><%=rs.getString("bsub") %></td>
		</tr>
		<tr>
			<th class="left">내용</th>
			<td colspan="3" id="content"><%=rs.getString("bmemo") %></td>
			
		</tr>
	
	</tbody>
</table>
<a href="board.jsp">목록</a>
<a href="boardEdit.jsp?c=<%=rs.getInt("bno") %>">수정</a>
<a href="boardDelPro.jsp?c=<%=rs.getInt("bno") %>">삭제</a>


</body>
</html>

<%
rs.close();
stmt.close();
con.close();
%>