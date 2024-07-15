import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet("/employeeRegistration")
public class EmployeeRegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String empregno = generateUniqueEmpregno();
        String namePrefix = request.getParameter("namePrefix");
        String name = request.getParameter("fname");
        String surname = request.getParameter("lname");
        String fathersName = request.getParameter("fathersName");
        String dob = request.getParameter("dob");
        String contactAddress = request.getParameter("contactAddress");
        Part photoPart = request.getPart("photo");
        String companyName = request.getParameter("companyName");
        String jobTitle = request.getParameter("jobTitle");
        String dateOfJoining = request.getParameter("dateOfJoining");
        String mobileNumber = request.getParameter("mobileNumber");
        String workshopSeminar = request.getParameter("workshopSeminar");
        String title = request.getParameter("title");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String whatsappNumber = request.getParameter("whatsappNumber");
        int fees = Integer.parseInt(request.getParameter("fees"));

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

        if (photoPart != null) {
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

        if (namePrefix != null && name != null && fathersName != null && dob != null && contactAddress != null && companyName != null
                && jobTitle != null && dateOfJoining != null && mobileNumber != null && workshopSeminar != null
                && title != null && date != null && time != null) {
            Connection conn = null;
            PreparedStatement stmt = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/seminar", "root", "");

                // Check if seminar exists
                String seminarExistsQuery = "SELECT COUNT(*) FROM seminar WHERE LOWER(name) = LOWER(?)";
                PreparedStatement seminarExistsStmt = conn.prepareStatement(seminarExistsQuery);
                seminarExistsStmt.setString(1, workshopSeminar.toLowerCase());
                ResultSet seminarExistsResult = seminarExistsStmt.executeQuery();
                seminarExistsResult.next();
                boolean seminarExists = seminarExistsResult.getInt(1) > 0;

                if (!seminarExists) {
                    // Insert new seminar
                    String addSeminarQuery = "INSERT INTO seminar (name) VALUES (?)";
                    PreparedStatement addSeminarStmt = conn.prepareStatement(addSeminarQuery);
                    addSeminarStmt.setString(1, workshopSeminar);
                    addSeminarStmt.executeUpdate();
                }

                // Check if title exists
                String titleExistsQuery = "SELECT COUNT(*) FROM title WHERE LOWER(name) = LOWER(?)";
                PreparedStatement titleExistsStmt = conn.prepareStatement(titleExistsQuery);
                titleExistsStmt.setString(1, title.toLowerCase());
                ResultSet titleExistsResult = titleExistsStmt.executeQuery();
                titleExistsResult.next();
                boolean titleExists = titleExistsResult.getInt(1) > 0;

                if (!titleExists) {
                    // Insert new title
                    String addTitleQuery = "INSERT INTO title (name) VALUES (?)";
                    PreparedStatement addTitleStmt = conn.prepareStatement(addTitleQuery);
                    addTitleStmt.setString(1, title);
                    addTitleStmt.executeUpdate();
                }

                String sql = "INSERT INTO employee (empregno, namePrefix, fname, lname, fathersName, dob, contactAddress, photoPath, companyName, jobTitle, dateOfJoining, mobileNumber, whatsappNumber, workshopSeminar, title, date, time, fees) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, empregno);
                stmt.setString(2, namePrefix);
                stmt.setString(3, name);
                stmt.setString(4, surname);
                stmt.setString(5, fathersName);
                stmt.setString(6, dob);
                stmt.setString(7, contactAddress);
                stmt.setString(8, photoInsertPath); // Insert the photo path
                stmt.setString(9, companyName);
                stmt.setString(10, jobTitle);
                stmt.setString(11, dateOfJoining);
                stmt.setString(12, mobileNumber);
                stmt.setString(13, whatsappNumber);
                stmt.setString(14, workshopSeminar);
                stmt.setString(15, title);
                stmt.setString(16, date);
                stmt.setString(17, time);
                stmt.setInt(18, fees);

                stmt.executeUpdate();

                // Write the alert and redirect script
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Employee Registered Successfully!');");
                out.println("window.location.href = 'managerDashboard.jsp';");
                out.println("</script>");
                out.close();
            } catch (Exception e) {
                errorMessage = "Error: " + e.getMessage();
                e.printStackTrace(); // Log the full stack trace
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
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('" + errorMessage + "');");
            out.println("window.location.href = 'addEmployee.jsp';");
            out.println("</script>");
            out.close();
        }
    }

    private String generateUniqueEmpregno() {
        Random random = new Random();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String empregno;
        boolean isUnique = false;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/seminar", "root", "");

            while (!isUnique) {
                int randomNum = 10000 + random.nextInt(90000);
                empregno = "EMP" + randomNum;

                String query = "SELECT COUNT(*) FROM employee WHERE empregno = ?";
                stmt = conn.prepareStatement(query);
                stmt.setString(1, empregno);
                rs = stmt.executeQuery();
                rs.next();
                if (rs.getInt(1) == 0) {
                    isUnique = true;
                    return empregno;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}
