using Biblioteca.Entidades;
using Biblioteca.Negocio;
using System;

namespace Biblioteca.Presentacion.UI
{
    public class MenuLibro
    {
        public static void CargarMenu()
        {
            Console.Clear();

            string[] opciones = {
                "1. Registrar Libro",
                "2. Mostrar Libros",
                "3. Buscar por ID",
                "4. Actualizar Libro",
                "5. Eliminar Libro",
                "6. Volver"
            };

            Console.WriteLine("MENU LIBROS");
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
            Console.WriteLine("Registrar Libro: \n");
            Console.WriteLine("IdLibro: ");
            string id = Console.ReadLine();
            Console.WriteLine("Titulo: ");
            string titulo = Console.ReadLine();
            Console.WriteLine("SubTitulo: ");
            string subTitulo = Console.ReadLine();
            Console.WriteLine("Editorial: ");
            string editorial = Console.ReadLine();
            Console.WriteLine("Area: ");
            string area = Console.ReadLine();
            Console.WriteLine("Anio de publicacion: ");
            string anio = Console.ReadLine();
            Console.WriteLine("Total paginas: ");
            int totalPaginas = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Edicion: ");
            string edicion = Console.ReadLine();

            Libro libro = new Libro
            {
                IdLibro = id,
                Titulo = titulo,
                Subtitulo = subTitulo,
                Editorial = editorial,
                Area = area,
                AnioPublicacion = anio,
                TotalPaginas = totalPaginas,
                Edicion = edicion
            };

            var bol = new LibroBOL();
            string msg;

            if (bol.Registrar(libro))
                msg = "Registro exitosamente...";
            else
                msg = "Registro fallido...";

            Console.WriteLine("\n" + msg);
            Console.ReadLine();
        }

        public static void ObtenerTodos()
        {
            var bol = new LibroBOL();
            var lista = bol.ObtenerTodos();

            Console.Clear();
            Helper.MostrarLibros(lista);

            Console.ReadLine();
        }
        public static void ObtenerPorId()
        {
            var bol = new LibroBOL();
            string id = Console.ReadLine();
            var libro = bol.ObtenerPorId(id);

            Console.Clear();
            Helper.MostrarLibro(libro);

            Console.ReadLine();
        }

        public static void Actualizar()
        {
            Console.Clear();
            Console.WriteLine("Actualizar Libro: \n");
            Console.WriteLine("IdLibro: ");
            string id = Console.ReadLine();
            Console.WriteLine("Titulo: ");
            string titulo = Console.ReadLine();
            Console.WriteLine("SubTitulo: ");
            string subTitulo = Console.ReadLine();
            Console.WriteLine("Editorial: ");
            string editorial = Console.ReadLine();
            Console.WriteLine("Area: ");
            string area = Console.ReadLine();
            Console.WriteLine("Anio de publicacion: ");
            string anio = Console.ReadLine();
            Console.WriteLine("Total paginas: ");
            int totalPaginas = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Edicion: ");
            string edicion = Console.ReadLine();

            Libro libro = new Libro
            {
                IdLibro = id,
                Titulo = titulo,
                Subtitulo = subTitulo,
                Editorial = editorial,
                Area = area,
                AnioPublicacion = anio,
                TotalPaginas = totalPaginas,
                Edicion = edicion
            };

            var bol = new LibroBOL();
            string msg;

            if (bol.Actualizar(libro))
                msg = "Actualizado exitosamente...";
            else
                msg = "Actualizado fallido...";

            Console.WriteLine("\n" + msg);
            Console.ReadLine();
        }

        public static void Eliminar()
        {
            Console.Clear();
            Console.WriteLine("Eliminar Libro: \n");
            Console.WriteLine("IdLibro: ");
            string id = Console.ReadLine();

            var bol = new LibroBOL();
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
