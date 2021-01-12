const express = require('express'),
  app = express(),
  cors = require('cors'),
  bodyParser = require('body-parser'),
  loginRoutes = require('./routes/loginRoutes'),
  testRoutes = require('./routes/testRoutes');
  require('dotenv').config();

// make server object that contain port property and the value for our server.
var server = {
  port: process.env.PORT
};

// use the modules
app.use(cors())
app.use(bodyParser.json());

app.use('/api', loginRoutes);
app.use('/api/test', testRoutes);

// starting the server
app.listen( server.port , () => console.log(`Server started, listening port: ${server.port}`));
