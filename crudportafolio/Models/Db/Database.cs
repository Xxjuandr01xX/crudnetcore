using System.Data.SqlClient;
using System.Data;

/**
 * En en esta clase se define la conexion a la base de datos
 * y se devuelve el objeto de conexion ya inicializado.
 */

namespace crudportafolio.Models.Db
{
    public class Database
    {
        public const String _DataSource = "DESKTOP-FD9PPHK\\LOCAL";
        public const String _InitialCatalog = "contact";
        public const String _UserId = "sa";
        public const String _Password = "123456789";

        public  String _ConectionString;
        public String GetParameters()
        {
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            builder.DataSource = _DataSource;
            builder.InitialCatalog = _InitialCatalog;
            builder.UserID = _UserId;
            builder.Password = _Password;
            return this._ConectionString = builder.ConnectionString;
        }
        public SqlConnection Conectarse()
        {
            return new SqlConnection(this.GetParameters());
        }
      
    }
}
