nconf = require 'nconf'

module.exports = (app) ->
  app.locals.facebook_app_id = nconf.get 'facebook'
  app.locals.nconf = nconf