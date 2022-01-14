using Biblioteca.Entidades;
using System;
using System.Collections.Generic;

namespace Biblioteca.Presentacion.UI
{
    public static class Helper
    {
        public static void mostrarOpciones(string[] opciones)
        {
            foreach (var item in opciones)
                Console.WriteLine(item);
        }

        public static void MostrarAutores(List<Autor> lista)
        {
            Console.WriteLine(new String('-', 70));
            Console.WriteLine(String.Format("| {0, -10} | {1, -25} | {2, -25} |", "IdAutor", "Nombre", "Nacionalidad"));
            Console.WriteLine(new String('-', 70));
            foreach (var item in lista)
                Console.WriteLine(String.Format("| {0, -10} | {1, -25} | {2, -25} |", item.IdAutor, item.Nombre, item.Nacionalidad));
            Console.WriteLine(new String('-', 70));
        }

        public static void MostrarAutor(Autor autor)
        {
            Console.WriteLine(new String('-', 42));
            Console.WriteLine(String.Format("| {0, -38} |", "Autor"));
            Console.WriteLine(new String('-', 42));
            Console.WriteLine(String.Format("| {0, -15} | {1, -20} |", "IdAutor", autor.IdAutor));
            Console.WriteLine(String.Format("| {0, -15} | {1, -20} |", "Nombre", autor.Nombre));
            Console.WriteLine(String.Format("| {0, -15} | {1, -20} |", "Nacionalidad",  autor.Nacionalidad));
            Console.WriteLine(new String('-', 42));
        }

        public static void MostrarLibros(List<Libro> lista)
        {
            Console.WriteLine(new String('-', 98));
            Console.WriteLine(String.Format("| {0, -10} | {1, -25} | {2, -25} | {3, -25} |", "IdLibro", "Titulo", "Subtitulo", "Area"));
            Console.WriteLine(new String('-', 98));
            foreach (var item in lista)
                Console.WriteLine(String.Format("| {0, -10} | {1, -25} | {2, -25} | {3, -25} |", item.IdLibro, item.Titulo, item.Subtitulo, item.Area));
            Console.WriteLine(new String('-', 98));
        }

        public static void MostrarLibro(Libro libro)
        {
            Console.WriteLine(new String('-', 52));
            Console.WriteLine(String.Format("| {0, -48} |", "Libro"));
            Console.WriteLine(new String('-', 52));
            Console.WriteLine(String.Format("| {0, -15} | {1, -30} |", "IdLibro", libro.IdLibro));
            Console.WriteLine(String.Format("| {0, -15} | {1, -30} |", "Titulo", libro.Titulo));
            Console.WriteLine(String.Format("| {0, -15} | {1, -30} |", "Subtitulo", libro.Subtitulo));
            Console.WriteLine(String.Format("| {0, -15} | {1, -30} |", "Area", libro.Area));
            Console.WriteLine(new String('-', 52));
        }

        public static void MostrarAutorias(List<Autoria> lista)
        {
            Console.WriteLine(new String('-', 83));
            Console.WriteLine(String.Format("| {0, -10} | {1, -25} | {2, -10} | {3, -25} |", "IdAutor", "Nombre", "IdLibro", "Titulo"));
            Console.WriteLine(new String('-', 83));
            foreach (var item in lista)
                Console.WriteLine(String.Format("| {0, -10} | {1, -25} | {2, -10} | {3, -25} |", item.Autor.IdAutor, item.Autor.Nombre, item.Libro.IdLibro, item.Libro.Titulo));
            Console.WriteLine(new String('-', 83));
        }
    }
}
