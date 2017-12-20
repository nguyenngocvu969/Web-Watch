package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDAO;
import model.Cart;
import model.Item;
import model.Product;


@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String command = request.getParameter("command");
		String idPro = request.getParameter("id_pro");
		String cat_id = request.getParameter("cat_id");
		Cart cart = (Cart) session.getAttribute("cart");
		int ProId = Integer.parseInt(idPro);
		String url="";
//		Vo truong di lam tiep
			Product product = new Product();
			try {
				product = ProductDAO.getProductByid(ProId);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			switch (command) {
			case "plus":
				System.out.println(idPro);
				if(cart.getCartItem().containsKey(ProId)) {
					Item item = new Item(product,cart.getCartItem().get(ProId).getQuantity());
//					System.out.println(item.getProduct().getName());
					cart.plusCart(Long.parseLong(idPro), item);
				}
				else {
					Item item = new Item(product,1);
//					System.out.println(product.getId());
					cart.plusCart(Long.parseLong(idPro), item);
				}
				url = "/Watches/products.jsp";
				break;
			case "remove":
				cart.removeCart(Long.parseLong(idPro));
				url = "/Watches/checkout.jsp";
				break;
			case "update":
				if(cart.getCartItem().containsKey(ProId)) {
					Item item = new Item(product,cart.getCartItem().get(ProId).getQuantity());
					System.out.println(item.getProduct().getName());
					cart.plusCart(Long.parseLong(idPro), item);
				}
				else {
					Item item = new Item(product,1);
					System.out.println(product.getId());
					cart.plusCart(Long.parseLong(idPro), item);
				}
				url = "/Watches/shoppingcart.jsp";
				break;
			default:
				break;
			}
		session.setAttribute("cart", cart);
		response.sendRedirect(url);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		String []quantity = request.getParameterValues("quantity");
		String [] ProId = request.getParameterValues("ProId");
		for(int i=0;i<cart.getCartItem().size();i++) {
			cart.getCartItem().get(Long.parseLong(ProId[i])).setQantity(Integer.parseInt(quantity[i]));
		}
		session.setAttribute("cart", cart);
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/shoppingcart.jsp");
		rd.forward(request, response);
	}


}