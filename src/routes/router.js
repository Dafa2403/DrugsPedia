"use strict";

module.exports = function (app) {
  var jsonku = require("../controller/drugs-controller");

  app.route("/").get(jsonku.index);
  app.route("/drugs").get(jsonku.getDrugs);
  app.route("/drugs/:id_drugs").get(jsonku.getDrugsById);
  app.post("/addDrugs", jsonku.tambahDrugs);
  app.put("/editDrugs", jsonku.ubahDrugs);
  app.delete("/deleteDrugs", jsonku.hapusDrugs);
};
