

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Validate
 */
@WebServlet("/Validate")
public class Validate extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	 //SQL Stuff
    Connection conn;
	Statement st;
	ResultSet rs;
	
	ResultSet searchResults;
	
    public Validate() {
        super();
        
        conn = null;
        st = null;
        rs = null;
        
        try {
        	
        	Class.forName("com.mysql.jdbc.Driver");
        	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tanksdb?user=root&password=root&useSSL=false");
            st = conn.createStatement();
            
            }
            
            catch(SQLException sqle)
            {
            	
            }
            
            catch(ClassNotFoundException cnfe)
            {
            	
            }
            
            finally {
    			try {
    				if (rs != null) {
    					rs.close();
    				}
    			} catch (SQLException sqle) {
    				System.out.println("sqle: " + sqle.getMessage());
    			}
    		}
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//System.out.println("A");
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String username = request.getParameter("uname");
		String password = request.getParameter("psw");
		//System.out.println(username);
		
		if(username != null)
		{
			try
			{	
				//System.out.println("SELECT * FROM users WHERE username='"+username+"' AND pass='"+password+"';");
				rs = st.executeQuery("SELECT * FROM users WHERE username='"+username+"' AND pass='"+password+"';");
				
				if(rs.next())
				{
					//login is valid
					System.out.println("Logged In");
					request.setAttribute("username", username);
					RequestDispatcher dispatch = request.getRequestDispatcher("Start.jsp");
					dispatch.forward(request, response);
					//response.sendRedirect("Start.jsp");
				}
				
				else
				{
					//login is invalid
					System.out.println("Nope");
					RequestDispatcher dispatch = request.getRequestDispatcher("Login.jsp");
					dispatch.forward(request, response);
				}
			}
				
			
			catch(SQLException sqle)
			{
				
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
