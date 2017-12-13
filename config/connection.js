//MySQL connection.
var mysql = require("mysql");

// JAWSdb
if (process.env.JAWSDB_URL) {
  connection = mysql.createConnection(process.env.JAWSDB_URL)
} else {
// Local connection
  var connection = mysql.createConnection({
    port: 3306,
    host: "localhost",
    //enter user
    user: "root",
    //enter password
    password: "",
    //create database
    database: "dbo"
  });
}

//Connection
connection.connect(function (err) {
  if (err) {
    console.error("error connecting: " + err.stack);
    return;
  }
  console.log("connected as id " + connection.threadId);
});

//Export connection for the ORM to use
module.exports = connection;