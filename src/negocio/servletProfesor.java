package negocio;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.ProfesorDao;
import entidad.Profesor;

@WebServlet("/servletProfesor")
public class servletProfesor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public servletProfesor() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		if(request.getParameter("btnAgregar")!=null)
		{
		    RequestDispatcher rd = request.getRequestDispatcher("agregarProfesor.jsp");
		    rd.forward(request, response); 
		}
		
		if(request.getParameter("btnRegistrar")!=null)
		{
			int filas=0;
			String nombre = request.getParameter("txtNombre");
			String apellido = request.getParameter("txtApellido");
			String clave = request.getParameter("txtClave");
			int dni = Integer.parseInt(request.getParameter("txtDni").toString());
			short genero = Short.parseShort(request.getParameter("ddlGenero").toString());
			int telefono = Integer.parseInt(request.getParameter("txtTelefono").toString());
			String domicilio = request.getParameter("txtDomicilio");
			String fecha = request.getParameter("dateNacimiento");
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); // your template here
			java.util.Date srtFecha;
			java.sql.Date nacimiento=null;
			try 
			{
				srtFecha = formatter.parse(fecha);
				nacimiento = new java.sql.Date(srtFecha.getTime());
			} 
			catch (ParseException e) 
			{
				e.printStackTrace();
			}
			
			Profesor profesor = new Profesor();
			profesor.setApellido(apellido);
			profesor.setNombre(nombre);
			profesor.setClave(clave);
			profesor.setDni(dni);
			profesor.setGenero(genero);
			profesor.setNacimiento(nacimiento);
			profesor.setTelefono(telefono);
			profesor.setDomicilio(domicilio);
			
			ProfesorDao profesorDao = new ProfesorDao();
			filas = profesorDao.agregarProfesor(profesor);
			request.setAttribute("cantFilas",filas);
		    RequestDispatcher rd = request.getRequestDispatcher("agregarProfesor.jsp");
		    rd.forward(request, response); 
		}	
		
		if(request.getParameter("btnEditar")!=null)
		{
			int filas=0;
			int legajo = Integer.parseInt(request.getParameter("txtLegajo").toString());
			String nombre = request.getParameter("txtNombre");
			String apellido = request.getParameter("txtApellido");
			int dni = Integer.parseInt(request.getParameter("txtDni").toString());
			short genero = Short.parseShort(request.getParameter("ddlGenero").toString());
			int telefono = Integer.parseInt(request.getParameter("txtTelefono").toString());
			String domicilio = request.getParameter("txtDomicilio");
			String fecha = request.getParameter("dateNacimiento");
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date srtFecha;
			java.sql.Date nacimiento=null;
			try 
			{
				srtFecha = formatter.parse(fecha);
				nacimiento = new java.sql.Date(srtFecha.getTime());
			} 
			catch (ParseException e) 
			{
				e.printStackTrace();
			}
		
			Profesor profesor = new Profesor();
			profesor.setLegajoP(legajo);
			profesor.setNombre(nombre);
			profesor.setApellido(apellido);
			profesor.setDni(dni);
			profesor.setGenero(genero);
			profesor.setNacimiento(nacimiento);
			profesor.setTelefono(telefono);
			profesor.setDomicilio(domicilio);
			
			ProfesorDao profesorDao = new ProfesorDao();
			filas=profesorDao.editarProfesor(profesor);
			request.setAttribute("legajo",profesor.getLegajoP());
			request.setAttribute("cantFilas",filas);
		    RequestDispatcher rd = request.getRequestDispatcher("editarProfesor.jsp");
		    rd.forward(request, response); 
		}
		
		if(request.getParameter("btnModificar")!=null)
		{
			if(request.getParameter("profesorEdit")!= null) 
			{
				int legajo = Integer.parseInt(request.getParameter("profesorEdit"));
				request.setAttribute("legajo", legajo);
			}
		    RequestDispatcher rd = request.getRequestDispatcher("editarProfesor.jsp");
		    rd.forward(request, response); 
		}
		
		if(request.getParameter("btnClave")!=null)
		{
			if(request.getParameter("profesorEdit")!= null) 
			{
				int legajo = Integer.parseInt(request.getParameter("profesorEdit"));
				request.setAttribute("legajo", legajo);
			}
		    RequestDispatcher rd = request.getRequestDispatcher("claveProfesor.jsp");
		    rd.forward(request, response); 
		}
		
		if(request.getParameter("btnEditarClave")!=null)
		{
			int filas=0;
			int legajo = Integer.parseInt(request.getParameter("txtLegajo").toString());
			String clave = request.getParameter("txtClave");
		
			Profesor profesor = new Profesor();
			profesor.setLegajoP(legajo);
			profesor.setClave(clave);

			ProfesorDao profesorDao = new ProfesorDao();
			filas=profesorDao.editarClave(profesor);
			request.setAttribute("legajo",profesor.getLegajoP());
			request.setAttribute("cantFilas",filas);
		    RequestDispatcher rd = request.getRequestDispatcher("claveProfesor.jsp");
		    rd.forward(request, response); 
		}
		
		if(request.getParameter("btnEliminar")!=null)
		{
			if(request.getParameter("profesorEdit")!= null) 
			{
				int legajo = Integer.parseInt(request.getParameter("profesorEdit"));
				ProfesorDao pDao = new ProfesorDao();
				if(pDao.profesorLibre(legajo))
				{
					pDao.eliminarProfesor(legajo);
				}
			}
		    RequestDispatcher rd = request.getRequestDispatcher("profesores.jsp");
		    rd.forward(request, response); 
		}
		
		if(request.getParameter("btnVolver") != null)
		{
		    RequestDispatcher rd = request.getRequestDispatcher("menu.jsp");
		    rd.forward(request, response); 
		}
		
		if(request.getParameter("btnVolverP") != null)
		{
		    RequestDispatcher rd = request.getRequestDispatcher("profesores.jsp");
		    rd.forward(request, response); 
		}
		
		if(request.getParameter("btnVolverC") != null)
		{
		    RequestDispatcher rd = request.getRequestDispatcher("profesores.jsp");
		    rd.forward(request, response); 
		}
		
		if(request.getParameter("btnVolverE") != null)
		{
		    RequestDispatcher rd = request.getRequestDispatcher("profesores.jsp");
		    rd.forward(request, response); 
		}
	}
}
