var express = require("express");
var router = express.Router();
var mongoose = require("mongoose");
var Goods = require("../models/goods");

mongoose.connect("mongodb://root:666666@127.0.0.1:27017/dumall");

mongoose.connection.on("connected", () => {
  console.log("MongoDB is connected.");
});

mongoose.connection.on("error", () => {
  console.log("MongoDB is error.")
});

mongoose.connection.on("disconnected", () => {
  console.log("MongoDB is disconnected.");
});

router.get("/", (req, res, next) => {
  // res.send("helllo, goods list.");
  Goods.find({}, (err, doc) => {
    if(err) {
      res.json({
        status: '1',
        msg: err.message
      });
    }else {
      res.json({
        status: '0',
        msg: '',
        result: {
          count: doc.length,
          list: doc
        }
      });
    }
  });
});

module.exports = router;
