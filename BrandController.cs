using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mall_Management.Models;

namespace Mall_Management.Controllers
{
    public class BrandController : Controller
    {
        // GET: Brand
        public ActionResult Index()
        {
            Brandmodel db= new Brandmodel();
            ViewBag.listBrand = db.get("select * from Brands");
            return View();
        }
        public ActionResult AmThuc()
        {
            Brandmodel db = new Brandmodel();
            ViewBag.listAmThuc = db.get("exec TIMKIEMBRANDSTHEOCATEID '1'");
            return View();
        }
        public ActionResult ThoiTrang()
        {
            Brandmodel db = new Brandmodel();
            ViewBag.listThoiTrang = db.get("exec TIMKIEMBRANDSTHEOCATEID '2'");
            return View();
        }
        public ActionResult HoctapVaGiaiTri()
        {
            Brandmodel db = new Brandmodel();
            ViewBag.listHocTap = db.get("exec TIMKIEMBRANDSTHEOCATEID '3'");
            return View();
        }
        public ActionResult TangB()
        {
            Brandmodel db = new Brandmodel();
            ViewBag.listTangB = db.get("exec TIMBRANDSTHEOFLOOR 'B'");
            return View();
        }
        public ActionResult Tang1()
        {
            Brandmodel db = new Brandmodel();
            ViewBag.listTang1 = db.get("exec TIMBRANDSTHEOFLOOR '1'");
            return View();
        }
        public ActionResult Tang2()
        {
            Brandmodel db = new Brandmodel();
            ViewBag.listTang2 = db.get("exec TIMBRANDSTHEOFLOOR '2'");
            return View();
        }
        public ActionResult Tang3()
        {
            Brandmodel db = new Brandmodel();
            ViewBag.listTang3 = db.get("exec TIMBRANDSTHEOFLOOR '3'");
            return View();
        }
        public ActionResult Tang4()
        {
            Brandmodel db = new Brandmodel();
            ViewBag.listTang4 = db.get("exec TIMBRANDSTHEOFLOOR '4'");
            return View();
        }
        public ActionResult Tang5()
        {
            Brandmodel db = new Brandmodel();
            ViewBag.listTang5 = db.get("exec TIMBRANDSTHEOFLOOR '5'");
            return View();
        }
        public ActionResult Tang6()
        {
            Brandmodel db = new Brandmodel();
            ViewBag.listTang6 = db.get("exec TIMBRANDSTHEOFLOOR '6'");
            return View();
        }
    }
}