package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import model.Product;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		String command = request.getParameter("command");
		switch (command) {
		case "delete":
			try {
				ProductDAO.delete(Integer.parseInt(id));
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;

		default:
			break;
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/product.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String command = request.getParameter("command");
		String id_cat = request.getParameter("id_cat");
		String description = request.getParameter("description");
		String price = request.getParameter("price");
		String url = "";
		String id = request.getParameter("id");
		switch (command) {
		case "insert":
			Product p = new Product();
			p.setDesctiption(description);
			p.setId_cat(Integer.parseInt(id_cat));
			p.setName(name);
			p.setPrice(Double.parseDouble(price));
			try {
				ProductDAO.insert(p);
				out.println("<script type=\"text/javascript\">");
				   out.println("alert('Succeccfully');");
				   out.println("</script>");
				url = "/admin/product.jsp";
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				url = "/admin/insert_product.jsp";
			}
			break;
		case "update":
			Product pr = new Product();
			pr.setId(Integer.parseInt(id));
			pr.setDesctiption(description);
			pr.setId_cat(Integer.parseInt(id_cat));
			pr.setName(name);
			pr.setPrice(Double.parseDouble(price));
			try {
				ProductDAO.update(pr);
				url = "/admin/product.jsp";
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				url = "/admin/insert_product.jsp";
			}
			break;
		default: break;
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

	public static Product getProductByID(Long proId) {
		// TODO Auto-generated method stub
		return null;
	}

}
