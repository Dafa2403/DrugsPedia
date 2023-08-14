const express = require("express");
var auth = require("./auth");
const verification = require("./verification");
const router = express.Router();

router.post("/api/register", auth.register);
router.post("/api/login", auth.login);

router.get("/api/secret", verification(), auth.Testing);

module.exports = router;
