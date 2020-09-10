package negocio;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import entidad.Profesor;
import dao.ProfesorDao;

@WebServlet("/servletLogin")
public class servletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public servletLogin() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		if(request.getParameter("btnIngresar") != null)
		{
			HttpSession session = request.getSession();
			
			Boolean login=false, admin=false;
			String inLegajo=request.getParameter("txtLegajo");
			String inClave=request.getParameter("txtClave");
			session.setAttribute("legajo", inLegajo);
			if(inLegajo.equals("admin"))
			{
				if(inLegajo.equals("admin") && inClave.equals("admin"))
				{
					admin=true;
					login = true;
				}
			}
			else
			{
				if(inLegajo.matches("[0-9]+"))
				{
					ProfesorDao pDao = new ProfesorDao();
					Profesor profesor = pDao.loginProfesor(inLegajo, inClave);
					if (inClave.equals(profesor.getClave()))
					{
						session.setAttribute("user", profesor);
						login = true;
					}
				}
			}
			session.setAttribute("login", login);
			session.setAttribute("admin", admin);
			RequestDispatcher miDispacher = request.getRequestDispatcher("/login.jsp");
		    miDispacher.forward(request, response);
		}
		
		if (request.getParameter("btnSalir") != null) 
		{  
			HttpSession session = request.getSession();
			session.invalidate();
		    response.sendRedirect("login.jsp");
		}
	}
}
