"use strict";

var response = require("../config/response");
var connection = require("../connection/connection");

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
    "SELECT * FROM users WHERE id_user = ?",
    [req.params.id_user],
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

// ubah data users berdasarkan id
exports.ubahUsers = function (req, res) {
  var id_user = req.body.id_user;
  var name = req.body.name;
  var username = req.body.username;
  var email = req.body.email;
  var password = req.body.password;
  var role = req.body.role;

  connection.query(
    "UPDATE users SET name=?, username=?, email=?, password=?, role=? WHERE id_user=?",
    [name, username, email, password, role, id_user],
    function (error, rows, fields) {
      if (error) {
        console.log(error);
      } else {
        response.ok("Berhasil Ubah Data!", res);
      }
    }
  );
};

// hapus data users berdasarkan id
exports.hapusUsers = function (req, res) {
  var id_user = req.body.id_user;

  connection.query(
    "DELETE FROM users WHERE id_user=?",
    [id_user],
    function (error, rows, fields) {
      if (error) {
        console.log(error);
      } else {
        response.ok("Berhasil Hapus Data!", res);
      }
    }
  );
};
