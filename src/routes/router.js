"use strict";

module.exports = function (app) {
  var jsonku = require("../controller/drugs-controller");
  var verification = require("../middleware/verification");

  app.route("/").get(jsonku.index);
  app.route("/drugs").get(jsonku.getDrugs);
  app.route("/drugs/:id_drugs").get(jsonku.getDrugsById);
  app.post("/addDrugs", jsonku.tambahDrugs);
  app.put("/editDrugs", verification(), jsonku.ubahDrugs);
  app.delete("/deleteDrugs", verification(), jsonku.hapusDrugs);
};
