const jsonServer = require('json-server');
const auth = require('json-server-auth');

const server = jsonServer.create();
const router = jsonServer.router('db.json');
const middlewares = jsonServer.defaults();

server.use(middlewares);
server.use(auth);
server.use(router);
const PORT = 3000;
const HOST = '192.168.1.15';

server.listen(PORT, HOST, () => {
  console.log('JSON Server is running in ${HOST}:${PORT ${PORT}')}
);