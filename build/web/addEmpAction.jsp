<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, javax.servlet.*, javax.servlet.http.*, javax.servlet.annotation.*" %>
<%
    String empregno = request.getParameter("empregno");
    String name = request.getParameter("name");
    String fathersName = request.getParameter("fathersName");
    String dob = request.getParameter("dob");
    String contactAddress = request.getParameter("contactAddress");
    Part photoPart = request.getPart("photo");
    String companyName = request.getParameter("companyName");
    String jobTitle = request.getParameter("jobTitle");
    String dateOfJoining = request.getParameter("dateOfJoining");
    String mobileNumber = request.getParameter("mobileNumber");
    String whatsappNumber = request.getParameter("whatsappNumber");
    String workshopSeminar = request.getParameter("workshopSeminar");
    String title = request.getParameter("title");
    String date = request.getParameter("date");
    String time = request.getParameter("time");

    String errorMessage = null;

    // Save uploaded photo to disk and get the path
    String photoFilename = photoPart.getSubmittedFileName();
    String photoPath = getServletContext().getRealPath("/") + "uploads" + File.separator + photoFilename;
    File photoFile = new File(photoPath);
    photoPart.write(photoFile.getAbsolutePath());

    if (name != null && fathersName != null && dob != null && contactAddress != null && companyName != null && jobTitle != null && dateOfJoining != null && mobileNumber != null  && workshopSeminar != null && title != null && date != null && time != null) {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/seminar", "root", "");

            String sql = "INSERT INTO employee (empregno, name, fathersName, dob, contactAddress, photoPath, companyName, jobTitle, dateOfJoining, mobileNumber, whatsappNumber, workshopSeminar, title, date, time) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, empregno);
            stmt.setString(2, name);
            stmt.setString(3, fathersName);
            stmt.setString(4, dob);
            stmt.setString(5, contactAddress);
            stmt.setString(6, photoPath);
            stmt.setString(7, companyName);
            stmt.setString(8, jobTitle);
            stmt.setString(9, dateOfJoining);
            stmt.setString(10, mobileNumber);
            stmt.setString(11, whatsappNumber);
            stmt.setString(12, workshopSeminar);
            stmt.setString(13, title);
            stmt.setString(14, date);
            stmt.setString(15, time);

            stmt.executeUpdate();
            response.sendRedirect("managerDashboard.jsp");
        } catch (Exception e) {
            errorMessage = "Error: " + e.getMessage();
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    } else {
        errorMessage = "All fields are required!";
    }

    if (errorMessage != null) {
        out.println("<div class='invalid-login'>" + errorMessage + "</div>");
    }
%>
