using System;

namespace Biblioteca.Presentacion.UI
{
    public static class MenuPrincipal
    {
        public static void CargarMenu()
        {
            Console.Clear();

            string[] opciones = {
                "1. Autores",
                "2. Libros",
                "3. Autorias",
                "4. Salir"
            };

            Console.WriteLine("MENU BIBLIOTECA");
            Helper.mostrarOpciones(opciones);
            Console.WriteLine("Seleccionar una opcion: ");
            int opc = Convert.ToInt32(Console.ReadLine());

            switch (opc)
            {
                case 1:
                    MenuAutor.CargarMenu();
                    break;
                case 2:
                    MenuLibro.CargarMenu();
                    break;
                case 3:
                    MenuAutoria.CargarMenu();
                    break;
                case 4:
                    Environment.Exit(0);
                    break;
                default:
                    break;
            }
        }
    }
}
