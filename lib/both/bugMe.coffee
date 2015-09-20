
DEBUG = false

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

  hideLink: ->
    $('.bug-me-link').hide()


  showLink: ->
    $('.bug-me-link').show()


  sendEmail: (issue) ->
    console.log("BugMe: sendEmail?", Meteor.isServer, BugMe.email)
    if Meteor.isServer and BugMe.email and issue
      site = BugMe.site or Meteor.absoluteUrl()
      subject = BugMe.subject or "New Issue on #{site}"
      subject += " #{issue.title}"

      message = """
New Issue on #{site}
_id: '#{issue.id}
Title: #{issue.title}
Name: #{issue.name}
User: #{issue.username}
Email: #{issue.email}
Type: #{issue.type}
Details:
  #{issue.details}

      """

      message += "/n/n"

      keys = ['title', 'email', 'title', 'type', 'details', 'id', 'history', 'siteUrl']
      for key, val of issue
        if key not in keys
          message += " #{key}: #{val}\n"

      message += "\nHisotry:\n" + JSON.stringify(issue.history, null, 2)

      console.log("BugMe: sendEmail #{BugMe.email}: #{subject}") if DEBUG
      Meteor.defer ->
        Email.send
          to: BugMe.email
          from: BugMe.email
          subject: subject
          text: message


if Meteor.isClient
  Router.onRun ->
    console.log("BugMe add history", Iron?.Location?.get(), BugMe?.history) if DEBUG
    BugMe?.history?.push(Iron?.Location?.get())
    BugMe?.showLink()
    @next()


