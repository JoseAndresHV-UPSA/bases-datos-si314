using Biblioteca.Entidades;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace Biblioteca.Datos.DAO
{
    public class AutoriaDAO
    {
        private readonly ConexionDb _conexion = new ConexionDb();

        SqlDataReader Leer;
        SqlCommand Comando = new SqlCommand();

        public int Registrar(Autoria autoria)
        {
            Comando.Connection = _conexion.AbrirConexion();
            Comando.CommandText = "RegistrarAutoria";
            Comando.CommandType = CommandType.StoredProcedure;
            Comando.Parameters.AddWithValue("@IdAutor", autoria.Autor.IdAutor);
            Comando.Parameters.AddWithValue("@IdLibro", autoria.Libro.IdLibro);

            int result = Comando.ExecuteNonQuery();
            Comando.Parameters.Clear();

            return result;
        }

        public List<Autoria> ObtenerTodos()
        {
            Comando.Connection = _conexion.AbrirConexion();
            Comando.CommandText = "ObtenerAutoriasNombres";
            Comando.CommandType = CommandType.StoredProcedure;

            var lista = new List<Autoria>();

            Leer = Comando.ExecuteReader();
            while (Leer.Read())
            {
                var autor = new Autor()
                {
                    IdAutor = Leer.GetString(0),
                    Nombre = Leer.GetString(1)
                };

                var libro = new Libro()
                {
                    IdLibro = Leer.GetString(2),
                    Titulo = Leer.GetString(3),
                };

                lista.Add(new Autoria
                {
                    Autor = autor,
                    Libro = libro   
                });
            }

            _conexion.CerrarConexion();
            return lista;
        }

        public int Eliminar(Autoria autoria)
        {
            Comando.Connection = _conexion.AbrirConexion();
            Comando.CommandText = "EliminarAutoria";
            Comando.CommandType = CommandType.StoredProcedure;
            Comando.Parameters.AddWithValue("@IdAutor", autoria.Autor.IdAutor);
            Comando.Parameters.AddWithValue("@IdLibro", autoria.Libro.IdLibro);

            int result = Comando.ExecuteNonQuery();
            Comando.Parameters.Clear();

            return result;
        }
    }
}
