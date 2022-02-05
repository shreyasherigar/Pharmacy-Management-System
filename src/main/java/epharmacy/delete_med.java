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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class delete
 */
@WebServlet("/delete_med")
public class delete_med extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delete_med() {
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
		HttpSession session=request.getSession();
		String id=request.getParameter("product_id");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/pharmacy","root","root123");
			
			String qry="delete from medicines where product_id="+id+"";
			
			PreparedStatement ps=con.prepareStatement(qry);
			
			
			
			int res=ps.executeUpdate();
			
			RequestDispatcher dispatch1=request.getRequestDispatcher("med.jsp");
			
			
			if(res!=0) {
				System.out.println("value updated");
				request.setAttribute("delmess", " Item has been deleted successfully.");
				
			}else {
				System.out.println("not logged in");
				request.setAttribute("delmess", "Item is not deleted from database." );
				
			}
			dispatch1.forward(request,response);
		  }catch(ClassNotFoundException e1){
				e1.printStackTrace();
			}catch(SQLException e1) {
				e1.printStackTrace();
			}
		
	}
	

}
