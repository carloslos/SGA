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
import dao.AlumnoDao;
import entidad.Alumno;

@WebServlet("/servletAlumno")
public class servletAlumno extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public servletAlumno() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		if(request.getParameter("btnAgregar")!=null)
		{
		    RequestDispatcher rd = request.getRequestDispatcher("agregarAlumno.jsp");
		    rd.forward(request, response); 
		}
		
		if(request.getParameter("btnRegistrar")!=null)
		{
			int filas=0;
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
		
			Alumno alumno = new Alumno();
			alumno.setApellido(apellido);
			alumno.setNombre(nombre);
			alumno.setDni(dni);
			alumno.setGenero(genero);
			alumno.setNacimiento(nacimiento);
			alumno.setTelefono(telefono);
			alumno.setDomicilio(domicilio);
			
			AlumnoDao alumnoDao = new AlumnoDao();
			filas = alumnoDao.agregarAlumno(alumno);
			request.setAttribute("cantFilas",filas);
		    RequestDispatcher rd = request.getRequestDispatcher("agregarAlumno.jsp");
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
		
			Alumno alumno = new Alumno();
			alumno.setLegajoA(legajo);
			alumno.setNombre(nombre);
			alumno.setApellido(apellido);
			alumno.setDni(dni);
			alumno.setGenero(genero);
			alumno.setNacimiento(nacimiento);
			alumno.setTelefono(telefono);
			alumno.setDomicilio(domicilio);
			
			AlumnoDao alumnoDao = new AlumnoDao();
			filas=alumnoDao.editarAlumno(alumno);
			request.setAttribute("legajo",alumno.getLegajoA());
			request.setAttribute("cantFilas",filas);
		    RequestDispatcher rd = request.getRequestDispatcher("editarAlumno.jsp");
		    rd.forward(request, response); 
		}
		
		if(request.getParameter("btnModificar")!=null)
		{
			if(request.getParameter("alumnoEdit")!= null) 
			{
				int legajo = Integer.parseInt(request.getParameter("alumnoEdit"));
				request.setAttribute("legajo", legajo);
			}
		    RequestDispatcher rd = request.getRequestDispatcher("editarAlumno.jsp");
		    rd.forward(request, response); 
		}
		
		if(request.getParameter("btnEliminar")!=null)
		{
			if(request.getParameter("alumnoEdit")!= null) 
			{
				int legajo = Integer.parseInt(request.getParameter("alumnoEdit"));
				AlumnoDao aDao = new AlumnoDao();
				if(aDao.alumnoLibre(legajo))
				{
					aDao.eliminarAlumno(legajo);
				}
			}
		    RequestDispatcher rd = request.getRequestDispatcher("alumnos.jsp");
		    rd.forward(request, response); 
		}
		
		if(request.getParameter("btnVolver") != null)
		{
		    RequestDispatcher rd = request.getRequestDispatcher("menu.jsp");
		    rd.forward(request, response); 
		}
		
		if(request.getParameter("btnVolverA") != null)
		{
		    RequestDispatcher rd = request.getRequestDispatcher("alumnos.jsp");
		    rd.forward(request, response); 
		}
		
		if(request.getParameter("btnVolverE") != null)
		{
		    RequestDispatcher rd = request.getRequestDispatcher("alumnos.jsp");
		    rd.forward(request, response); 
		}
	}
}

