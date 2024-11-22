using System.Diagnostics;
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
