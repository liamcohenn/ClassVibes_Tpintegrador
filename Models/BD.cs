using System.Data.SqlClient;
using Dapper;
public static class BD
{
    private static string _connectionString = @"Server=DESKTOP-0T2U3UG\SQLEXPRESS;DataBase=Tp_integrador;Trusted_Connection=true;";
    public static List<Profesores> _listaProfesores = new List<Profesores>();
    public static List<Reseñas> _listaReseñas = new List<Reseñas>();
    public static List<Cursos> _listaCursos = new List<Cursos>();

    public static Usuario ObtenerUsuario(string username, string contraseña)
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Usuario WHERE UserName = @username AND Contraseña = @contraseña";
            return db.QueryFirstOrDefault<Usuario>(sql, new { username = username, contraseña = contraseña });
        }
    }

        public static Usuario RegistrarUsuario(Usuario nuevoUsuario, string UserName)
        {
           using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = @"
                INSERT INTO Usuario (UserName, Contraseña, Nombre, Email, Telefono, Edad)
                VALUES (@pUserName, @pContraseña, @pNombre, @pEmail, @pTelefono, @pEdad);

                SELECT * FROM Usuario WHERE UserName = @pUserName;
            ";

                return db.QueryFirstOrDefault<Usuario>(sql, new 
                {
                    pUserName = nuevoUsuario.UserName,
                    pContraseña = nuevoUsuario.Contraseña,
                    pNombre = nuevoUsuario.Nombre,
                    pEmail = nuevoUsuario.Email,
                    pTelefono = nuevoUsuario.Telefono,
                    pEdad = nuevoUsuario.Edad
                });
            }
        }

        public static Usuario ObtenerUsuarioPorEmail(string email)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "SELECT * FROM Usuario WHERE Email = @pEmail";
                return db.QueryFirstOrDefault<Usuario>(sql, new { pEmail = email });
            }
        }
        public static bool ActualizarContrasena(string email, string contraseña)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "UPDATE Usuario SET Contraseña = @contraseña WHERE Email = @email";
                int filasAfectadas = db.Execute(sql, new { contraseña, email });
                return filasAfectadas > 0;
            }
        }
    // Obtiene todas las reseñas
        public static List<Reseñas> ObtenerTodasLasReseñas()
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "SELECT * FROM Reseñas";
                return db.Query<Reseñas>(sql).ToList();
            }
        }

        // Crea una nueva reseña
        public static void CrearReseña(string texto)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "INSERT INTO Reseñas (Texto) VALUES (@texto)";
                db.Execute(sql, new { texto });
            }
        }

        //PROFESORES

        public static List<Profesores> ListarProfesores()
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string SQL = "SELECT * FROM Profesores";
                _listaProfesores = db.Query<Profesores>(SQL).ToList();
            }
            return _listaProfesores;
        }

        //CURSOS
        public static List<Cursos> ListarCursos()
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string SQL = "SELECT * FROM Cursos";
                _listaCursos = db.Query<Cursos>(SQL).ToList();
            }
            return _listaCursos;
        }
        public static Cursos ObtenerCurso(int idcurso)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "SELECT * FROM Cursos WHERE idCurso = @idcurso";
                return db.QueryFirstOrDefault<Cursos>(sql, new { idcurso = idcurso });
            }
        }
    
}    