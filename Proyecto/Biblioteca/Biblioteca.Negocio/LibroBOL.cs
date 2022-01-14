using Biblioteca.Datos.DAO;
using Biblioteca.Entidades;
using System.Collections.Generic;

namespace Biblioteca.Negocio
{
    public class LibroBOL
    {
        private readonly LibroDAO _dataObj = new LibroDAO();
        public bool Registrar(Libro libro)
        {
            return _dataObj.Registrar(libro) == 1;
        }

        public List<Libro> ObtenerTodos()
        {
            return _dataObj.ObtenerTodos();
        }

        public Libro ObtenerPorId(string idLibro)
        {
            return _dataObj.ObtenerPorId(idLibro);
        }

        public bool Actualizar(Libro libro)
        {
            return _dataObj.Actualizar(libro) == 1;
        }

        public bool Eliminar(string idLibro)
        {
            return _dataObj.Eliminar(idLibro) == 1;
        }
    }
}
