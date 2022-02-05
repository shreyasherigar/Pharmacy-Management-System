package epharmacy;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;

import epharmacy.userModal;
import epharmacy.userDao;

/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/userLogin")
public class userLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	private userDao userDao;
	
	public void init() {
		userDao = new userDao();
	}
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userLogin() {
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
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		userModal users = new userModal();
		users.setEmail(email);
		users.setPassword(password);
		
		try {
			if (userDao.validate(users)) {
				//HttpSession session = request.getSession();
				// session.setAttribute("username",username);
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/pharmacy","root","root123");
				
				String qry="select * from users where email='"+email+"'";
				
				PreparedStatement ps=con.prepareStatement(qry);
				ResultSet rs = ps.executeQuery();
				if(rs.next()) {
					
					String name=rs.getString("username");
					
				
					HttpSession session=request.getSession();
					session.setAttribute("user",name);
					response.sendRedirect("home.jsp");
				}
			} else {
				HttpSession session = request.getSession();
				//session.setAttribute("user", username);
//				response.sendRedirect("index.jsp");
				RequestDispatcher dispatch=request.getRequestDispatcher("userLogin.jsp");
				request.setAttribute("mess0", "Account not found! Please sign up");
			
				dispatch.forward(request, response);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e1) {
			e1.printStackTrace();
		}
	}

}