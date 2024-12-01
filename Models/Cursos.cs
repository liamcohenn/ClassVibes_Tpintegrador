public class Cursos
{
    public int idCurso { get; set; }
    public string Nombre { get; set; }
    public double Precio { get; set; }
    public string MetodoPago { get; set; }
    public int idProfesor { get; set; }
    public string Materia { get; set; }
    public int AnioSecundaria { get; set; }
    public double Valoracion { get; set; }
    public string fotoCurso { get; set; }
    public string Descripcion { get; set; }

    public Cursos() { }

    public Cursos(int idcurso, double precio, string metodopago, int idprofesor, string materia, int aniosecundaria, double valoracion, string fotocurso, string descripcion)
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
    }
}