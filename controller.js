"use strict";

var response = require("./response");
var connection = require("./connection");

exports.index = function (req, res) {
  response.ok("Hello from the Node JS RESTful side!", res);
};

// get data users
exports.getUsers = function (req, res) {
  connection.query("SELECT * FROM users", function (error, rows, fields) {
    if (error) {
      console.log(error);
    } else {
      response.ok(rows, res);
    }
  });
};

// get data users berdasarkan id
exports.getUserById = function (req, res) {
  connection.query(
    "SELECT * FROM users WHERE id = ?",
    [req.params.id],
    function (error, rows, fields) {
      if (error) {
        console.log(error);
      } else {
        response.ok(rows, res);
      }
    }
  );
};

// tambah data users
exports.tambahUsers = function (req, res) {
  var name = req.body.name;
  var username = req.body.username;
  var email = req.body.email;
  var password = req.body.password;

  connection.query(
    "INSERT INTO users (name,username,email,password) VALUES(?,?,?,?)",
    [name, username, email, password],
    function (error, rows, fields) {
      if (error) {
        console.log(error);
      } else {
        response.ok("Berhasil Menambahkan Data!", res);
      }
    }
  );
};
