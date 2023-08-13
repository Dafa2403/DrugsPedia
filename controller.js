"use strict";

var response = require("./response");
var connection = require("./connection");

exports.index = function (req, res) {
  response.ok("Hello from the Node JS RESTful side!", res);
};
