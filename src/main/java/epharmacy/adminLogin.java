package epharmacy;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class adminLogin
 */
@WebServlet("/adminLogin")
public class adminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email=request.getParameter("email");
		String pass=request.getParameter("password");
		
		if(email.equals("admin@gmail.com") && pass.equals("admin")) {
			RequestDispatcher dispatch=request.getRequestDispatcher("home.jsp");
			//created session for admin
			HttpSession session=request.getSession();
			session.setAttribute("user",email);
			
			request.setAttribute("mess","successfull");
			System.out.print("mess");
			dispatch.forward(request,response);
		}else {
			RequestDispatcher dispatch=request.getRequestDispatcher("adlogin.jsp");
			request.setAttribute("mess","Invalid Email or Password..");
			dispatch.forward(request,response);
		}
	}

}
