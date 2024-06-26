<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
    // Get empId parameter from the request
    String empId = request.getParameter("empId");

    // Database connection parameters
    String url = "jdbc:mysql://localhost:3306/seminar";
    String username = "root";
    String password = "";

    // Database query to fetch employee details based on empId
    String query = "SELECT * FROM employee WHERE empregno = ?";

    // Database objects
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // Connect to the database
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);

        // Prepare and execute the query
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, empId);
        rs = pstmt.executeQuery();

        // Process the result set
        if (rs.next()) {
            // Construct a string containing employee details
            String employeeDetails = "Employee ID: " + rs.getString("empregno") + "\n" +
                                     "Name: " + rs.getString("fname")+" "+rs.getString("lname") + "\n" +                                   
                                     "Company Name: " + rs.getString("companyName") + "\n" +
                                     "Workshop or Seminar: " + rs.getString("workshopSeminar") + "\n" +
                                     "Title: " + rs.getString("title");

            // Output employee details as plain text
            out.print(employeeDetails);
        } else {
            // Output an error message if employee with the specified ID is not found
            out.print("Employee details not found");
        }
    } catch (Exception e) {
        // Output error message if an exception occurs
        e.printStackTrace();
        out.print("Error: " + e.getMessage());
    } finally {
        // Close database resources
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
