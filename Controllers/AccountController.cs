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
        return View();
    }
    [HttpPost]
    public IActionResult Login(string username, string contraseña)
    {
        var user = BD.ObtenerUsuario(username, contraseña);
        ViewBag.Usuario = user;
        if (user != null)
        {
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

        string UserName = " ";
        usuarioNuevo = BD.RegistrarUsuario(usuarioNuevo, UserName);

        if (usuarioNuevo != null)
        {
            ViewBag.mensajeExito = "Registro exitoso. Por favor, inicia sesión.";
            return RedirectToAction("Login");
        }

        ViewBag.mensajeError = "Error al registrar el usuario.";
        return RedirectToAction("MiPerfil", "HomeController");
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

        bool actualizado = BD.ActualizarContrasena(usuario.UserName, usuario.Contraseña);
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
    public IActionResult MiPerfil()
    {
        return View();
    }
}
