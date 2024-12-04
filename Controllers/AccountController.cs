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
        // Si ya existe una sesión activa, redirige al perfil.
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
            // Configura la sesión
            HttpContext.Session.SetString("user", user.UserName);
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
        // Elimina la sesión
        HttpContext.Session.Remove("user");
        return RedirectToAction("Login");
    }

    public IActionResult MiPerfil(string username, string contraseña)
    {
        var user = HttpContext.Session.GetString("user");
        if (user == null)
        {
            return RedirectToAction("Login");
        }

        ViewBag.Usuario = BD.ObtenerUsuario(username, contraseña);
        return View();
    }
}
