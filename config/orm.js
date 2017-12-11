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


   //Calling the stored procedure and pass it from the app.js file.  
  all: function(stored_proc, cb) {
    var queryString = "call " + stored_proc + ";";
    connection.query(queryString, function(err, result) {
      if (err) {
        throw err;
      }
      cb(result);
      
    });
  },
  

  //Creating a new doctor profile. (This must be identical to the database number of columns defined at the stored procdure called new_doc)
  createDoc: function(stored_proc, vals, cb) {
    var queryString = "call " + stored_proc;

    queryString += " (";
    queryString += printQuestionMarks(vals.length);
    queryString += ") ";

    console.log(queryString);

    connection.query(queryString, vals, function(err, result) {
      if (err) {
        throw err;
      }

      cb(result);
    });
  },


  //Creating a new patient profile. (This must be identical to the database number of columns defined at the stored procdure called new_patient)
  createPatient: function(stored_proc, vals, cb) {
    var queryString = "call " + stored_proc;

    queryString += " (";
    queryString += printQuestionMarks(vals.length);
    queryString += ") ";

    console.log(queryString);

    connection.query(queryString, vals, function(err, result) {
      if (err) {
        throw err;
      }

      cb(result);
    });
  },


update: function(table, objColVals, condition, cb) {
var queryString = "UPDATE " + table;

queryString += " SET ";
queryString += objToSql(objColVals);
queryString += " WHERE ";
queryString += condition;

console.log(queryString);

connection.query(queryString, function(err, result) {

  if (err) {

    throw err;

  }

      cb(result);
    });
  },
  

  delete: function(table, condition, cb) {
    var queryString = "DELETE FROM " + table;
    queryString += " WHERE ";
    queryString += condition;

    connection.query(queryString, function(err, result) {
      if (err) {
        throw err;
      }

      cb(result);
    });
  }


};

module.exports = orm;
