const express = require("express");
var auth = require("./auth");
const verification = require("./verification");
const router = express.Router();
const multer = require("multer")

const storage = multer.diskStorage({
    destination: 'upload/img/profile',
    filename: (req, file, cb) => {
      return cb(null, Date.now() + '-' + file.originalname)
    }
  })

  const upload = multer({
    storage: storage
  })

router.post("/api/register",upload.single("imgProfile"), auth.register);
router.post("/api/login", auth.login);
router.get("/api/users", verification(), auth.getUsers);
router.get("/api/secret", verification(), auth.Testing);
router.put("/api/editUser", verification(), auth.ubahUsers)
router.delete("/api/deleteUser", verification(), auth.hapusUsers)
router.delete("/api/logout", verification(), auth.deleteToken)

module.exports = router;
