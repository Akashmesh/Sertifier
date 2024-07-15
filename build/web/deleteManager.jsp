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
    String id = request.getParameter("id");
    Connection con = null;
    Statement stmt = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/seminar", "root", "");
        stmt = con.createStatement();
        String sql = "DELETE FROM manager WHERE id=" + id;
        stmt.executeUpdate(sql);
        response.sendRedirect("managerviewdetails.jsp");
    } catch (Exception e) {
        out.print(e);
    }
%>
</body>
</html>
