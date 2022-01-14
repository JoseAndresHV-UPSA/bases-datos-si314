using Biblioteca.Entidades;
using Biblioteca.Negocio;
using System;

namespace Biblioteca.Presentacion.UI
{
    class MenuAutoria
    {
        public static void CargarMenu()
        {
            Console.Clear();

            string[] opciones = {
                "1. Registrar Autoria",
                "2. Mostrar Autorias",
                "3. Eliminar Autoria",
                "4. Volver"
            };

            Console.WriteLine("MENU AUTORIAS");
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
                    Eliminar();
                    break;
                case 4:
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
            Console.WriteLine("Registrar Autoria: \n");
            Console.WriteLine("IdAutor: ");
            string idAutor = Console.ReadLine();
            Console.WriteLine("IdLibro: ");
            string idLibro = Console.ReadLine();

            Autor autor = new Autor()
            {
                IdAutor = idAutor
            };

            Libro libro = new Libro()
            {
                IdLibro = idLibro
            };

            Autoria autoria = new Autoria
            {
                Autor = autor,
                Libro = libro
            };

            var bol = new AutoriaBOL();
            string msg;

            if (bol.Registrar(autoria))
                msg = "Registro exitosamente...";
            else
                msg = "Registro fallido...";

            Console.WriteLine("\n" + msg);
            Console.ReadLine();
        }

        public static void ObtenerTodos()
        {
            var bol = new AutoriaBOL();
            var lista = bol.ObtenerTodos();

            Console.Clear();
            Helper.MostrarAutorias(lista);

            Console.ReadLine();
        }
        
        public static void Eliminar()
        {
            Console.Clear();
            Console.WriteLine("Eliminar Autoria: \n");
            Console.WriteLine("IdAutor: ");
            string idAutor = Console.ReadLine();
            Console.WriteLine("IdLibro: ");
            string idLibro = Console.ReadLine();

            Autor autor = new Autor()
            {
                IdAutor = idAutor
            };

            Libro libro = new Libro()
            {
                IdLibro = idLibro
            };

            Autoria autoria = new Autoria
            {
                Autor = autor,
                Libro = libro
            };

            var bol = new AutoriaBOL();
            string msg;

            if (bol.Eliminar(autoria))
                msg = "Eliminado exitosamente...";
            else
                msg = "Eliminado fallido...";

            Console.WriteLine("\n" + msg);
            Console.ReadLine();
        }
    }
}
