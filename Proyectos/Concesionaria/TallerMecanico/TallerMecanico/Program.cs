using Microsoft.Data.SqlClient;
using static System.Console;
using static System.Data.CommandType;
using static System.Data.SqlDbType;


WriteLine("Interactuando con la BD desde la consola");
string connString = "Data Source=JOSO;Initial Catalog=Taller;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
SqlConnection conn = new SqlConnection(connString);

try
{
    WriteLine("Abrimos la conexion ...");
    conn.Open();
    WriteLine("Conexion exitosa");
}
catch (Exception e)
{
    WriteLine("Error: " + e.Message);
    Environment.Exit(0);
}
SqlCommand comando = new();
SqlDataReader ejecutor;
int result;
int opc = -1;
while (opc != 0)
{
    Clear();
    WriteLine("1. Registro Cliente");
    WriteLine("2. Registro Auto");
    WriteLine("3. Registrar Servicio");
    WriteLine("4. Anotar Hoja de partes");
    WriteLine("5. Crear Factura");
    WriteLine("0. Salir");
    Write("Opcion: ");
    opc = int.Parse(ReadLine());

    comando.Dispose();
    switch (opc)
    {
        case 1:
            comando.Connection = conn;
            comando.CommandText = "RegistroCliente";
            comando.CommandType = StoredProcedure;
            Write("CI: ");
            comando.Parameters.AddWithValue("@CI", ReadLine());
            Write("Nombre: ");
            comando.Parameters.AddWithValue("@Nombre", ReadLine());
            Write("Apellidos: ");
            comando.Parameters.AddWithValue("@Apellidos", ReadLine());
            Write("Direccion: ");
            comando.Parameters.AddWithValue("@Direccion", ReadLine());
            Write("Telefono: ");
            comando.Parameters.AddWithValue("@Telefono", ReadLine());
            result = comando.ExecuteNonQuery();
            comando.Parameters.Clear();
            comando.Dispose();
            if (result <= 0)
            {
                WriteLine("Error al registrar");
            }
            else
            {
                WriteLine("Registrado correctamente");
            }
            ReadKey();
            Clear();
            comando = new SqlCommand("select * from Clientes", conn);
            ejecutor = comando.ExecuteReader();
            WriteLine("---CLIENTES---");
            WriteLine("CI | Nombre | Apellidos");
            while (ejecutor.Read())
            {
                WriteLine(ejecutor["CI"] + " | " + ejecutor["Nombre"] + " | " + ejecutor["Apellidos"]);
            }
            ejecutor.Close();
            ReadKey();
            break;
        case 2:
            comando.Connection = conn;
            comando.CommandText = "RegistroAuto";
            comando.CommandType = StoredProcedure;
            Write("Matricula: ");
            comando.Parameters.AddWithValue("@Matricula", ReadLine());
            Write("CI: ");
            comando.Parameters.AddWithValue("@CI", ReadLine());
            Write("Modelo: ");
            comando.Parameters.AddWithValue("@Modelo", ReadLine());
            Write("Color: ");
            comando.Parameters.AddWithValue("@Color", ReadLine());
            result = comando.ExecuteNonQuery();
            comando.Parameters.Clear();
            comando.Dispose();
            if (result <= 0)
            {
                WriteLine("Error al registrar");
            }
            else
            {
                WriteLine("Registrado correctamente");
            }
            ReadKey();
            Clear();
            comando = new SqlCommand("select * from Automoviles", conn);
            ejecutor = comando.ExecuteReader();
            WriteLine("---AUTOMOVILES---");
            WriteLine("Matricula | Modelo | Color | CI");
            while (ejecutor.Read())
            {
                WriteLine(ejecutor["Matricula"] + " | " + ejecutor["Modelo"] + " | " + ejecutor["Color"] + " | " + ejecutor["CI"]);
            }
            ejecutor.Close();
            ReadKey();
            break;
        case 3:
            comando.Connection = conn;
            comando.CommandText = "RegistroServicio";
            comando.CommandType = StoredProcedure;
            Write("IdServicio: ");
            comando.Parameters.AddWithValue("@IdServicio", ReadLine());
            Write("IdMecanico: ");
            comando.Parameters.AddWithValue("@IdMecanico", ReadLine());
            Write("Matricula: ");
            comando.Parameters.AddWithValue("@Matricula", ReadLine());
            result = comando.ExecuteNonQuery();
            comando.Parameters.Clear();
            comando.Dispose();
            if (result <= 0)
            {
                WriteLine("Error al registrar");
            }
            else
            {
                WriteLine("Registrado correctamente");
            }
            ReadKey();
            Clear();
            comando = new SqlCommand("select * from Servicios", conn);
            ejecutor = comando.ExecuteReader();
            WriteLine("---SERVICIOS---");
            WriteLine("IdServicio | Matricula | IdMecanico");
            while (ejecutor.Read())
            {
                WriteLine(ejecutor["IdServicio"] + " | " + ejecutor["Matricula"] + " | " + ejecutor["IdMecanico"]);
            }
            ejecutor.Close();
            ReadKey();
            break;
        case 4:
            comando.Connection = conn;
            comando.CommandText = "AnotarHojaDePartes";
            comando.CommandType = StoredProcedure;
            Write("IdServicio: ");
            comando.Parameters.AddWithValue("@IdServicio", ReadLine());
            Write("IdMecanico: ");
            comando.Parameters.AddWithValue("@IdMecanico", ReadLine());
            Write("Insumo: ");
            comando.Parameters.AddWithValue("@Material", ReadLine());
            Write("Cantidad: ");
            comando.Parameters.AddWithValue("@Cantidad", ReadLine());
            Write("PrecioUnitario: ");
            comando.Parameters.AddWithValue("@PrecioUnitario", ReadLine());
            Write("ManoDeObra: ");
            comando.Parameters.AddWithValue("@PrecioManoDeObra", ReadLine());
            
            result = comando.ExecuteNonQuery();
            comando.Parameters.Clear();
            comando.Dispose();
            if (result <= 0)
            {
                WriteLine("Error al registrar");
            }
            else
            {
                WriteLine("Registrado correctamente");
            }
            ReadKey();
            Clear();
            WriteLine("---HOJA DE PARTES---");
            WriteLine("IdServicio | Material | Cantidad | PrecioUnitario | PrecioManoDeObra | IdMecanico");
            comando = new SqlCommand("select * from HojaDePartes", conn);
            ejecutor = comando.ExecuteReader();
            while (ejecutor.Read())
            {
                WriteLine(ejecutor["IdServicio"] + " | " + ejecutor["Material"] + " | " + ejecutor["Cantidad"] + " | " + ejecutor["PrecioUnitario"] + " | " + ejecutor["PrecioManoDeObra"] + " | " + ejecutor["IdMecanico"]);
            }
            ejecutor.Close();
            ReadKey();
            break;
        case 5:
            comando.Connection = conn;
            comando.CommandText = "CrearFactura";
            comando.CommandType = StoredProcedure;
            Write("IdServicio: ");
            string IdServicio = ReadLine();
            comando.Parameters.AddWithValue("@IdServicio", IdServicio);

            result = comando.ExecuteNonQuery();
            comando.Parameters.Clear();
            comando.Dispose();
            if (result <= 0)
            {
                WriteLine("Error al registrar");
            }
            else
            {
                WriteLine("Registrado correctamente");
            }
            ReadKey();
            Clear();
            comando = new SqlCommand($"select * from Facturas where IdServicio = '{IdServicio}'", conn);
            ejecutor = comando.ExecuteReader();
            WriteLine("---FACTURA---");
            while (ejecutor.Read())
            {
                WriteLine($"FechaEmision: {ejecutor["FechaEmision"]}");
                WriteLine($"CI Cliente: {ejecutor["CI"]}");
                WriteLine($"Subtotal: {ejecutor["Subtotal"]}");
                WriteLine($"IVA: {ejecutor["IVA"]}");
                WriteLine($"TOTAL: {ejecutor["TotalAPagar"]}");
            }
            ejecutor.Close();
            comando = new SqlCommand($"select * from FacturaDetalles where IdFactura = '{IdServicio}'", conn);
            ejecutor = comando.ExecuteReader();
            WriteLine("---DETALLE---");
            WriteLine("Cantidad | Detalle | PrecioUnitario | Total");
            while (ejecutor.Read())
            {
                WriteLine(ejecutor["Cantidad"] + " | " + ejecutor["Detalle"] + " | " + ejecutor["PrecioUnitario"] + " | " + ejecutor["Total"]);
            }
            ejecutor.Close();
            ReadKey();
            break;
        default:
            break;
    }
}

