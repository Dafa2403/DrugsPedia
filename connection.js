var mysql = require("mysql");

const conn = mysql.createConnection({
  host: "localhost",
  port: 3306,
  user: "root",
  password: "",
  database: "drugspedia",
});

conn.connect((err) => {
  if (err) throw err;
  console.log("MySQL Connected");
});

module.exports = conn;
