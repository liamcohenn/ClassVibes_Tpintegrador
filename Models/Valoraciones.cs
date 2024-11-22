public class Valoraciones
{
    public int idValoracion { get; set; }
    public int idCurso { get; set; }
    public int idAlumno { get; set; }
    public double Calificacion { get; set; }
    public string Comentario { get; set; }
    public DateTime Fecha { get; set; }

    public Valoraciones() { }

    public Valoraciones(int idvaloracion, int idcurso, int idalumno, double calificacion, string comentario, DateTime fecha)
    {
        idValoracion = idvaloracion;
        idCurso = idcurso;
        idAlumno = idalumno;
        Calificacion = calificacion;
        Comentario = comentario;
        Fecha = fecha;
    }
}