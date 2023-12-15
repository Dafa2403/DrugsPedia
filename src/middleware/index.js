const express = require("express");
var auth = require("./auth");
const verification = require("./verification");
const router = express.Router();

router.post("/api/register", auth.register);
router.post("/api/login", auth.login);
router.get("/api/users", verification(), auth.getUsers);
router.get("/api/secret", verification(), auth.Testing);
router.put("/api/editUser", verification(), auth.ubahUsers)
router.delete("/api/deleteUser", verification(), auth.hapusUsers)
router.delete("/api/logout", verification(), auth.deleteToken)

module.exports = router;
