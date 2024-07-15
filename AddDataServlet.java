import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addData")
public class AddDataServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/seminar"; // Replace with your database URL
    private static final String DB_USER = "root"; // Replace with your database username
    private static final String DB_PASS = ""; // Replace with your database password

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        String name = request.getParameter("name");
        System.out.println("Type is " + type);
        System.out.println("Name is " + name);
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
            String query;

            if ("seminar".equals(type)) {
                query = "INSERT INTO seminar (name) VALUES (?)";
            } else if ("title".equals(type)) {
                query = "INSERT INTO title (name) VALUES (?)";
            } else {
                throw new IllegalArgumentException("Invalid type: " + type);
            }

            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.executeUpdate();
            response.getWriter().print("success");
            response.sendRedirect("addEmployee.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("error");
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
