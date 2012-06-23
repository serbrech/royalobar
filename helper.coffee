nconf = require 'nconf'

module.exports = (app) ->

  app.helpers
    facebook_app_id: nconf.get 'facebook'
    nconf: nconf