using Biblioteca.Datos.DAO;
using Biblioteca.Entidades;
using System.Collections.Generic;

namespace Biblioteca.Negocio
{
    public class AutorBOL
    {
        private readonly AutorDAO _dataObj = new AutorDAO();
        public bool Registrar(Autor autor)
        {
            return _dataObj.Registrar(autor) == 1;
        }

        public List<Autor> ObtenerTodos()
        {
            return _dataObj.ObtenerTodos();
        }

        public Autor ObtenerPorId(string idAutor)
        {
            return _dataObj.ObtenerPorId(idAutor);
        }

        public bool Actualizar(Autor autor)
        {
            return _dataObj.Actualizar(autor) == 1;
        }

        public bool Eliminar(string idAutor)
        {
            return _dataObj.Eliminar(idAutor) == 1;
        }
    }
}
