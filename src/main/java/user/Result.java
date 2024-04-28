package user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

import dao.Question;
import dao.TestDao;

@WebServlet("/Result")

public class Result extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public Result() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		if(session != null && session.getAttribute("user_id") != null && session.getAttribute("test_id") != null) {
			int test_id = (int)session.getAttribute("test_id");
			TestDao.updateCandidates(test_id);
			boolean nullString = false;
			String[] answers;
			if(request.getParameter("answers") == null) {
				nullString = true;
				answers = null;
			}
			else answers = request.getParameter("answers").split(",");
			int[] ans = new int[2];
			int passmarks = 0;
			try {
				ans = TestDao.getScore(test_id, answers, nullString);
				passmarks = TestDao.getPassMarks(test_id);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			request.setAttribute("score", ans[0]);
			request.setAttribute("total", ans[1]);
			request.setAttribute("pass_marks", passmarks);
			request.getRequestDispatcher("./userPages/result.jsp").forward(request, response);
		}else {
			response.sendRedirect("/TakeTest/userPages/userLogin.jsp");
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
