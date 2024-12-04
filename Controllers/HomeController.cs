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
    if (!string.IsNullOrEmpty(rating) && int.TryParse(rating, out int minRating))
    {
        cursos = cursos.Where(c => c.Valoracion >= minRating).ToList();
    }

    // Filtrar por año
    cursos = cursos.Where(c => c.AnioSecundaria == año).ToList();

    // Filtrar por materias
    if (subject != null && subject.Length > 0)
    {
        cursos = cursos.Where(c => subject.Contains(c.Materia)).ToList();
    }

    // Pasar los cursos filtrados a la vista
    ViewBag.Cursos = cursos;
        return View();
    }
    public IActionResult ComprarCurso(int idCurso)
    {
        ViewBag.CursoAComprar = BD.ObtenerCurso(idCurso);
        return View();
    }
    public IActionResult CursoComprado()
    {
        return View();
    }
    public IActionResult Profesores()
    {
        ViewBag.Profesores = BD.ListarProfesores();
        return View();
    }
    public ActionResult Reseñas(int idAlumno)
    {
        var reseñas = BD.ObtenerTodasLasReseñas();
        ViewBag.Reseñas = reseñas; // Pasamos las reseñas a la vista
        return View();
    }
    [HttpPost]
    public ActionResult CrearReseña(string texto)
    {
        // Validar que el texto no esté vacío
        if (!string.IsNullOrWhiteSpace(texto))
        {
           // Crear la nueva reseña en la base de datos (el idAlumno se genera automáticamente)
            BD.CrearReseña(texto);
        }

        // Redirigir de vuelta al Index para actualizar la lista de reseñas
        return RedirectToAction("Reseñas");
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
}
