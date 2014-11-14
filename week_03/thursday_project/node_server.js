var http = require('http');
var fs   = require('fs');

http.createServer(function (req, res) {
  console.log("URL", req.url);

  if (req.url === "/") {
    var resource = 'index.html';
    res.writeHead(200, {'Content-Type': 'text/html'});
  } else {
    var resource = req.url.replace("/", "")
  }
  if (fs.existsSync(resource)) {
    res.end(fs.readFileSync(resource));
  } else {
    res.end()
  }

}).listen(4567);

console.log('Server running at http://localhost:4567/');
