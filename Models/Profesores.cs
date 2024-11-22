public class Profesores
{
    public int idProfesor { get; set; }
    public string Materia { get; set; }
    public string Nombre {get; set;}
    public double Valoracion { get; set; }
    public int Busquedas { get; set; }
    public int CantCursos { get; set; }
    public int CantAlumnos { get; set; }
    public int Experiencia { get; set; }
    public string fotoPerfil { get; set; }

    public Profesores() { }

    public Profesores(int idprofesor, string materia, string nombre, double valoracion, int busquedas, int cantcursos, int cantalumnos, int experiencia, string fotoperfil)
    {
        idProfesor = idprofesor;
        Materia = materia;
        Nombre = nombre;
        Valoracion = valoracion;
        Busquedas = busquedas;
        CantCursos = cantcursos;
        CantAlumnos = cantalumnos;
        Experiencia = experiencia;
        fotoPerfil = fotoperfil;
    }
}