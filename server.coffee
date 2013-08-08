var http = require('http');
http.createServer(function(req,res) {
  res.writeHead(200, {'Content-Type': 'text/html'});
  res.end('Hello from Windows Azure running node version: ' + process.version + '</br>');
}).listen(process.env.PORT || 3000);


# express = require 'express'
# stylus = require 'stylus'
# assets = require 'connect-assets'
# connect = require 'connect'
# nconf = require 'nconf'
# helper = require './helper'

# nconf.env().argv()
# nconf.file { file: 'config.json' }

# console.log nconf.get 'facebook'


# app = express.createServer()
# app.configure ->
#     app.use assets()
#     app.use connect.static('./public')
#     app.use connect.favicon('./public/images/favicon.ico')
#     app.use connect.logger('dev')
#     app.set 'view engine', 'jade'
#     app.set 'view options', { layout: false }
#     app.use stylus.middleware({
#         src: __dirname + "/assets/css",
#         compress: true,
#         compile: (str, path) ->
#             console.log 'compile!'
#             return stylus(str)
#             .define('url', stylus.url())
#             .set('paths', [__dirname])
#             .set('filename', path)
#             .use nib()
#     })

# helper(app)

# app.get '/', (req, resp) -> 
#   resp.render 'index'

# app.listen process.env.VMC_APP_PORT or 3000, -> console.log 'Listening...'