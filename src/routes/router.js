"use strict";

module.exports = function (app, multer, path) {
  var jsonku = require("../controller/drugs-controller");
  var verification = require("../middleware/verification");

  const storage = multer.diskStorage({
    destination: 'upload/img/drugs',
    filename: (req, file, cb) => {
      return cb(null, Date.now() + '-' + file.originalname)
    }
  })

  const upload = multer({
    storage: storage
  })

  app.route("/").get(jsonku.index);
  app.route("/drugs").get(jsonku.getDrugs);
  app.route("/drugs/:id_drugs").get(jsonku.getDrugsById);
  app.post("/addDrugs", upload.single('image'), jsonku.tambahDrugs);
  app.put("/editDrugs", verification(), jsonku.ubahDrugs);
  app.delete("/deleteDrugs", verification(), jsonku.hapusDrugs);
};
