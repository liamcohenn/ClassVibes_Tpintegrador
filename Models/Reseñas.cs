public class Reseñas
{
    public int idReseña { get; set; }
    public int idAlumno { get; set; }
    public string Texto { get; set; }
    public Usuario Usuario { get; set; } // Nueva propiedad para el usuario
    public Reseñas() { }

    public Reseñas(int idreseña, int idalumno, string texto)
    {
        idReseña = idreseña;
        idAlumno = idalumno;
        Texto = texto;
        Usuario = null; // Inicializar el usuario como null
    }
}