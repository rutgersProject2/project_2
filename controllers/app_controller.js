var express = require("express");

var router = express.Router();
var path = require("path");

// Import the model (burger.js) to use its database functions.
var burger = require("../models/app.js");

// Create all our routes and set up logic within those routes where required.
router.get("/", function(req, res) {

  burger.all(function(data) {
    var hbsObject = {
      burgers: data
    };
    //console.log(hbsObject);
    res.sendFile(path.join(__dirname, "../public/home.html"));
  });
});

router.post("/api/doctors", function(req, res) {


    var fname = req.body.First_Name;
    var Last_Name = req.body.Last_Name;
    var Practice_Number = req.body.Practice_Number;
    var Specialty = req.body.Specialty;
    var Email = req.body.Email;
    var Phone = req.body.Phone;
    var Street_Address = req.body.Street_Address;
    var Apartment_Num = req.body.Apartment_Num;
    var City = req.body.City;
    var State = req.body.State;
    var Zip_Code = req.body.Zip_Code;

    burger.createDoc([
      
      req.body.First_Name,
      req.body.Last_Name,
      req.body.Practice_Number,
      req.body.Specialty,
      req.body.Email,
      req.body.Phone,
      req.body.Street_Address,
      req.body.Apartment_Num,
      req.body.City,
      req.body.State,
      req.body.Zip_Code


    ], function(result) {

      // Send back the ID 
      var test = {
        'First_Name': fname,
        'Last_Name': Last_Name,
        'Practice_Number': Practice_Number,
        'Specialty': Specialty,
        'Email': Email,
        'Phone': Phone,
        'Street_Address': Street_Address, 
        'Apartment_Num': Apartment_Num,
        'City': City,
        'State': State, 
        'Zip_Code': Zip_Code
      
      }
      res.json(test);
      
    });
  
  });


  router.post("/api/patient", function(req, res) {
    
    
        var fname = req.body.First_Name;
        var Last_Name = req.body.Last_Name;
        var DOB = req.body.DOB;
        var doctorsID = req.body.doctorsID;
        var Street_Address = req.body.Street_Address;
        var Apartment_Num = req.body.Apartment_Num;
        var City = req.body.City;
        var State = req.body.State;
        var Zip_Code = req.body.Zip_Code;
    
        burger.createPatient([
          
          req.body.First_Name,
          req.body.Last_Name,
          req.body.DOB,
          req.body.doctorsID,
          req.body.Street_Address,
          req.body.Apartment_Num,
          req.body.City,
          req.body.State,
          req.body.Zip_Code
    
    
        ], function(result) {
    
          // Send back the ID 
          var test = {
            'First_Name': fname,
            'Last_Name': Last_Name,
            'DOB': DOB,
            'doctorsID': doctorsID,
            'Street_Address': Street_Address, 
            'Apartment_Num': Apartment_Num,
            'City': City,
            'State': State, 
            'Zip_Code': Zip_Code
          
          }
          res.json(test);
          
        });
      
      });




  router.put("/api/patient/:id", function(req, res) {
    var condition = "id = " + req.params.id;

    console.log("condition", condition);
  
    burger.update({
      devoured: req.body.devoured
    }, condition, function(result) {
      if (result.changedRows == 0) {
        // If no rows were changed, then the ID must not exist, so 404
        return res.status(404).end();
      } else {
        res.status(200).end();
      }
    });
  });


  router.delete("/api/burgers/:id", function(req, res) {
    var condition = "id = " + req.params.id;
  
    burger.delete(condition, function(result) {
      if (result.affectedRows == 0) {

        // If no rows were changed, then the ID must not exist, so 404

        return res.status(404).end();
      } else {
        res.status(200).end();
      }
    });
  });
  
// Export routes for server.js to use.
module.exports = router;
