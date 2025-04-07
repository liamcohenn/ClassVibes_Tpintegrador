using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using aaaaaa.Models;

namespace aaaaaa.Controllers;

public class AccountController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public AccountController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Login()
    {
        if (HttpContext.Session.GetString("user") != null)
        {
            return RedirectToAction("MiPerfil");
        }
        return View();
    }

    [HttpPost]
    public IActionResult Login(string username, string contraseña)
    {
        var user = BD.ObtenerUsuario(username, contraseña);
        if (user != null)
        {
            HttpContext.Session.SetString("user", user.UserName);
            HttpContext.Session.SetInt32("useridAlumno", user.idAlumno); // si tenés un ID
            return RedirectToAction("MiPerfil");
        }
        else
        {
            ViewBag.ErrorMessage = "Usuario o contraseña incorrectos.";
            return View();
        }
    }

    public IActionResult Registro()
    {
        return View();
    }

     [HttpPost]
    public IActionResult Registro(Usuario usuarioNuevo, string contraConfirmada)
    {
        if (usuarioNuevo.Contraseña != contraConfirmada)
        {
            ViewBag.mensajeError = "Las contraseñas no coinciden.";
            return View();
        }

        usuarioNuevo = BD.RegistrarUsuario(usuarioNuevo, usuarioNuevo.UserName);

        if (usuarioNuevo != null)
        {
            // Inicia sesión automáticamente tras el registro
            //HttpContext.Session.SetString("user", usuarioNuevo.UserName);
            return RedirectToAction("Login");
        }

        ViewBag.mensajeError = "Error al registrar el usuario.";
        return View();
    }


    public IActionResult OlvideContraseña()
    {
        return View();
    }

    [HttpPost]
    public IActionResult OlvideContraseña(string email, string nuevaContrasena, string confirmarContrasena)
    {
        if (nuevaContrasena != confirmarContrasena)
        {
            ViewBag.ErrorMessage = "Las contraseñas no coinciden.";
            return View();
        }

        var usuario = BD.ObtenerUsuarioPorEmail(email);
        if (usuario == null)
        {
            ViewBag.ErrorMessage = "Usuario o correo electrónico no encontrado.";
            return View();
        }

        bool actualizado = BD.ActualizarContrasena(usuario.Email, nuevaContrasena);
        if (actualizado)
        {
            ViewBag.SuccessMessage = "La contraseña ha sido actualizada exitosamente.";
            return RedirectToAction("Login");
        }
        else
        {
            ViewBag.ErrorMessage = "Hubo un error al actualizar la contraseña.";
        }

        return View();
    }

    public IActionResult Logout()
    {
        HttpContext.Session.Clear(); // Limpia toda la sesión
        return RedirectToAction("Login");
    }

    public IActionResult MiPerfil()
    {
        string username = HttpContext.Session.GetString("username"); // o donde lo estés guardando al loguear
        if (string.IsNullOrEmpty(username))
            return RedirectToAction("Login");

        Usuario usuario = BD.ObtenerUsuarioPorUsername(username);
        return View(usuario);
    }

}
