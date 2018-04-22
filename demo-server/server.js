let http = require("http");
let url = require("url");
let util = require("util");
let fs  = require("fs");

let server = http.createServer((req, res) => {
  // res.statusCode = 200;
  // res.setHeader("Content-Type", "text-plain; charset=utf-8");

  var pathname = url.parse(req.url).pathname;
  fs.readFile(pathname.substring(1), (err, data) => {
    if(err) {
      res.writeHeader(404, {
        "Content-Type": "text-html"
      });
    }else {
      res.writeHeader(200, {
        "Content-Type": "text-html",
      });
      res.write(data.toString());
    }
    res.end();
  })
});

server.listen(3000, "localhost", () => {
  console.log("请在浏览器中输入localhost:3000进行访问！");
});
