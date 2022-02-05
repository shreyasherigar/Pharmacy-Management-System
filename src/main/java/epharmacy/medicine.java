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
 * Servlet implementation class medicine
 */
@WebServlet("/medicine")
public class medicine extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public medicine() {
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
		String id=request.getParameter("product_id");
		
		String name=request.getParameter("name");
		
		String pric=request.getParameter("price");
		
		String weight=request.getParameter("weight");
		
		String Expiry_date=request.getParameter("Expiry_date");
		
	    int product_id=Integer.parseInt(id);
	    int price=Integer.parseInt(pric);
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/pharmacy","root","root123");
			
			String qry="insert into medicines(product_id,medicine_name,price,weight_in_mg,expiry_date)values(?,?,?,?,?)";
			
			PreparedStatement ps=con.prepareStatement(qry);
			
			ps.setInt(1,product_id);ps.setString(2,name);ps.setDouble(3,price);ps.setString(4,weight);
			ps.setString(5,Expiry_date);
			
			int res=ps.executeUpdate();
			
			RequestDispatcher dispatch1=request.getRequestDispatcher("med.jsp");
			
			
			if(res!=0) {
				System.out.println("value updated");
				request.setAttribute("mess1", name+" has been successfully inserted into database.");
				
			}else {
				System.out.println("not logged in");
				request.setAttribute("mess1", name+" is not inserted into database." );
				
			}
			dispatch1.forward(request,response);
		  }catch(ClassNotFoundException e1){
				e1.printStackTrace();
			}catch(SQLException e1) {
				e1.printStackTrace();
			}
		
	}

}


