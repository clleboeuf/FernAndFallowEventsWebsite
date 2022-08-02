using FernAndFallowWebsite.Models;
using FernAndFallowWebsite.Utils;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace FernAndFallowWebsite.Views
{
    public class SendEmailViewModelsController : Controller
    {
        private Model1 db = new Model1();
        EmailSender email = new EmailSender();

        // GET: SendEmailViewModels
        public ActionResult Index()
        {
            return View(db.SendEmailViewModels.ToList());
        }

        // GET: SendEmailViewModels/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SendEmailViewModel sendEmailViewModel = db.SendEmailViewModels.Find(id);
            if (sendEmailViewModel == null)
            {
                return HttpNotFound();
            }
            return View(sendEmailViewModel);
        }

        // GET: SendEmailViewModels/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: SendEmailViewModels/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,EmailTo,Subject,Contents")] SendEmailViewModel sendEmailViewModel)
        {
            if (ModelState.IsValid)
            {
                db.SendEmailViewModels.Add(sendEmailViewModel);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(sendEmailViewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async void SendIt()
        {
            await email.SendEmailExecute();
        }

        // GET: SendEmailViewModels/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SendEmailViewModel sendEmailViewModel = db.SendEmailViewModels.Find(id);
            if (sendEmailViewModel == null)
            {
                return HttpNotFound();
            }
            return View(sendEmailViewModel);
        }

        // POST: SendEmailViewModels/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,EmailTo,Subject,Contents")] SendEmailViewModel sendEmailViewModel)
        {
            if (ModelState.IsValid)
            {
                db.Entry(sendEmailViewModel).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(sendEmailViewModel);
        }

        // GET: SendEmailViewModels/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SendEmailViewModel sendEmailViewModel = db.SendEmailViewModels.Find(id);
            if (sendEmailViewModel == null)
            {
                return HttpNotFound();
            }
            return View(sendEmailViewModel);
        }

        // POST: SendEmailViewModels/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            SendEmailViewModel sendEmailViewModel = db.SendEmailViewModels.Find(id);
            db.SendEmailViewModels.Remove(sendEmailViewModel);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
