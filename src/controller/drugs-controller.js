"use strict";

var response = require("../config/response");
var connection = require("../connection/connection");

exports.index = function (req, res) {
  response.ok("Hello World!", res);
};

// get data drugs
exports.getDrugs = function (req, res) {
  connection.query("SELECT * FROM drugs", function (error, rows, fields) {
    if (error) {
      console.log(error);
    } else {
      response.ok(rows, res);
    }
  });
};

// get data drugs berdasarkan id
exports.getDrugsById = function (req, res) {
  connection.query(
    "SELECT * FROM drugs WHERE id_drugs = ?",
    [req.params.id_drugs],
    function (error, rows, fields) {
      if (error) {
        console.log(error);
      } else {
        response.ok(rows, res);
      }
    }
  );
};

// tambah data drugs
exports.tambahDrugs = function (req, res) {
  var id_user = req.body.id_user;
  var drugs_name = req.body.drugs_name;
  var subTitle = req.body.subTitle;
  var deskripsi = req.body.deskripsi;
  var image = req.file.filename;

  connection.query(
    "INSERT INTO drugs (id_user,drugs_name,subTitle,deskripsi,image) VALUES(?,?,?,?,?)",
    [id_user, drugs_name, subTitle, deskripsi, image],
    function (error, rows, fields) {
      if (error) {
        console.log(error);
      } else {
        response.ok("Berhasil Menambahkan Data obat!", res);
      }
    }
  );
};

// ubah data drugs berdasarkan id
exports.ubahDrugs = function (req, res) {
  var id_drugs = req.body.id_drugs;
  var drugs_name = req.body.drugs_name;
  var subTitle = req.body.subTitle;
  var deskripsi = req.body.deskripsi;
  var image = req.body.image;

  connection.query(
    "UPDATE drugs SET drugs_name=?, subTitle=?, deskripsi=?, image=? WHERE id_drugs=?",
    [drugs_name, subTitle, deskripsi, image, id_drugs],
    function (error, rows, fields) {
      if (error) {
        console.log(error);
      } else {
        response.ok("Berhasil Ubah Data obat!", res);
      }
    }
  );
};

// hapus data drugs berdasarkan id
exports.hapusDrugs = function (req, res) {
  var id_drugs = req.body.id_drugs;

  connection.query(
    "DELETE FROM drugs WHERE id_drugs=?",
    [id_drugs],
    function (error, rows, fields) {
      if (error) {
        console.log(error);
      } else {
        response.ok("Berhasil Hapus Data obat!", res);
      }
    }
  );
};
