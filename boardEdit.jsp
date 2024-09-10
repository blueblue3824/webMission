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
<title>Insert title here</title>'
<link rel="stylesheet" href="../css/addstyle.css" />
</head>
<body>
<h3>Board Edit</h3>

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

<form action="boardEditProc.jsp" method="post">
<table>
	<colgroup>
		<col width="15%"/>
		<col width="35%"/>
		<col width="15%"/>
		<col width="35%"/>
	</colgroup>
	<caption>Detail</caption>
	<tbody>
		<tr>
			<th class="left">글번호</th>
			<td><%=rs.getInt("bno") %></td>
			<th class="left">조회수</th>
			<td><%=rs.getInt("cnt") %></td>
		</tr>
		<tr>
			<th class="left">작성자</th>
			<td><%=rs.getString("bwriter") %></td>
			<th class="left">작성시간</th>
			<td><%=rs.getTimestamp("bdate") %></td>
		</tr>
		<tr>
			<th class="left">제목</th>
			<td colspan="3">
				<input type="text" class="bsub" name="bsub" value="<%=rs.getString("bsub") %>" />
			
			</td>
			
		</tr>
		<tr>
			<th class="left">내용</th>
			<td colspan="3" id="bmemo">
				<textarea name="bmemo"><%=rs.getString("bmemo") %></textarea>

			</td>
			
		</tr>

	
	</tbody>
</table>

<input type="hidden" id="bno" name="bno" value="<%=rs.getInt("bno") %>" />
<input type="submit" value="수정완료" />
<a href="boardDetail.jsp?c=<%=rs.getInt("bno") %>">취소</a>
</form>
</body>
</html>

<%
rs.close();
stmt.close();
con.close();
%>