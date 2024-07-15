import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/fetchData")
public class FetchDataServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        
        String dbURL = "jdbc:mysql://localhost:3306/seminar"; // Replace with your database URL
        String user = "root"; // Replace with your database username
        String pass = ""; // Replace with your database password

        List<String> seminars = new ArrayList<>();
        List<String> titles = new ArrayList<>();
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbURL, user, pass);
            Statement stmt = conn.createStatement();
            
            ResultSet rsSeminars = stmt.executeQuery("SELECT name FROM seminar");
            while (rsSeminars.next()) {
                seminars.add(rsSeminars.getString("name"));
            }
            
            ResultSet rsTitles = stmt.executeQuery("SELECT name FROM title");
            while (rsTitles.next()) {
                titles.add(rsTitles.getString("name"));
            }
            
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        Gson gson = new Gson();
        String jsonResponse = gson.toJson(new String[][] {
            seminars.toArray(new String[0]),
            titles.toArray(new String[0])
        });
        
        out.print(jsonResponse);
        out.flush();
    }
}
