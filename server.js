// Include the CoffeeScript interpreter so that .coffee files will work
var coffee = require('coffee-script');

// Include our application file
var royalobar = require('./app.coffee');

// Start the server
royalobar.app.listen(process.env.port || 3000);