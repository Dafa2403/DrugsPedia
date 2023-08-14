const bodyParser = require("body-parser");
const express = require("express");
const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

var routes = require("./src/routes/router");
routes(app);

app.listen(8080, () => console.log("Server started on port 8080"));
