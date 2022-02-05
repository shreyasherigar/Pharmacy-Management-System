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
 * Servlet implementation class order
 */
@WebServlet("/order")
public class order extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public order() {
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
		String sname=request.getParameter("name");
        String phone=request.getParameter("phone");
        String address=request.getParameter("address");
        String pincode=request.getParameter("pincode");
        
        HttpSession session=request.getSession();
        session.setAttribute("name", sname);
        session.setAttribute("phone", phone);
        session.setAttribute("address", address);
        session.setAttribute("pincode", pincode);
         
        RequestDispatcher dispatch=request.getRequestDispatcher("cart.jsp");
        request.setAttribute("ordermess","Your order has been placed.");
        dispatch.forward(request, response);
	}

}
