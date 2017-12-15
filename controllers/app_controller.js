import { read } from "fs";

var express = require("express");

var router = express.Router();
var path = require("path");

// Import the model (app.js) to use its database functions.
var model = require("../models/app.js");

// Create all our routes and set up logic within those routes where required.
router.get("/", function (req, res) {

  res.sendFile(path.join(__dirname, "../public/home.html"));
});

router.get("/provider", function (req, res) {
  res.sendFile(path.join(__dirname, "../public/doctor.html"))
});

router.get("/user", function (req, res) {
  res.sendFile(path.join(__dirname, "../public/patient_login.html"))
});

router.get("/doc_patient_view", function (req, res) {
  res.sendFile(path.join(__dirname, "../public/doc_patient_view.html"))
});

router.get("/provider/:id", function (req, res) {
  model.findDoc([
    req.params.id,
  ], function (data) {
    console.log(data);

    res.render("index", { docProfile: data })
  })

});

router.post("/api/doctors", function (req, res) {

  model.createDoc([
    req.body.docFirstName,
    req.body.docLastName,
    req.body.docPractice,
    req.body.docSpecialty,
    req.body.docEmail,
    req.body.docPhone,
    req.body.Street_Address,
    req.body.Apartment_Num,
    req.body.City,
    req.body.State,
    req.body.Zip_Code

  ],
    function (result) {

      docId = result[0][0].doctorsID;
      res.json({ id: docId });

    });

});


router.post("/api/patient", function (req, res) {

  model.createPatient([

    req.body.First_Name,
    req.body.Last_Name,
    req.body.DOB,
    req.body.doctorsID,
    req.body.Street_Address,
    req.body.Apartment_Num,
    req.body.City,
    req.body.State,
    req.body.Zip_Code


  ], function (result) {

    // Send back the ID 
    // var test = {
    //   'First_Name': fname,
    //   'Last_Name': Last_Name,
    //   'DOB': DOB,
    //   'doctorsID': doctorsID,
    //   'Street_Address': Street_Address,
    //   'Apartment_Num': Apartment_Num,
    //   'City': City,
    //   'State': State,
    //   'Zip_Code': Zip_Code

    // }

    console.log(result)

  });

});




router.put("/api/patient/:id", function (req, res) {
  var condition = "id = " + req.params.id;

  console.log("condition", condition);

  model.update({
    First_Name: req.body.First_Name,
    Last_Name: req.body.Last_Name,
    DOB: req.body.DOB,
    Street_Address: req.body.Street_Address,
    Apartment_Num: req.body.Apartment_Num,
    City: req.body.City,
    State: req.body.State,
    Zip_Code: req.body.Zip_Code,
    diagDate: req.body.Diagnosis_Date,
    hepatitis: req.body.hepatitis,
    hsv1: req.body.hsv1,
    hsv2: req.body.hsv2,
    hiv: req.body.hiv,
    aids: req.body.aids,
    hltv: req.body.hltv,
    hpv: req.body.hpv,
    molluscum_contag: req.body.molluscum_contag,
    zika: req.body.zika,
    chlamydia: req.body.chlamydia,
    gonorrhea: req.body.gonorrhea,
    syphilis: req.body.syphilis,
    trich: req.body.trich,
    crabs: req.body.crabs,
    scabies: req.body.scabies,
    bv_yeast: req.body.bv_yeast,
    chancroid: req.body.chancroid,
    donovanosis: req.body.donovanosis,
    genital_warts: req.body.genital_warts,
    pid: req.body.pid,
    ngu: req.body.ngu,
    inetst_parasites: req.body.inetst_parasites,
    mycoplasma: req.body.mycoplasma,
    lgv: req.body.lgv
  }, condition, function (result) {
    if (result.changedRows == 0) {
      // If no rows were changed, then the ID must not exist, so 404
      return res.status(404).end();
    } else {
      res.status(200).end();
    }
  });
});




router.get('/api/:last_name/:id', function (req, res) {


  var condition = ["'" + req.params.last_name + "'", "'" + req.params.id + "'"];




  //= [req.params.last_name, req.params.id];



  console.log("Controller: " + condition);

  model.searchPatient(condition, function (data) {
    var hbsObject = {
      burgers: data
    };
    console.log(hbsObject);

    res.render("index", hbsObject);

  });
});


// Export routes for server.js to use.
module.exports = router;
