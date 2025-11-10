const http = require('http');

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'application/json' });
  res.end(JSON.stringify({ message: 'API is running', status: 'ok' }));
});

server.listen(3000, () => {
  console.log('API server running on port 3000');
});
