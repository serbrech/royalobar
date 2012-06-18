express = require 'express'
stylus = require 'stylus'
assets = require 'connect-assets'
connect = require 'connect'

app = express.createServer()
app.configure ->
    app.use assets()
    app.use '/fonts', connect.static('./public/fonts')
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
            .set('paths', [__dirname, __dirname + '/public/fonts'])
            .set('filename', path)
            .use nib()
    })


app.get '/', (req, resp) -> 
  resp.render 'index'

app.listen process.env.VMC_APP_PORT or 3000, -> console.log 'Listening...'