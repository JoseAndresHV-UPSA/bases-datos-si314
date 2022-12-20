using Biblioteca.Entidades;
using Biblioteca.Negocio;
using System;

namespace Biblioteca.Presentacion.UI
{
    public class MenuAutor
    {
        public static void CargarMenu()
        {
            Console.Clear();

            string[] opciones = {
                "1. Registrar Autor",
                "2. Mostrar Autores",
                "3. Buscar por ID",
                "4. Actualizar Autor",
                "5. Eliminar Autor",
                "6. Volver"
            };

            Console.WriteLine("MENU AUTORES");
            Helper.mostrarOpciones(opciones);
            Console.WriteLine("Seleccionar una opcion: ");
            int opc = Convert.ToInt32(Console.ReadLine());

            switch (opc)
            {
                case 1:
                    Registrar();
                    break;
                case 2:
                    ObtenerTodos();
                    break;
                case 3:
                    ObtenerPorId();
                    break;
                case 4:
                    Actualizar();
                    break;
                case 5:
                    Eliminar();
                    break;
                case 6:
                    MenuPrincipal.CargarMenu();
                    break;
                default:
                    CargarMenu();
                    break;
            }
        }

        public static void Registrar()
        {
            Console.Clear();
            Console.WriteLine("Registrar Autor: \n");
            Console.WriteLine("IdAutor: ");
            string id = Console.ReadLine();
            Console.WriteLine("Nombre: ");
            string nombre = Console.ReadLine();
            Console.WriteLine("Nacionalidad: ");
            string nacionalidad = Console.ReadLine();

            Autor autor = new Autor
            {
                IdAutor = id,
                Nombre = nombre,
                Nacionalidad = nacionalidad
            };

            var bol = new AutorBOL();
            string msg;

            if (bol.Registrar(autor))
                msg = "Registro exitosamente...";
            else
                msg = "Registro fallido...";

            Console.WriteLine("\n" + msg);
            Console.ReadLine();
        }

        public static void ObtenerTodos()
        {
            var bol = new AutorBOL();
            var lista = bol.ObtenerTodos();

            Console.Clear();
            Helper.MostrarAutores(lista);

            Console.ReadLine();
        }
        public static void ObtenerPorId()
        {
            var bol = new AutorBOL();
            string id = Console.ReadLine();
            var autor = bol.ObtenerPorId(id);

            Console.Clear();
            Helper.MostrarAutor(autor);

            Console.ReadLine();
        }

        public static void Actualizar()
        {
            Console.Clear();
            Console.WriteLine("Actualizar Autor: \n");
            Console.WriteLine("IdAutor: ");
            string id = Console.ReadLine();
            Console.WriteLine("Nombre: ");
            string nombre = Console.ReadLine();
            Console.WriteLine("Nacionalidad: ");
            string nacionalidad = Console.ReadLine();

            Autor autor = new Autor
            {
                IdAutor = id,
                Nombre = nombre,
                Nacionalidad = nacionalidad
            };

            var bol = new AutorBOL();
            string msg;

            if (bol.Actualizar(autor))
                msg = "Actualizado exitosamente...";
            else
                msg = "Actualizado fallido...";

            Console.WriteLine("\n" + msg);
            Console.ReadLine();
        }

        public static void Eliminar()
        {
            Console.Clear();
            Console.WriteLine("Eliminar Autor: \n");
            Console.WriteLine("IdAutor: ");
            string id = Console.ReadLine();

            var bol = new AutorBOL();
            string msg;

            if (bol.Eliminar(id))
                msg = "Eliminado exitosamente...";
            else
                msg = "Eliminado fallido...";

            Console.WriteLine("\n" + msg);
            Console.ReadLine();
        }
    }
}
