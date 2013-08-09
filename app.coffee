express = require 'express'
stylus = require 'stylus'
assets = require 'connect-assets'
connect = require 'connect'
nconf = require 'nconf'
helper = require './helper'

nconf.env().argv()
nconf.file { file: './config.dev.json' }

console.log nconf.get 'facebook'

exports.app = app = express.createServer()
app.configure ->
    app.use assets()
    app.use connect.static('./public')
    app.use connect.favicon('./public/images/favicon.ico')
    app.use connect.logger('dev')
    app.set 'view engine', 'jade'
    app.set 'view options', { layout: false }
    app.use stylus.middleware({
        src: __dirname + "/assets/css",
        compress: true,
        compile: (str, path) ->
            console.log 'compile!'
            return stylus(str)
            .define('url', stylus.url())
            .set('paths', [__dirname])
            .set('filename', path)
            .use nib()
    })

helper(app)

app.get '/', (req, resp) -> 
  resp.render 'index'