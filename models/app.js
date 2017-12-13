// Import the ORM to create functions that will interact with the database.
var orm = require("../config/orm.js");

var burger = {
  all: function (cb) {

    orm.all("all_patients", function (res) {

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
  }

};

// Export the database functions for the controller (burgers_controller.js).
module.exports = burger;
