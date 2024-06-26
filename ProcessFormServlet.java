import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/ProcessFormServlet")
@MultipartConfig
public class ProcessFormServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String employeeId = request.getParameter("employeeId");
        String empregnoDisplay = request.getParameter("empregnoDisplay");
        String remarks = request.getParameter("remarks");
        String dateOfIssue = request.getParameter("dateOfIssue");

        String namePrefix = "";
        String employeeName = "";
        String fathersName = "";
        String employeeSurname = "";
        String workshopSeminar = "";
        String title = "";
        String seminarDate = "";

        // Fetch employee details from the database
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/seminar", "root", "");
            PreparedStatement stmt = conn.prepareStatement("SELECT namePrefix, fname, fathersName, lname, workshopSeminar, title, date FROM employee WHERE empregno = ?");
            stmt.setString(1, employeeId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                namePrefix = rs.getString("namePrefix");
                employeeName = rs.getString("fname");
                fathersName = rs.getString("fathersName");
                employeeSurname = rs.getString("lname");
                workshopSeminar = rs.getString("workshopSeminar");
                title = rs.getString("title");
                seminarDate = rs.getString("date");
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Handle file uploads
        Collection<Part> parts = request.getParts();
        int logoCount = 0;
        for (Part part : parts) {
            if (part.getName().equals("logos") && part.getSize() > 0 && logoCount < 4) {
                InputStream inputStream = part.getInputStream();
                ByteArrayOutputStream buffer = new ByteArrayOutputStream();
                byte[] temp = new byte[1024];
                int bytesRead;
                while ((bytesRead = inputStream.read(temp)) != -1) {
                    buffer.write(temp, 0, bytesRead);
                }
                byte[] fileContent = buffer.toByteArray();
                request.setAttribute("logo" + logoCount, fileContent);
                logoCount++;
            }
        }

        // Set attributes to pass data to JSP
        request.setAttribute("employeeId", employeeId);
        request.setAttribute("namePrefix", namePrefix);
        request.setAttribute("employeeName", employeeName);
        request.setAttribute("fathersName", fathersName);
        request.setAttribute("employeeSurname", employeeSurname);
        request.setAttribute("empregnoDisplay", empregnoDisplay);
        request.setAttribute("remarks", remarks);
        request.setAttribute("dateOfIssue", dateOfIssue);
        request.setAttribute("workshopSeminar", workshopSeminar);
        request.setAttribute("title", title);
        request.setAttribute("seminarDate", seminarDate);

        // Forward to JSP
        request.getRequestDispatcher("displayCertificate.jsp").forward(request, response);
    }
}
