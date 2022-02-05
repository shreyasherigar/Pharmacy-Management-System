package epharmacy;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Add_to_cart
 */
@WebServlet("/Add_to_cart_med")
public class Add_to_cart_med extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_to_cart_med() {
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
	       
		String id=(String)request.getParameter("product_id");
		int prod_id=Integer.parseInt(id);
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/pharmacy","root","root123");
			
			String qry="select * from medicines where product_id="+prod_id+"";
			
			PreparedStatement ps=con.prepareStatement(qry);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				int product_id=rs.getInt("product_id");
				String product_name=rs.getString("medicine_name");
				double price=rs.getDouble("price");
				double weight_in_mg=rs.getDouble("weight_in_mg");
				String expiry_date=rs.getString("expiry_date");
			
			System.out.println(product_id);
			String qry2="insert into cart(product_id,product_name,price,weight_in_mg,expiry_date)values(?,?,?,?,?)";
				
			PreparedStatement ps2=con.prepareStatement(qry2);
			ps2.setInt(1,product_id);ps2.setString(2,product_name);ps2.setDouble(3,price);ps2.setDouble(4,weight_in_mg);
			ps2.setString(5,expiry_date);
			
			
			
			int res=ps2.executeUpdate();
			
			RequestDispatcher dispatch1=request.getRequestDispatcher("med.jsp");
			
			
			if(res!=0) {
				System.out.println("value updated");
				request.setAttribute("cart_mess", product_name+" is added to the cart.");
				
			}else {
				System.out.println("not logged in");
				request.setAttribute("cart_mess", product_name+" is not added to cart." );
				
			}
			dispatch1.forward(request,response);
			}
		  }catch(ClassNotFoundException e1){
				e1.printStackTrace();
			}catch(SQLException e1) {
				e1.printStackTrace();
			}
		
	}
	

}
