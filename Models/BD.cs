using System.Data.SqlClient;
using Dapper;
public static class BD
{
    private static string _connectionString = @"Server=localhost;DataBase=Tp_integrador;Trusted_Connection=true;";
    public static List<Profesores> _listaProfesores = new List<Profesores>();
    public static List<Reseñas> _listaReseñas = new List<Reseñas>();
    public static List<Cursos> _listaCursos = new List<Cursos>();


    public static Usuario ObtenerUsuarioPorUsername(string username)
{
    using (SqlConnection db = new SqlConnection(_connectionString))
    {
        string sql = "SELECT * FROM Usuario WHERE UserName = @username";
        return db.QueryFirstOrDefault<Usuario>(sql, new { username });
    }
}
    public static Usuario ObtenerUsuarioPorId(int idAlumno)
{
    using (SqlConnection db = new SqlConnection(_connectionString))
    {
        string sql = "SELECT * FROM Usuario WHERE idAlumno = @idAlumno";
        return db.QueryFirstOrDefault<Usuario>(sql, new { idAlumno });
    }
}



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
        public static void CrearReseña(int idResena,int idAlumno, string texto)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "INSERT INTO Reseñas (IdResena,Texto, idAlumno) VALUES (@idResena ,@texto, @idAlumno)";
                db.Execute(sql, new {  idResena, texto, idAlumno });
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

        public static void InsertarCurso(Cursos Curso)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = @"
                    INSERT INTO Cursos (
                        idCurso,
                        Nombre,
                        Precio,
                        MetodoPago,
                        idProfesor,
                        Materia,
                        AnioSecundaria,
                        Valoracion,
                        cantAlumnos,
                        fotoCurso,
                        Descripcion,
                        videoCurso
                    )
                    VALUES (
                        @idCurso,
                        @Nombre,
                        @Precio,
                        @MetodoPago,
                        @idProfesor,
                        @Materia,
                        @AnioSecundaria,
                        @Valoracion,
                        @cantAlumnos,
                        @fotoCurso,
                        @Descripcion,
                        @videoCurso
                    );
                ";

                db.Execute(sql, Curso);
            }
        }

        
       public static void EliminarCurso(Cursos Curso){
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "DELETE FROM Cursos WHERE idCurso = @idCurso";
                db.Execute(sql, new { idCurso = Curso.idCurso });
            }
       }
       public static void ActualizarCurso(Cursos Curso)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = @"
                    UPDATE Cursos
                    SET 
                        Nombre = @Nombre,
                        Precio = @Precio,
                        MetodoPago = @MetodoPago,
                        idProfesor = @idProfesor,
                        Materia = @Materia,
                        AnioSecundaria = @AnioSecundaria,
                        Valoracion = @Valoracion,
                        cantAlumnos = @cantAlumnos,
                        fotoCurso = @fotoCurso,
                        Descripcion = @Descripcion,
                        videoCurso = @videoCurso
                    WHERE idCurso = @idCurso;
                ";  
        
                db.Execute(sql, Curso);
            }
        }
       public static void ActualizarUsuario(Usuario usuario)
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = @"
                    UPDATE Usuario
                    SET 
                        UserName = @UserName,
                        Contraseña = @Contraseña,
                        Nombre = @Nombre,
                        Email = @Email,
                        Telefono = @Telefono,
                        Edad = @Edad,
                        fotoPerfil = @fotoPerfil,
                        fechaNacimiento = @fechaNacimiento,
                        Genero = @Genero,
                        AnioSecundaria = @AnioSecundaria
                    WHERE idAlumno = @idAlumno;
                ";

                db.Execute(sql, usuario);
            }
        }
        public static int ObtenerUltimoIdResena()
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "SELECT ISNULL(MAX(idResena), 0) FROM RESEÑAS";
                return db.QuerySingle<int>(sql);
            }
        }
        public static int ObtenerUltimoIdCurso()
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "SELECT ISNULL(MAX(idCurso), 0) FROM CURSOS";
                return db.QuerySingle<int>(sql);
            }
        }

    
}