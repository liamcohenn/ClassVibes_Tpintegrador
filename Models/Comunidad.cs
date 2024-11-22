public class Comunidad
{
    public int idComunidad { get; set; }
    public string Materia { get; set; }
    public int AnioSecundaria { get; set; }
    public int idAlumno { get; set; }
    public string Texto { get; set; }

    public Comunidad() { }

    public Comunidad(int idcomunidad, string materia, int aniosecundaria, int idalumno, string texto)
    {
        idComunidad = idcomunidad;
        Materia = materia;
        AnioSecundaria = aniosecundaria;
        idAlumno = idalumno;
        Texto = texto;
    }
}