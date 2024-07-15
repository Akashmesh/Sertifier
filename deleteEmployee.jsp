<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Manager - Jadhao Industries</title>
</head>
<body>
<%
    String id = request.getParameter("empregno");
    Connection con = null;
    Statement stmt = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/seminar", "root", "");
        stmt = con.createStatement();
        String sql = "DELETE FROM employee WHERE empregno=" + id;
        stmt.executeUpdate(sql);
        response.sendRedirect("deleteEmployee.jsp");
    } catch (Exception e) {
        out.print(e);
    }
%>
</body>
</html>
