import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.stream.IntStream;

@WebServlet(urlPatterns = "/checkArea")
public class AreaCheckServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long startTime = System.nanoTime();
        double x = Double.parseDouble(req.getParameter("X"));
        double y = Double.parseDouble(req.getParameter("Y"));
        int r = Integer.parseInt(req.getParameter("R"));
        if (x <= 2 && x >= -2 && y <= 3 && y >= -3 && IntStream.of(1, 2, 3, 4, 5).anyMatch(a -> a == r)) {
            String resultArea = checkArea(x, y, r);
            String time = LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd.MM.yyyy hh:mm:ss"));
            String[] answer = new String[]{String.valueOf(y), String.valueOf(x), String.valueOf(r),
                    resultArea, time, String.valueOf((System.nanoTime() - startTime) / 1000)};
            ((ArrayList<String[]>) getServletContext().getAttribute("table")).add(answer);
            ((ArrayList<String[]>) getServletContext().getAttribute("points")).add(new String[]{String.valueOf(y), String.valueOf(x), String.valueOf(r)});
            req.setAttribute("table", answer);
            getServletContext().getRequestDispatcher("/resultPage.jsp").forward(req, resp);
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    private String checkArea(double x, double y, int r) {
        if (x <= 0 && y <= 0 && y >= -r && x >= -r) {
            return "true";
        }
        if (y >= 0 && x >= 0 && y <= -x / 2 + ((double) r / 2)) {
            return "true";
        }
        if (x >= 0 && y <= 0 && Math.pow(x, 2) + Math.pow(y, 2) <= Math.pow(((double) r / 2), 2)) {
            return "true";
        }
        return "false";
    }
}