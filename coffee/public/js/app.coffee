socket = io.connect("http://localhost:5000")
socket.on "connection", (data) ->
  console.log data
  socket.emit "client:connection",
    my: "data"

