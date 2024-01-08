const bodyParser = require("body-parser");
const express = require("express");
const app = express();
const morgan = require("morgan");
const cors = require("cors")
const multer  = require('multer')
const path = require("path")


app.use(cors())

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(morgan("dev"));
var routes = require("./src/routes/router");
routes(app, multer, path);

app.use("/auth", require("./src/middleware/index"));

app.use('/upload/drugs', express.static(path.join(__dirname, 'upload/img/drugs')))
app.use('/upload/profile', express.static(path.join(__dirname, 'upload/img/profile')))

app.listen(8080, () => console.log("Server started on port 8080"));
