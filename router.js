"use strict";

module.exports = function (app) {
  var jsonku = require("./controller");

  app.route("/").get(jsonku.index);
  app.route("/users").get(jsonku.getUsers);
  app.route("/users/:id").get(jsonku.getUserById);
  app.post("/register", jsonku.tambahUsers);
};
