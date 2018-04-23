var express = require("express");
var router = express.Router();
var mongoose = require("mongoose");
var Goods = require("../models/goods");

mongoose.connect("mongodb://root:666666@127.0.0.1:27017/dumall");

mongoose.connection.on("connected", () => {
  console.log("MongoDB is connected.");
});

router.get("/", (req, res, next) => {
  res.send("helllo, goods list.");
});

module.exports = router;
