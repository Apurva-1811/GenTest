package admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import dao.TestDao;

@WebServlet("/AddTest")
public class AddTest extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    public AddTest() {
        super();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String test_tag = request.getParameter("test_tag");
		String questions = request.getParameter("questions");
		String pass_marks = request.getParameter("pass_marks");
		
		try {
			if(Integer.parseInt(questions) <= 0) {
				response.sendRedirect("/TakeTest/adminPages/addTest.jsp?error=invalid_ques");
                return;
			}
			if (questions == null || pass_marks == null || Integer.parseInt(pass_marks) < 0 || Integer.parseInt(pass_marks) > Integer.parseInt(questions)) {
                response.sendRedirect("/TakeTest/adminPages/addTest.jsp?error=invalid_passing_marks&ques="+questions);
                return;
            }
			System.out.println();
			if(TestDao.addNewTest(test_tag, questions, pass_marks)){
				int test_id = TestDao.getTestId();
				if(test_id == -1) {
					response.sendRedirect("/TakeTest/adminPages/addTest.jsp?error=try_again");
					return;
				}
				
				System.out.println("test added" + test_id + "  " + questions);
				request.setAttribute("testId", String.valueOf(test_id));
				request.setAttribute("ques", questions);
		        request.getRequestDispatcher("./adminPages/addQuestions.jsp").forward(request, response);
				
			}
			else response.sendRedirect("/TakeTest/adminPages/addTest.jsp?error=try_again");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
