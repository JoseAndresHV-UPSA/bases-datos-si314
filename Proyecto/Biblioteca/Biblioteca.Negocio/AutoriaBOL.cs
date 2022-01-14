using Biblioteca.Datos.DAO;
using Biblioteca.Entidades;
using System.Collections.Generic;

namespace Biblioteca.Negocio
{
    public class AutoriaBOL
    {
        private readonly AutoriaDAO _dataObj = new AutoriaDAO();
        public bool Registrar(Autoria autoria)
        {
            return _dataObj.Registrar(autoria) == 1;
        }

        public List<Autoria> ObtenerTodos()
        {
            return _dataObj.ObtenerTodos();
        }

        public bool Eliminar(Autoria autoria)
        {
            return _dataObj.Eliminar(autoria) == 1;
        }
    }
}
