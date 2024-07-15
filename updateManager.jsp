<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Manager - Jadhao Industries</title>
</head>
<body>
<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
//    String empregno = request.getParameter("empregno");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    Connection con = null;
    Statement stmt = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/seminar", "root", "");
        stmt = con.createStatement();
        String sql = "UPDATE manager SET name='" + name + "', username='" + username + "', password='" + password + "' WHERE id=" + id;
        stmt.executeUpdate(sql);
        out.println("<script type=\"text/javascript\">");
                out.println("alert('Manager Updated Successfully!');");
                out.println("window.location.href = 'managerviewdetails.jsp';");
                out.println("</script>");
        
    } catch (Exception e) {
        out.print(e);
    }
%>
</body>
</html>
