public class Preguntas
{
    public int idPregunta { get; set; }
    public int idAlumno { get; set; }
    public string Materia { get; set; }
    public int AnioSecundaria { get; set; }
    public string Pregunta { get; set; }
    public DateTime FechaPregunta { get; set; }

    public Preguntas() { }

    public Preguntas(int idpregunta, int idalumno, string materia, int aniosecundaria, string pregunta, DateTime fechapregunta)
    {
        idPregunta = idpregunta;
        idAlumno = idalumno;
        Materia = materia;
        AnioSecundaria = aniosecundaria;
        Pregunta = pregunta;
        FechaPregunta = fechapregunta;
    }
}