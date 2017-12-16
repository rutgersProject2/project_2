// Import the ORM to create functions that will interact with the database.
var orm = require("../config/orm.js");

var model = {
  all: function (cb) {
    orm.all("new_procedure", function (res) {
      cb(res);
    });
  },
  findDoc: function (docID, cb) {
    orm.findDoc("doctors", docID, function (res) {
      cb(res);
    });
  },
  findPatient: function (patientID, cb) {
    orm.findPatient("patient_vu", patientID, function (res) {
      cb(res);
    });
  },
  createDoc: function (vals, cb) {
    orm.createDoc("new_doctor", vals, function (res) {
      cb(res);
    });
  },

  createPatient: function (cols, vals, cb) {
    orm.createPatient("new_patient", cols, vals, function (res) {
      cb(res);
    });
  },

  update: function (objColVals, condition, cb) {
    orm.update("patient_tab", objColVals, condition, function (res) {
      cb(res);
    });
  },

  searchPatient: function (vals, cb) {
    orm.searchPatient("find_patient", vals, function (res) {
      cb(res);
    });
  }
};


module.exports = model;
