using System.Diagnostics;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using aaaaaa.Models;


namespace aaaaaa.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        var reseñas = BD.ObtenerTodasLasReseñas();
        foreach (var reseña in reseñas)
        {
            var usuario = BD.ObtenerUsuarioPorId(reseña.idAlumno);
            if (usuario != null)
            {
                reseña.Usuario = usuario; // Asignar el usuario a la reseña
            }
        }
        ViewBag.Reseñas = reseñas; // Pasamos las reseñas a la vista
        return View();
    }
    public IActionResult Comunidad()
    {
        return View();
    }
    public IActionResult Cursos()
    {
        ViewBag.Cursos = BD.ListarCursos();
        return View();
    }
    [HttpPost]
    public IActionResult Cursos(string rating, int año, string[] subject)
    {
        // Obtén todos los cursos
        var cursos = BD.ListarCursos();

        // Filtrar por valoraciones
        if (!string.IsNullOrEmpty(rating) && decimal.TryParse(rating, out decimal minRating))
        {
            cursos = cursos.Where(c => c.Valoracion >= minRating).ToList();
        }
        // Filtrar por año
        if (año != 0)
        {
            cursos = cursos.Where(c => c.AnioSecundaria == año).ToList();
        }

        // Filtrar por materias
        if (subject != null && subject.Length > 0)
        {
            cursos = cursos.Where(c => subject.Contains(c.Materia)).ToList();
        }

        // Pasar los cursos filtrados a la vista
        ViewBag.Cursos = cursos;
         // Pasar valores seleccionados
        ViewBag.SelectedRating = rating;
        ViewBag.SelectedAño = año;
        ViewBag.SelectedSubjects = subject;
        return View();
    }
    public IActionResult ComprarCurso(int idCurso)
    {
        var curso = BD.ObtenerCurso(idCurso);
        ViewBag.CursoAComprar = curso;
        return View();
    }
        public IActionResult CursoComprado(int idCurso)
        {
            var curso = BD.ObtenerCurso(idCurso);
            ViewBag.CursoComprado = curso;
            return View();
        }
    public IActionResult Profesores()
    {
        ViewBag.Profesores = BD.ListarProfesores();
        return View();
    }

    [HttpPost]
    public IActionResult Profesores(string rating, int popularity, string[] subject)
    {
        // Obtén todos los cursos
        var profesores =  BD.ListarProfesores();

        // Filtrar por valoraciones
        if (!string.IsNullOrEmpty(rating) && decimal.TryParse(rating, out decimal minRating))
        {
            profesores = profesores.Where(c => c.Valoracion >= minRating).ToList();
        }
        // Filtrar por año
        if (popularity != 0)
        {
            profesores = profesores.Where(c => c.Busquedas >= popularity).ToList();
        }

        // Filtrar por materias
        if (subject != null && subject.Length > 0)
        {
            profesores = profesores.Where(c => subject.Contains(c.Materia)).ToList();
        }

        // Pasar los cursos filtrados a la vista
        ViewBag.profesores = profesores;
         // Pasar valores seleccionados
        ViewBag.SelectedRating = rating;
        ViewBag.Selectedpopularity = popularity;
        ViewBag.SelectedSubjects = subject;
        return View();
    }

    public ActionResult Reseñas(int idAlumno)
    {
        var reseñas = BD.ObtenerTodasLasReseñas();
        foreach (var reseña in reseñas)
        {
            var usuario = BD.ObtenerUsuarioPorId(reseña.idAlumno);
            if (usuario != null)
            {
                reseña.Usuario = usuario; // Asignar el usuario a la reseña
            }
        }
        ViewBag.Reseñas = reseñas; // Pasamos las reseñas a la vista
        return View();
    }
    [HttpPost]
    public ActionResult Reseñas(string order)
    {
        var reseñas = BD.ObtenerTodasLasReseñas();
                        // ordenar por id
        if (order.Trim().ToLower() == "asc")
        {
            reseñas = reseñas.OrderBy(r => r.idAlumno).ToList();
        }
        else if (order.Trim().ToLower() == "desc")
        {
            reseñas = reseñas.OrderByDescending(r => r.idAlumno).ToList();
        }

        foreach (var reseña in reseñas)
        {
            var usuario = BD.ObtenerUsuarioPorId(reseña.idAlumno);
            if (usuario != null)
            {
                reseña.Usuario = usuario; // Asignar el usuario a la reseña
            }
        }


        ViewBag.Order = order; // Pasar el orden a la vista
        ViewBag.Reseñas = reseñas; // Pasamos las reseñas a la vista
        return View();
    }
    [HttpPost]
    public ActionResult CrearReseña(string texto)
    {
        string username = HttpContext.Session.GetString("user");;
        
        if (string.IsNullOrEmpty(username))
            return RedirectToAction("Login", "Account");
        // Validar que el texto no esté vacío
        if (!string.IsNullOrWhiteSpace(texto))
        {
            Usuario usuario = BD.ObtenerUsuarioPorUsername(username);
            if (usuario == null)
            {
                ViewBag.ErrorMessage = "Usuario no encontrado.";
                return View("Reseñas");
            }
            var idResena = this.generarIdResenaUnico(); // Generar un ID único para la reseña
           // Crear la nueva reseña en la base de datos (el idAlumno se genera automáticamente)
            BD.CrearReseña( idResena ,usuario.idAlumno,texto);
        }

        // Redirigir de vuelta al Index para actualizar la lista de reseñas
        return RedirectToAction("Reseñas");
    }
    public int generarIdResenaUnico()
    {
        var ultimoId = BD.ObtenerUltimoIdResena(); // Método que consulta el último ID en la base de datos
        return ultimoId + 1;
    }
    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
    public IActionResult Buscador(string query)
    {
        // Inicializar listas de cursos y profesores
        var cursos = BD.ListarCursos();
        var profesores = BD.ListarProfesores();

        if (query != null)
        {
            cursos = cursos.Where(c => c.Nombre.Contains(query, StringComparison.OrdinalIgnoreCase)).ToList();
            if (cursos.Count == 0)
            {
                ViewBag.MensajeCursos = "No se encontraron cursos con ese nombre.";
            }else{
                ViewBag.Cursos = cursos;
            }

            // Filtrar profesores por nombre
            profesores = profesores.Where(p => p.Nombre.Contains(query, StringComparison.OrdinalIgnoreCase)).ToList();
            if (profesores.Count == 0)
            {
                ViewBag.MensajeProfesores = "No se encontraron profesores con ese nombre.";
            }else{
                ViewBag.Profesores = profesores;
            }
        }else{
            ViewBag.MensajeCursos = "No se encontraron cursos con ese nombre.";
            ViewBag.MensajeProfesores = "No se encontraron profesores con ese nombre.";
        }

        ViewBag.Query = query; // Pasar la consulta original a la vista

        return View();
    }

    public int generarIdCursosUnico()
    {
        var ultimoId = BD.ObtenerUltimoIdCurso(); // Método que consulta el último ID en la base de datos
        return ultimoId + 1;
    }
    public IActionResult Admin()
    {
        // Verificar si el usuario es administrador
        string username = HttpContext.Session.GetString("user");
        if (string.IsNullOrEmpty(username))
            return RedirectToAction("Login", "Account");

        Usuario usuario = BD.ObtenerUsuarioPorUsername(username);
        if (usuario == null)
        {
            return RedirectToAction("Index"); // Redirigir a la página de inicio si no es admin
        }    
        ViewBag.Usuario = usuario; // Pasar el usuario a la vista

        var cursos = BD.ListarCursos();
        ViewBag.Cursos = cursos; // Pasar los cursos a la vista
        return View();
    }

        public IActionResult CrearCurso()
        {
            var profesores = BD.ListarProfesores();
            ViewBag.Profesores = profesores; // Pasar los profesores a la vista
            return View(); // Pasar el curso a la vista
        }
         [HttpPost]
        public IActionResult GuardarCurso(Cursos curso){

            curso.idCurso = this.generarIdCursosUnico();

            BD.InsertarCurso(curso);
            return RedirectToAction("Admin"); // Redirigir a la lista de cursos
        }

        public IActionResult EditarCurso(int idCurso)
        {
            // Obtener el curso por ID
            var curso = BD.ObtenerCurso(idCurso);
            if (curso == null)
            {
                return NotFound(); // Retornar 404 si no se encuentra el curso
            }
            return View(curso); // Pasar el curso a la vista
        }

        [HttpPost]
        public IActionResult EditarCurso(Cursos curso)
        {
            if (true)
            {
                // Actualizar el curso en la base de datos
                BD.ActualizarCurso(curso);
                return RedirectToAction("Admin"); // Redirigir a la lista de cursos
            }

            return View(curso); // Si hay errores, retornar la vista con los datos ingresados
        }

        public IActionResult EliminarCurso(int idCurso)
        {
            // Obtener el curso por ID
            var curso = BD.ObtenerCurso(idCurso);
            if (curso == null)
            {
                return NotFound(); // Retornar 404 si no se encuentra el curso
            }
            // Eliminar el curso de la base de datos
            BD.EliminarCurso(curso);
            return RedirectToAction("Admin");
        }
}
