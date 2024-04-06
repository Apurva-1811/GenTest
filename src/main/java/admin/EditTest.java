package admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

import dao.Test;
import dao.TestDao;


@WebServlet("/EditTest")
public class EditTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//		HttpSession session = request.getSession();
//		if(session != null && session.getAttribute("username") != null) {
//			try {
//				ArrayList<Test> arr = TestDao.getAllQuestions(test_id){
//				System.out.println("data fetched");
//				request.setAttribute("tests", arr);
//				request.getRequestDispatcher("./adminPages/adminDashboard.jsp").forward(request, response);
//			} catch (Exception e) {
//				e.printStackTrace();
				
//			 Optionally, you can set an error message to display to the user
//	        request.setAttribute("errorMessage", "An error occurred while retrieving the tests. Please try again later.");
				
				// Forward the request to an error page to inform the user
//	        request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
//			}
//		}else {
//			response.sendRedirect("/TakeTest/adminPages/adminLogin.jsp?error=1");
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
