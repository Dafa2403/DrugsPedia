const express = require("express");
var auth = require("./auth");
const router = express.Router();

router.post("/api/register", auth.register);
router.post("/api/login", auth.login);

module.exports = router;
