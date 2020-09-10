package negocio;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CursoDao;
import entidad.Alumno;
import entidad.Curso;

@WebServlet("/servletCurso")
public class servletCurso extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public servletCurso() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		if(request.getParameter("btnAgregar")!=null)
		{
		    RequestDispatcher rd = request.getRequestDispatcher("agregarCurso.jsp");
		    rd.forward(request, response); 
		}
		
		if(request.getParameter("btnRegistrar")!=null)
		{
			int filas=0;
			short id_materia = Short.parseShort(request.getParameter("ddlMateria").toString());
			int legajo_p = Integer.parseInt(request.getParameter("ddlProfesor").toString());
			short cuatrimestre = Short.parseShort(request.getParameter("ddlCuatrimestre").toString());
			short periodo = Short.parseShort(request.getParameter("datePeriodo").toString());
			
			Curso curso = new Curso();
			curso.setIdMateria(id_materia);
			curso.setLegajoP(legajo_p);
			curso.setCuatrimestre(cuatrimestre);
			curso.setPeriodo(periodo);
			
			CursoDao cursoDao = new CursoDao();
			filas = cursoDao.agregarCurso(curso);
			request.setAttribute("cantFilas",filas);
		    RequestDispatcher rd = request.getRequestDispatcher("agregarCurso.jsp");
		    rd.forward(request, response); 
		}	
		
		if(request.getParameter("btnGuardar")!=null)
		{
			int filas=0;
			short idCurso = Short.parseShort(request.getParameter("idCurso").toString());
			HttpSession session = request.getSession();
			
			CursoDao cDao = new CursoDao();
			ArrayList<Alumno> list = cDao.obtenerNotas(idCurso);
			
			for(Alumno item: list)
			{
				Alumno alumno = new Alumno();
				alumno.setLegajoA(item.getLegajoA());
				String legajo = Integer.toString(item.getLegajoA());
				if(!request.getParameter("parcial1_"+legajo).toString().equals(""))
					alumno.notas.setParcial1(Short.parseShort(request.getParameter("parcial1_"+legajo).toString()));
				if(!request.getParameter("parcial2_"+legajo).toString().equals(""))
					alumno.notas.setParcial2(Short.parseShort(request.getParameter("parcial2_"+legajo).toString()));
				if(!request.getParameter("recu1_"+legajo).toString().equals(""))
				alumno.notas.setRecu1(Short.parseShort(request.getParameter("recu1_"+legajo).toString()));
					if(!request.getParameter("recu2_"+legajo).toString().equals(""))
					alumno.notas.setRecu2(Short.parseShort(request.getParameter("recu2_"+legajo).toString()));
				
				filas += cDao.guardarNotas(alumno,idCurso);
			}
			
			request.setAttribute("cantFilas",filas);
			request.setAttribute("idCurso",idCurso);
		    RequestDispatcher rd = request.getRequestDispatcher("cursoP.jsp");
		    rd.forward(request, response); 
		}	
		
		if(request.getParameter("btnVisualizarA")!=null)
		{
			if(request.getParameter("cursoEdit")!= null) 
			{
				Short idCurso = Short.parseShort(request.getParameter("cursoEdit"));
				request.setAttribute("idCurso", idCurso);
			}
		    RequestDispatcher rd = request.getRequestDispatcher("cursoA.jsp");
		    rd.forward(request, response); 
		}
		
		if(request.getParameter("btnVisualizarP")!=null)
		{
			if(request.getParameter("cursoEdit")!= null) 
			{
				Short idCurso = Short.parseShort(request.getParameter("cursoEdit"));
				request.setAttribute("idCurso", idCurso);
			}
		    RequestDispatcher rd = request.getRequestDispatcher("alumnosP.jsp");
		    rd.forward(request, response); 
		}
		
		if(request.getParameter("btnCalificar")!=null)
		{
			if(request.getParameter("cursoEdit")!= null) 
			{
				Short idCurso = Short.parseShort(request.getParameter("cursoEdit"));
				request.setAttribute("idCurso", idCurso);
			}
		    RequestDispatcher rd = request.getRequestDispatcher("cursoP.jsp");
		    rd.forward(request, response); 
		}
		
		if(request.getParameter("btnAsignarAlumnos")!=null)
		{
			if(request.getParameter("cursoEdit")!= null) 
			{
				Short idCurso = Short.parseShort(request.getParameter("cursoEdit"));
				request.setAttribute("idCurso", idCurso);
			}
		    RequestDispatcher rd = request.getRequestDispatcher("asignarAlumnos.jsp");
		    rd.forward(request, response); 
		}
		
		if(request.getParameter("btnAsignar")!=null)
		{
			int filas=0;
			short id_curso = Short.parseShort(request.getParameter("cursoEdit").toString());
			int legajo_a = Integer.parseInt(request.getParameter("alumnoEdit").toString());
			
			CursoDao cursoDao = new CursoDao();
			filas = cursoDao.asignarAlumno(id_curso,legajo_a);
			request.setAttribute("cantFilas",filas);
			request.setAttribute("idCurso", id_curso);
		    RequestDispatcher rd = request.getRequestDispatcher("asignarAlumnos.jsp");
		    rd.forward(request, response); 
		}	
		
		if(request.getParameter("btnQuitar")!=null)
		{
			if(request.getParameter("alumnoEdit")!= null) 
			{
				short id_curso = Short.parseShort(request.getParameter("cursoEdit").toString());
				int legajo_a = Integer.parseInt(request.getParameter("alumnoEdit").toString());

				CursoDao cursoDao = new CursoDao();
				cursoDao.quitarAlumno(id_curso,legajo_a);
				request.setAttribute("idCurso", id_curso);
			}
		    RequestDispatcher rd = request.getRequestDispatcher("asignarAlumnos.jsp");
		    rd.forward(request, response); 
		}
		
		if(request.getParameter("btnRegular")!=null)
		{
			short id_curso = Short.parseShort(request.getParameter("idCurso").toString());
			int legajo_a = Integer.parseInt(request.getParameter("legajo").toString());
			
			CursoDao cursoDao = new CursoDao();
			cursoDao.cambiarEstado(id_curso,legajo_a,(short)1);
			request.setAttribute("idCurso", id_curso);
		    RequestDispatcher rd = request.getRequestDispatcher("alumnosP.jsp");
		    rd.forward(request, response); 
		}	
		
		if(request.getParameter("btnNoRegular")!=null)
		{
			HttpSession session = request.getSession();
			short id_curso = Short.parseShort(request.getParameter("idCurso").toString());
			int legajo_a = Integer.parseInt(request.getParameter("legajo").toString());
			
			CursoDao cursoDao = new CursoDao();
			cursoDao.cambiarEstado(id_curso,legajo_a,(short)0);
			request.setAttribute("idCurso", id_curso);
		    RequestDispatcher rd = request.getRequestDispatcher("alumnosP.jsp");
		    rd.forward(request, response); 
		}	
		
		if(request.getParameter("btnVolver")!=null)
		{
		    RequestDispatcher rd = request.getRequestDispatcher("menu.jsp");
		    rd.forward(request, response); 
		}
		
		if(request.getParameter("btnVolverA") != null)
		{
		    RequestDispatcher rd = request.getRequestDispatcher("cursosA.jsp");
		    rd.forward(request, response); 
		}
		
		if(request.getParameter("btnVolverP") != null)
		{
		    RequestDispatcher rd = request.getRequestDispatcher("cursosP.jsp");
		    rd.forward(request, response); 
		}
	}
}
