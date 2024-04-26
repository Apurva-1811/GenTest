package user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import dao.TestDao;

@WebServlet("/Result")

public class Result extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public Result() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int test_id = (int)session.getAttribute("test_id");
		
//		System.out.println("user_id" + session.getAttribute("user_id"));
//		System.out.println("test_id" + session.getAttribute("test_id"));
		
		String[] answers = request.getParameter("answers").split(",");
		int[] ans = new int[2];
		try {
			ans = TestDao.getScore(test_id, answers);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("score", ans[0]);
		request.setAttribute("total", ans[1]);
		request.getRequestDispatcher("./userPages/result.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
