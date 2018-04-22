let user = require("./User");

// console.log(`I am ${user.userName}, I say ${user.sayHello()}`);

console.log(`I am ${user.userName}, I say ${user.sayWorld()}`);

let http = require("http");
let url = require("url");
let util = require("util");

let server = http.createServer((req, res) => {
  res.statusCode = 200;

  res.setHeader("Content-Type", "text-plain; charset=utf-8");

  console.log(req.url);
  res.end(req.url);

  res.end(util.inspect(url.parse(req.url)));
});

server.listen(3000, "127.0.0.1", () => {
  console.log("服务器已启动，请在浏览器输入 127.0.0.1:3000 进行浏览！");
});
