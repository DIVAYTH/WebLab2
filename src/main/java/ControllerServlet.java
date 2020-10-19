import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(urlPatterns = "/control")
public class ControllerServlet extends HttpServlet {
    private ArrayList<String[]> table = new ArrayList<>();
    private ArrayList<String[]> points = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getServletContext().setAttribute("table", table);
        getServletContext().setAttribute("points", points);
        if (req.getQueryString() == null) {
            getServletContext().getRequestDispatcher("/mainPage.jsp").forward(req, resp);
        } else {
            getServletContext().getRequestDispatcher("/checkArea").forward(req, resp);
        }
    }
}