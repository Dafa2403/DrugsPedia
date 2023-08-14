"use strict";

module.exports = function (app) {
  var jsonku = require("../controller/users-controller");

  app.route("/").get(jsonku.index);
  app.route("/users").get(jsonku.getUsers);
  app.route("/users/:id_user").get(jsonku.getUserById);
  app.post("/register", jsonku.tambahUsers);
  app.put("/editUser", jsonku.ubahUsers);
  app.delete("/deleteUser", jsonku.hapusUsers);
};
