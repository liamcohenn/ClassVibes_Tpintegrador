public class Usuario
{
    public int idAlumno {get; set;}
    public DateTime fechaNacimiento {get; set;}
    public string Nombre {get; set;}
    public string Genero{get; set;}
    public int AnioSecundaria{get; set;}
    public string UserName {get; set;}
    public string Contraseña {get; set;}
    public string Email {get; set;}
    public string  Telefono {get; set;}
    public int Edad {get; set;}
    public string? fotoPerfil { get; set; }
    public IFormFile? FotoSubida { get; set; }

    public Usuario() {}
    public Usuario(int idalumno, DateTime fechanacimiento,  string nombre, string genero, int aniosecundaria, string username, string contraseña, string email, string telefono, int edad, string fotoperfil)
    {
        idAlumno = idAlumno;
        fechaNacimiento = fechanacimiento;
        Nombre = nombre;
        Genero = genero;
        AnioSecundaria = aniosecundaria;
        UserName = username;
        Contraseña = contraseña;
        Email = email;
        Telefono = telefono;
        Edad = edad;
        fotoPerfil = fotoperfil;
    }
    
}