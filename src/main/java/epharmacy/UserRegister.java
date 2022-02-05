package epharmacy;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserRegister
 */
@WebServlet("/UserRegister")
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegister() {
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
		String username=request.getParameter("username");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String conpass=request.getParameter("confirm_password");
		
		if(password.equals(conpass)) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3307/pharmacy","root","root123");
				
				String qry="insert into users(username,email,password)values(?,?,?)";
				
				PreparedStatement ps=(PreparedStatement) con.prepareStatement(qry);
				
				ps.setString(1,username);ps.setString(2, email);ps.setString(3, password);
				
				int res=ps.executeUpdate();
				
				RequestDispatcher dispatch1=request.getRequestDispatcher("userLogin.jsp");
				RequestDispatcher dispatch2=request.getRequestDispatcher("register.jsp");
				
				if(res!=0) {
					
					request.setAttribute("mess1", "Account successfully created for "+username);
					dispatch1.forward(request,response);
				}else {
					
					request.setAttribute("mess1", "Something went wrong while creating account for "+username );
					dispatch2.forward(request,response);
				}
				
			  }catch(ClassNotFoundException e1){
					e1.printStackTrace();
				}catch(SQLException e1) {
					e1.printStackTrace();
				}
			
		}else {
			RequestDispatcher dispatch=request.getRequestDispatcher("register.jsp");
			request.setAttribute("mess1","Password mismatch");
			dispatch.forward(request,response);
		}
	
	}

}
