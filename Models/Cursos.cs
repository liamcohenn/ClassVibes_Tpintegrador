public class Cursos
{
    public int idCurso { get; set; }
    public string Nombre { get; set; }
    public double Precio { get; set; }
    public string MetodoPago { get; set; }
    public int idProfesor { get; set; }
    public string Materia { get; set; }
    public int AnioSecundaria { get; set; }
    public decimal  Valoracion { get; set; }
    public int cantAlumnos { get; set; }
    public string fotoCurso { get; set; }
    public string Descripcion { get; set; }
    public string videoCurso { get; set; }

    public Cursos() { }

    public Cursos(int idcurso, double precio, string metodopago, int idprofesor, string materia, int aniosecundaria, decimal  valoracion, string fotocurso, string descripcion, string nombre, int cantalumnos, string videocurso)
    {
        idCurso = idcurso;
        Precio = precio;
        MetodoPago = metodopago;
        idProfesor = idprofesor;
        Materia = materia;
        AnioSecundaria = aniosecundaria;
        Valoracion = valoracion;
        fotoCurso = fotocurso;
        Descripcion = descripcion;
        Nombre = nombre;
        cantAlumnos = cantalumnos;
        videoCurso = videocurso;    
    }
}