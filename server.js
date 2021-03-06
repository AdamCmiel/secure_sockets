// Generated by CoffeeScript 1.6.3
var app, exports, express, http, io, port, server;

express = require("express");

http = require("http");

io = require("socket.io").listen(server);

app = express();

app.configure(function() {
  app.use(express["static"](__dirname + "/public"));
  app.use(app.router);
  app.set("views", __dirname + "/views");
  return app.set("view engine", "jade");
});

app.use(express.logger());

port = process.env.PORT || 5000;

server = app.listen(port, function() {
  return console.log("Listening on " + port);
});

io = require('socket.io').listen(server);

app.get("/", function(req, res) {
  return res.render('index');
});

io.sockets.on("connection", function(socket) {
  return socket.emit("server:connection", 'Welcome to secure chat!');
});

exports = module.exports = app;
