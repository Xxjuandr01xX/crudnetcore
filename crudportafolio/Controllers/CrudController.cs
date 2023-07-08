using crudportafolio.Models.Db;
using crudportafolio.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.DotNet.Scaffolding.Shared.Messaging;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace crudportafolio.Controllers
{
    public class CrudController : Controller
    {
        public ContactDb ocdb = new ContactDb();
        public IActionResult Index()
        {
            var _oLista = ocdb.ContactFields();
            return View(_oLista);
        }

        public IActionResult Insert() {
            return View();
        }
        [HttpPost]
        public IActionResult Insert(ContactModel ocm) {
            if (!ModelState.IsValid)
                return View();
            var resp = ocdb.save(ocm);
            if (resp == true)
                return RedirectToAction("Index", "Crud");
            else
                return View();

        }
        public IActionResult Editar(int id) {
            var data = ocdb.GetWhere(id);
            return View(data);
        }
        [HttpPost]
        public IActionResult Editar(ContactModel ocm) {
            if (!ModelState.IsValid)
                return View();
            Boolean resp = ocdb.UpdateContact(ocm);
            if (resp == true)
                return RedirectToAction("Index");
            else
                return View();
        }
        public IActionResult Eliminar(int id)
        {
            var data = ocdb.GetWhere(id);
            ViewBag.Nombre = data.NomApe;
            return View();
        }
        [HttpPost]
        public IActionResult Eliminar(ContactModel ocm) {
            var resp = ocdb.DeleteContact(ocm);
            if (resp == true)
               return RedirectToAction("Index");
            else
                return View();
        }
    }
}
