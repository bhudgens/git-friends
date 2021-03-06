Capture all the repositories for a user.

    request = require 'request'

    module.exports = (options, callback) ->
      args =
        url: "https://api.github.com/users/#{options['<user>']}/repos?per_page=500"
        headers:
          'User-Agent': 'git-friends cli'
      if options.username and options.password
        args.input =
          user: options.username
          pass: options.password
          sendImmediately: false
      request args, (err, response, body) ->
        options.repositories = JSON.parse(body)
        callback undefined, options
