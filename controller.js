"use strict";

var response = require("./response");
var connection = require("./connection");

exports.index = function (req, res) {
  response.ok("Hello from the Node JS RESTful side!", res);
};

exports.getUsers = function (req, res) {
  connection.query("SELECT * FROM users", function (error, rows, fields) {
    if (error) {
      connection.log(error);
    } else {
      response.ok(rows, res);
    }
  });
};
