using Biblioteca.Entidades;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace Biblioteca.Datos.DAO
{
    public class AutorDAO
    {
        private readonly ConexionDb _conexion = new ConexionDb();

        SqlDataReader Leer;
        SqlCommand Comando = new SqlCommand();

        public int Registrar(Autor autor)
        {
            Comando.Connection = _conexion.AbrirConexion();
            Comando.CommandText = "RegistrarAutor";
            Comando.CommandType = CommandType.StoredProcedure;
            Comando.Parameters.AddWithValue("@IdAutor", autor.IdAutor);
            Comando.Parameters.AddWithValue("@Nombre", autor.Nombre);
            Comando.Parameters.AddWithValue("@Nacionalidad", autor.Nacionalidad);

            int result = Comando.ExecuteNonQuery();
            Comando.Parameters.Clear();

            return result;
        }

        public List<Autor> ObtenerTodos()
        {
            Comando.Connection = _conexion.AbrirConexion();
            Comando.CommandText = "ObtenerAutores";
            Comando.CommandType = CommandType.StoredProcedure;

            var lista = new List<Autor>();

            Leer = Comando.ExecuteReader();
            while (Leer.Read())
            {
                lista.Add(new Autor
                {
                    IdAutor = Leer.GetString(0),
                    Nombre = Leer.GetString(1),
                    Nacionalidad = Leer.GetString(2),
                });
            }

            _conexion.CerrarConexion();
            return lista;
        }

        public Autor ObtenerPorId(string idAutor)
        {
            Comando.Connection = _conexion.AbrirConexion();
            Comando.CommandText = "ObtenerAutorPorId";
            Comando.CommandType = CommandType.StoredProcedure;
            Comando.Parameters.AddWithValue("@IdAutor", idAutor);

            var lista = new List<Autor>();

            Leer = Comando.ExecuteReader();
            while (Leer.Read())
            {
                lista.Add(new Autor
                {
                    IdAutor = Leer.GetString(0),
                    Nombre = Leer.GetString(1),
                    Nacionalidad = Leer.GetString(2),
                });
            }

            _conexion.CerrarConexion();
            return lista.First();
        }

        public int Actualizar(Autor autor)
        {
            Comando.Connection = _conexion.AbrirConexion();
            Comando.CommandText = "ActualizarAutor";
            Comando.CommandType = CommandType.StoredProcedure;
            Comando.Parameters.AddWithValue("@IdAutor", autor.IdAutor);
            Comando.Parameters.AddWithValue("@Nombre", autor.Nombre);
            Comando.Parameters.AddWithValue("@Nacionalidad", autor.Nacionalidad);

            int result = Comando.ExecuteNonQuery();
            Comando.Parameters.Clear();

            return result;
        }

        public int Eliminar(string idAutor)
        {
            Comando.Connection = _conexion.AbrirConexion();
            Comando.CommandText = "EliminarAutor";
            Comando.CommandType = CommandType.StoredProcedure;
            Comando.Parameters.AddWithValue("@IdAutor", idAutor);

            int result = Comando.ExecuteNonQuery();
            Comando.Parameters.Clear();

            return result;
        }
    }
}
