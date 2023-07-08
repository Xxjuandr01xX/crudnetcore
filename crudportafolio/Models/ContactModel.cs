using crudportafolio.Models;
using System.ComponentModel.DataAnnotations;

namespace crudportafolio.Models
{
    public class ContactModel
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "Debe llenar el nombre de la persona conrrectamente !!")]
        public String NomApe { get; set; }
        [Required(ErrorMessage = "Debe llenar el correo de la persona conrrectamente !!")]
        public String Correo { get; set; }
        [Required(ErrorMessage = "Debe llenar el telefono de la persona conrrectamente !!")]
        public String Telefono { get; set; }
    }
}
