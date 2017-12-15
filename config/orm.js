var connection = require("../config/connection.js");

function printQuestionMarks(num) {

  var arr = [];

  for (var i = 0; i < num; i++) {
    arr.push("?");
  }

  return arr.toString();
}


// Helper function to convert object key/value pairs to SQL syntax
function objToSql(ob) {
  var arr = [];

  // loop through the keys and push the key/value as a string int arr
  for (var key in ob) {
    var value = ob[key];
    // check to skip hidden properties
    if (Object.hasOwnProperty.call(ob, key)) {
      // if string with spaces, add quotations (Lana Del Grey => 'Lana Del Grey')
      if (typeof value === "string" && value.indexOf(" ") >= 0) {
        value = "'" + value + "'";
      }
      // e.g. {name: 'Lana Del Grey'} => ["name='Lana Del Grey'"]
      // e.g. {sleepy: true} => ["sleepy=true"]
      arr.push(key + "=" + value);
    }
  }

  // translate array of strings to a single comma-separated string
  return arr.toString();
}



var orm = {

  all: function (stored_proc, cb) {
    var queryString = "call " + stored_proc + ";";
    connection.query(queryString, function (err, result) {
      if (err) {
        throw err;
      }
      cb(result);

    });
  },

  findDoc: function (tableName, docID, cb) {
    var queryString = "SELECT * FROM " + tableName + " WHERE doctorsID = " + docID + ";"
    console.log(queryString);
    connection.query(queryString, function (err, result) {
      if (err) {
        throw err;
      }
      cb(result);
    })
  },

  createDoc: function (stored_proc, vals, cb) {
    var queryString = "call " + stored_proc;

    queryString += " (";
    queryString += printQuestionMarks(vals.length);
    queryString += ") ";


    connection.query(queryString, vals, function (err, result) {
      if (err) {
        throw err;
      }

      cb(result);

    });
  },

  createPatient: function (stored_proc, vals, cb) {
    var queryString = "call " + stored_proc;

    queryString += " (";
    queryString += printQuestionMarks(vals.length);
    queryString += ") ";

    console.log(queryString);

    connection.query(queryString, vals, function (err, result) {
      if (err) {
        throw err;
      }

      cb(result);
    });
  },

  update: function (view, objColVals, condition, cb) {
    var queryString = "UPDATE " + view;

    queryString += " SET ";
    queryString += objToSql(objColVals);
    queryString += " WHERE ";
    queryString += condition;

    console.log(queryString);

    connection.query(queryString, function (err, result) {

      if (err) {

        throw err;

      }

      cb(result);
    });
  },

  searchPatient: function (stored_proc, vals, cb) {

    console.log("ORM.js " + vals);


    var queryString = "call " + stored_proc;

    queryString += " (";
    queryString += vals;
    queryString += ") ";

    console.log(queryString);

    connection.query(queryString, vals, function (err, result) {
      if (err) {
        throw err;
      }
      console.log(vals);
      cb(result);

    });
  }
};

module.exports = orm;
