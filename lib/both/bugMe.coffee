
DEBUG = true

console.log("BugMe Create") if DEBUG

@BugMe =

  history: []

  location: 'lower-left'
  offset: '-5em'
  

  configure: (options) ->
    for key, option of options
      BugMe[key] = option


  _adminOk: (user) ->
    if typeof(BugMe.adminOk) is 'function'
      BugMe.adminOk(user)
    
    else
      user.admin


Router.onRun ->
  console.log("BugMe add history", Iron?.Location?.get(), BugMe?.history) if DEBUG
  BugMe?.history?.push(Iron?.Location?.get())
  @next()