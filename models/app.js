// Import the ORM to create functions that will interact with the database.
var orm = require("../config/orm.js");

var burger = {
  all: function(cb) {
    orm.all("all_patients", function(res) {
      cb(res);
    });
  },
  
  // The variables cols and vals are arrays.

  createDoc: function(vals, cb) {
    orm.createDoc("new_doctor", vals, function(res) {
      cb(res);
    });
  },



  createPatient: function(cols, vals, cb) {  
    orm.createPatient("new_patient", cols, vals, function(res) {
      cb(res);
    });
  },



  update: function(objColVals, condition, cb) {
    orm.update("patient_vu", objColVals, condition, function(res) {
      cb(res);
    });
  },


  searchPatient: function(vals, cb) {
    console.log("app.js " + vals);  
        orm.searchPatient("find_patient", vals, function(res) {
          cb(res);
        });
      }
};


module.exports = burger;
