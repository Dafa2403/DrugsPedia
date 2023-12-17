var connection = require("../connection/connection");
var mysql = require("mysql");
var md5 = require("md5");
var response = require("../config/response");
var jwt = require("jsonwebtoken");
var config = require("../config/secret");
var ip = require("ip");

// signup
exports.register = function (req, res) {
  var post = {
    name: req.body.name,
    username: req.body.username,
    email: req.body.email,
    password: md5(req.body.password),
    role: req.body.role,
  };

  var query = "SELECT email FROM ?? WHERE ??=?";
  var table = ["users", "email", post.email];

  query = mysql.format(query, table);

  connection.query(query, function (err, rows) {
    if (err) {
      console.log(err);
    } else {
      if (rows.length == 0) {
        var query = "INSERT INTO ?? SET ?";
        var table = ["users"];
        query = mysql.format(query, table);
        connection.query(query, post, function (err, rows) {
          if (err) {
            console.log(err);
          } else {
            response.ok("Berhasil Menambahkan Data User Baru", res);
          }
        });
      } else {
        response.ok("email sudah terdaftar!", res);
      }
    }
  });
};

// login
exports.login = function (req, res) {
  var post = {
    password: req.body.password,
    username: req.body.username,
  };

  var query = "SELECT * FROM ?? WHERE ??=? AND ??=?";
  var table = [
    "users",
    "password",
    md5(post.password),
    "username",
    post.username,
  ];

  query = mysql.format(query, table);
  connection.query(query, function (error, rows) {
    if (error) {
      console.log(error);
    } else {
      if (rows.length == 1) {
        var token = jwt.sign({ rows }, config.secret, {
          expiresIn: 3600,
        });
        console.log(rows[0].name);
        id_user = rows[0].id_user;
        names = rows[0].name;
        username = rows[0].username;
        email = rows[0].email;

        var data = {
          id_user: id_user,
          access_token: token,
          ip_address: ip.address(),
        };

        var query = "INSERT INTO ?? SET ?";
        var table = ["users_token"];

        query = mysql.format(query, table);
        connection.query(query, data, function (error, rows) {
          if (error) {
            console.log(error);
          } else {
            res.json({
              success: true,
              message: "Token JWT generated!",
              token: token,
              currUser: data.id_user,
              name: names,
              username: username,
              email: email,
            });
          }
        });
      } else {
        res.json({ Error: true, Message: "Email atau password salah!" });
      }
    }
  });
};

// lihat data user
exports.getUsers = function (req, res) {
  var query = "SELECT * FROM ??";
  var table = ["users"];

  query = mysql.format(query, table);
  connection.query(query, function (error, rows) {
    if (error) {
      console.log(error);
    } else {
      response.ok(rows, res);
    }
  });
};

exports.Testing = function (req, res) {
  response.ok("Testing", res);
};

// ??? edit data users
exports.ubahUsers = function (req, res) {
  var username = req.body.username;
  var name = req.body.name;
  var email = req.body.email;
  var pswd = req.body.password;

  connection.query(
    "UPDATE users SET name=?, email=?, password=? WHERE username=?",
    [name, email, pswd, username],
    function (error, rows, fields) {
      if (error) {
        console.log(error);
      } else {
        response.ok("Berhasil Ubah Data user!", res);
      }
    }
  );
};

exports.hapusUsers = function (req, res) {
  var id_user = req.body.id_user;

  connection.query(
    "DELETE FROM users WHERE id_user=?",
    [id_user],
    function (error, rows, fields) {
      if (error) {
        console.log(error);
      } else {
        response.ok("Berhasil Hapus user!", res);
      }
    }
  );
};

exports.deleteToken = function (req, res) {
  console.log("🚀 ~ file: auth.js:165 ~ exports.deleteToken ~ req:", req)
  var id_user = req.body.id_user
  var token = req.body.token

  var query = "DELETE FROM users_token WHERE id_user=?";

  query = mysql.format(query, [id_user]);
  connection.query(query, function (error, rows) {
    if (error) {
      console.log(error);
    } else {
      response.ok("User Logout", res) 
    }
  });
};