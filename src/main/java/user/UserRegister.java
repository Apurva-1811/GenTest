package user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import dao.UserDao;

@WebServlet("/UserRegister")

public class UserRegister extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private static UserDao userDao = new UserDao();
       
    public UserRegister() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String mobile = request.getParameter("mobile");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		
		try {
			// if mobile no starts with 0
			if(mobile.charAt(0) == '0') {
				response.sendRedirect("/TakeTest/userPages/userRegister.jsp?error=mobile_invalid");
				return;
			}
			
			// check if user with mobile already exists
			if(userDao.existsMobile(mobile)) {
				response.sendRedirect("/TakeTest/userPages/userRegister.jsp?error=user_already_exists");
				return;
			}
			
			// create new user 
			if(userDao.addUser(name, mobile, password)) {
				System.out.println("true value");
				response.sendRedirect("/TakeTest/userPages/userLogin.jsp");
			}
			else response.sendRedirect("/TakeTest/userPages/userRegister.jsp?error=try_again");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
