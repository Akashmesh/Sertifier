import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/updateEmployee")
@MultipartConfig
public class UpdateEmployee extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String empregno = request.getParameter("empregno");
        String name = request.getParameter("name");
        String fathersName = request.getParameter("fathersName");
        String dob = request.getParameter("dob");
        String contactAddress = request.getParameter("contactAddress");
        Part photoPart = request.getPart("photo");
        String companyName = request.getParameter("companyName");
        String jobTitle = request.getParameter("jobTitle");
        String mobileNumber = request.getParameter("mobileNumber");
        String whatsappNumber = request.getParameter("whatsappNumber");
        
        
        System.out.println("Employee Registration Number: " + empregno);
System.out.println("Name: " + name);
System.out.println("Father's Name: " + fathersName);
System.out.println("Date of Birth: " + dob);
System.out.println("Contact Address: " + contactAddress);
System.out.println("Company Name: " + companyName);
System.out.println("Job Title: " + jobTitle);
System.out.println("Mobile Number: " + mobileNumber);
System.out.println("WhatsApp Number: " + whatsappNumber);


        // Set whatsappNumber to null if empty
        if (whatsappNumber == null || whatsappNumber.isEmpty()) {
            whatsappNumber = null;
        }

        String errorMessage = null;

        // Ensure the uploads directory exists
        String uploadsDirPath = "C:\\Users\\akash\\OneDrive\\Documents\\NetBeansProjects\\JadhaoIndustries\\web\\uploads";
        File uploadsDir = new File(uploadsDirPath);
        if (!uploadsDir.exists()) {
            uploadsDir.mkdirs(); // create the directory if it doesn't exist
        }

        String photoInsertPath = null; // Initialize to null

        if (photoPart != null && photoPart.getSize() > 0) {
            String photoFilename = photoPart.getSubmittedFileName();
            if (photoFilename != null && photoFilename.contains(".")) { // Check if filename has a '.'
                String baseName = photoFilename.substring(0, photoFilename.lastIndexOf('.'));
                String extension = photoFilename.substring(photoFilename.lastIndexOf('.'));
                String photoPath = uploadsDirPath + File.separator + photoFilename;
                int fileCount = 1;
                while (new File(photoPath).exists()) {
                    photoFilename = baseName + "_" + fileCount + extension;
                    photoPath = uploadsDirPath + File.separator + photoFilename;
                    fileCount++;
                }

                File photoFile = new File(photoPath);
                try (InputStream photoInputStream = photoPart.getInputStream()) {
                    Files.copy(photoInputStream, photoFile.toPath());
                }
                photoInsertPath = "uploads/" + photoFilename;
            }
        }

        if (name != null && fathersName != null && dob != null && contactAddress != null && companyName != null
                && jobTitle != null && mobileNumber != null) {
            Connection conn = null;
            PreparedStatement stmt = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/seminar", "root", "");

                String sql = "UPDATE employee SET name=?, fathersName=?, dob=?, contactAddress=?, photoPath=?, companyName=?, jobTitle=?, mobileNumber=?, whatsappNumber=? WHERE empregno=?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, name);
                stmt.setString(2, fathersName);
                stmt.setString(3, dob);
                stmt.setString(4, contactAddress);
                stmt.setString(5, photoInsertPath); // Insert the photo path
                stmt.setString(6, companyName);
                stmt.setString(7, jobTitle);
                stmt.setString(8, mobileNumber);
                stmt.setString(9, whatsappNumber);
                
                stmt.setString(10, empregno);

                stmt.executeUpdate();
                response.sendRedirect("managerDashboard.jsp");
            } catch (Exception e) {
                errorMessage = "Error: " + e.getMessage();
                System.out.println(e);
            } finally {
                try {
                    if (stmt != null)
                        stmt.close();
                    if (conn != null)
                        conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        } else {
            errorMessage = "All fields are required!";
        }

        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("updateEmployee.jsp").forward(request, response);
        }
    }
}
