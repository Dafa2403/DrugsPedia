var connection = require("../connection/connection");
var mysql = require("mysql");
var md5 = require("md5");
var response = require("../config/response");
var jwt = require("jsonwebtoken");
var config = require("../config/secret");
var ip = require("ip");

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
        id_user = rows[0].id_user;

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
            });
          }
        });
      } else {
        res.json({ Error: true, Message: "Email atau password salah!" });
      }
    }
  });
};
