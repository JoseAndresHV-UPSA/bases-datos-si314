using Biblioteca.Entidades;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace Biblioteca.Datos.DAO
{
    public class LibroDAO
    {
        private readonly ConexionDb _conexion = new ConexionDb();

        SqlDataReader Leer;
        SqlCommand Comando = new SqlCommand();

        public int Registrar(Libro libro)
        {
            Comando.Connection = _conexion.AbrirConexion();
            Comando.CommandText = "RegistrarLibro";
            Comando.CommandType = CommandType.StoredProcedure;
            Comando.Parameters.AddWithValue("@IdLibro", libro.IdLibro);
            Comando.Parameters.AddWithValue("@Titulo", libro.Titulo);
            Comando.Parameters.AddWithValue("@Subtitulo", libro.Subtitulo);
            Comando.Parameters.AddWithValue("@Editorial", libro.Editorial);
            Comando.Parameters.AddWithValue("@Area", libro.Area);
            Comando.Parameters.AddWithValue("@AñoPublicacion", libro.AnioPublicacion);
            Comando.Parameters.AddWithValue("@TotalPaginas", libro.TotalPaginas);
            Comando.Parameters.AddWithValue("@Edicion", libro.Edicion);

            int result = Comando.ExecuteNonQuery();
            Comando.Parameters.Clear();

            return result;
        }

        public List<Libro> ObtenerTodos()
        {
            Comando.Connection = _conexion.AbrirConexion();
            Comando.CommandText = "ObtenerLibros";
            Comando.CommandType = CommandType.StoredProcedure;

            var lista = new List<Libro>();

            Leer = Comando.ExecuteReader();
            while (Leer.Read())
            {
                lista.Add(new Libro
                {
                    IdLibro = Leer.GetString(0),
                    Titulo = Leer.GetString(1),
                    Subtitulo = Leer.GetString(2),
                    Editorial = Leer.GetString(3),
                    Area = Leer.GetString(4),
                    AnioPublicacion = Leer.GetString(5),
                    TotalPaginas = Leer.GetInt32(6),
                    Edicion = Leer.GetString(7)
                });
            }

            _conexion.CerrarConexion();
            return lista;
        }

        public Libro ObtenerPorId(string idLibro)
        {
            Comando.Connection = _conexion.AbrirConexion();
            Comando.CommandText = "ObtenerLibroPorId";
            Comando.CommandType = CommandType.StoredProcedure;
            Comando.Parameters.AddWithValue("@IdLibro", idLibro);

            var lista = new List<Libro>();

            Leer = Comando.ExecuteReader();
            while (Leer.Read())
            {
                lista.Add(new Libro
                {
                    IdLibro = Leer.GetString(0),
                    Titulo = Leer.GetString(1),
                    Subtitulo = Leer.GetString(2),
                    Editorial = Leer.GetString(3),
                    Area = Leer.GetString(4),
                    AnioPublicacion = Leer.GetString(5),
                    TotalPaginas = Leer.GetInt32(6),
                    Edicion = Leer.GetString(7)
                });
            }

            _conexion.CerrarConexion();
            return lista.First();
        }

        public int Actualizar(Libro libro)
        {
            Comando.Connection = _conexion.AbrirConexion();
            Comando.CommandText = "ActualizarLibro";
            Comando.CommandType = CommandType.StoredProcedure;
            Comando.Parameters.AddWithValue("@IdLibro", libro.IdLibro);
            Comando.Parameters.AddWithValue("@Titulo", libro.Titulo);
            Comando.Parameters.AddWithValue("@Subtitulo", libro.Subtitulo);
            Comando.Parameters.AddWithValue("@Editorial", libro.Editorial);
            Comando.Parameters.AddWithValue("@Area", libro.Area);
            Comando.Parameters.AddWithValue("@AñoPublicacion", libro.AnioPublicacion);
            Comando.Parameters.AddWithValue("@TotalPaginas", libro.TotalPaginas);
            Comando.Parameters.AddWithValue("@Edicion", libro.Edicion);

            int result = Comando.ExecuteNonQuery();
            Comando.Parameters.Clear();

            return result;
        }

        public int Eliminar(string idLibro)
        {
            Comando.Connection = _conexion.AbrirConexion();
            Comando.CommandText = "EliminarLibro";
            Comando.CommandType = CommandType.StoredProcedure;
            Comando.Parameters.AddWithValue("@IdLibro", idLibro);

            int result = Comando.ExecuteNonQuery();
            Comando.Parameters.Clear();

            return result;
        }
    }
}
