const bodyParser = require("body-parser");
const express = require("express");
const app = express();
const morgan = require("morgan");

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(morgan("dev"));
var routes = require("./src/routes/router");
routes(app);

app.use("/auth", require("./src/middleware/index"));

app.listen(8080, () => console.log("Server started on port 8080"));
