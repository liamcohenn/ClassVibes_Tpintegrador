public class Respuestas
{
    public int idRespuesta { get; set; }
    public int idPregunta { get; set; }
    public string Respuesta { get; set; }
    public DateTime FechaRespuesta { get; set; }

    public Respuestas() { }

    public Respuestas(int idrespuesta, int idpregunta, string respuesta, DateTime fecharespuesta)
    {
        idRespuesta = idrespuesta;
        idPregunta = idpregunta;
        Respuesta = respuesta;
        FechaRespuesta = fecharespuesta;
    }
}