using System.Data;
using System.Data.SqlClient;

namespace Biblioteca.Datos
{
    public class ConexionDb
    {
        private SqlConnection _conexion = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Biblioteca;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");

        public SqlConnection AbrirConexion()
        {
            if (_conexion.State == ConnectionState.Closed)
                _conexion.Open();
            return _conexion;
        }

        public SqlConnection CerrarConexion()
        {
            if (_conexion.State == ConnectionState.Open)
                _conexion.Close();
            return _conexion;
        }
    }
}
