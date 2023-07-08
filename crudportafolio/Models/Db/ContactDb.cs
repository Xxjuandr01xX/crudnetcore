using crudportafolio.Models.Db;
using crudportafolio.Models;
using System.Data;
using System.Data.SqlClient;


namespace crudportafolio.Models.Db
{
    public class ContactDb
    {
        public List<ContactModel> ContactFields() {
            var _contacts = new List<ContactModel>();
            var _db = new Database();
            using (var con = _db.Conectarse()) {
                con.Open();
                SqlCommand cmd = new SqlCommand("contact_listar", con);
                cmd.CommandType = CommandType.StoredProcedure;
                using (var dr = cmd.ExecuteReader()) {
                    while (dr.Read()) {
                        _contacts.Add(new ContactModel() {
                            Id = Convert.ToInt32(dr["id"]),
                            NomApe = dr["nomApe"].ToString(),
                            Correo = dr["correo"].ToString(),
                            Telefono = dr["telefono"].ToString()
                        });
                    }
                }
            }
            return _contacts;
        }

        public Boolean save(ContactModel octs) {
            Boolean rp;
            var _con = new Database();
            try {
                using (var connection = _con.Conectarse()) {
                    connection.Open();
                    var cmd = new SqlCommand("contact_guardar @nomape, @correo, @telefono", connection);
                    cmd.Parameters.AddWithValue("@nomape", octs.NomApe);
                    cmd.Parameters.AddWithValue("@correo", octs.Correo);
                    cmd.Parameters.AddWithValue("@telefono", octs.Telefono);
                    cmd.ExecuteNonQuery();
                    rp = true;
                }
            } catch (Exception e) {
                rp = false;
                Console.WriteLine(e.Message);
            }
            return rp;
        }

        public Boolean DeleteContact(ContactModel ocm){
            Boolean resp;
            try{
                using (var conexion = new Database().Conectarse())
                {
                    conexion.Open();
                    var cmd = new SqlCommand("contact_eliminar @id", conexion);
                    cmd.Parameters.AddWithValue("@id", ocm.Id);
                    cmd.ExecuteNonQuery();
                    resp = true;
                }
            }catch(Exception e){
                resp = false;
                Console.WriteLine(e.Message);
            }
            return resp;
        }

        public Boolean UpdateContact(ContactModel ocm){
            Boolean resp;
            try{
                using (var conexion = new Database().Conectarse()){
                    conexion.Open();
                    var cmd = new SqlCommand("contact_editar @nomApe,@correo,@telefono,@id", conexion);
                    cmd.Parameters.AddWithValue("@nomApe", ocm.NomApe);
                    cmd.Parameters.AddWithValue("@correo", ocm.Correo);
                    cmd.Parameters.AddWithValue("@telefono", ocm.Telefono);
                    cmd.Parameters.AddWithValue("@id", ocm.Id);
                    cmd.ExecuteNonQuery();
                    resp = true;
                }
            }catch (Exception e) {
                resp = false;
                Console.WriteLine(e.Message);
            }
            return resp;
        }

        public ContactModel GetWhere(int id)
        {
            var _olc = new ContactModel();
            var _db  = new Database();
            using (var connect = _db.Conectarse())
            {
                connect.Open();
                var cmd = new SqlCommand("contact_obtener", connect);
                cmd.Parameters.AddWithValue("id", id);
                cmd.CommandType = CommandType.StoredProcedure;
                using (var dr = cmd.ExecuteReader()) {
                    while (dr.Read())
                    {
                        _olc.Id = Convert.ToInt32(dr["Id"]);
                        _olc.NomApe = dr["NomApe"].ToString();
                        _olc.Correo = dr["Correo"].ToString();
                        _olc.Telefono = dr["Telefono"].ToString();
                    }
                }
            }
            return _olc;
        }
    }
}
