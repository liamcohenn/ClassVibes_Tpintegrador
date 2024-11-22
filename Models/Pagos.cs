public class Pagos
{
    public int idPago { get; set; }
    public int idAlumno { get; set; }
    public int idCurso { get; set; }
    public DateTime FechaPago { get; set; }
    public string MetodoPago { get; set; }
    public double Monto { get; set; }

    public Pagos() { }

    public Pagos(int idpago, int idalumno, int idcurso, DateTime fechapago, string metodopago, double monto)
    {
        idPago = idpago;
        idAlumno = idalumno;
        idCurso = idcurso;
        FechaPago = fechapago;
        MetodoPago = metodopago;
        Monto = monto;
    }
}