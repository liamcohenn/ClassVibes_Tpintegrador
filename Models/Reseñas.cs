public class Reseñas
{
    public int idReseña { get; set; }
    public int idAlumno { get; set; }
    public string Texto { get; set; }

    public Reseñas() { }

    public Reseñas(int idreseña, int idalumno, string texto)
    {
        idReseña = idreseña;
        idAlumno = idalumno;
        Texto = texto;
    }
}