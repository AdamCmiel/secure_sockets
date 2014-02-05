express = require("express")
http = require("http")
io = require("socket.io").listen(server)

app = express()

app.configure ->
  app.use express.static(__dirname + "/public")
  app.use app.router
  app.set "views", __dirname + "/views"
  app.set "view engine", "jade"
  # app.use stylus.middleware(
  #   src: __dirname + "/public/styl"
  #   compile: (str, path) ->
  #     stylus(str).set("filename", path).use nib()
  # )

app.use express.logger()
port = process.env.PORT or 5000
server = app.listen port, ->
  console.log "Listening on " + port

io = require('socket.io').listen(server)


app.get "/", (req, res) ->
  res.render 'index'

io.sockets.on "connection", (socket) ->
  socket.emit "server:connection",
    'Welcome to secure chat!'

  # socket.on "my other event", (data) ->
  #   console.log data


exports = module.exports = app