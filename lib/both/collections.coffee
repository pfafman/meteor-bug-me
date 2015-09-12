
DEBUG = false

@MyIssues = new Mongo.Collection('bugMeIssues')


if Meteor.isServer
  Meteor.startup ->
    # Add indexes

    MyIssues._ensureIndex
      username: 1


    MyIssues._ensureIndex
      date: 1


Meteor.methods

  insertIssue: (issue) ->
    throw new Meteor.Error('badData', T9n.get("No Issue?")) unless issue

    user = Meteor.user()

    if not user
      throw new Meteor.Error('badData', T9n.get("Email Required")) unless issue.email
      throw new Meteor.Error('badData', T9n.get("Name Required")) unless issue.name
      throw new Meteor.Error('badData', T9n.get("Email Invalid")) if not issue.email.match(/.+@(.+){2,}\.(.+){2,}/)
    
    check(issue, Object)

    issue.username = user?.username
    if user?.emails?[0]?.address
      issue.email = user.emails?[0].address
    if user?.profile?.lastname
      issue.name = "#{user.profile.firstname} #{user.profile.lastname}"
    issue.date = new Date()
    issue.updated = new Date()
    issue.status = 'new'
    issue.site = BugMe.site or Meteor.absoluteUrl()
    issue.siteUrl = Meteor.absoluteUrl()

    issue.id = MyIssues.insert(issue)

    if Meteor.isServer and BugMe.email
      console.log("BugMe: Send issue email to #{BugMe.email} Issue:#{issue.id}")
      BugMe.sendEmail(issue)

    


  updateIssue: (issueId, updates) ->
    user = Meteor.user()
    throw new Meteor.Error('noLogin', "Login Required") unless user
    throw new Meteor.Error('noLogin', "No Issue?") unless issueId
    throw new Meteor.Error('badData', "No Issue Updates?") unless updates

    check(updates, Object)
    check(issueId, String)

    updates = _.pick(updates, 'title', 'comments', 'details')

    updates.updater = user.username
    updates.updated = new Date()

    select =
      _id: issueId

    if not BugMe._adminOk(user)
      select.username = user.username

    MyIssues.update select,
      $set: updates


  removeIssue: (issueId) ->
    user = Meteor.user()
    throw new Meteor.Error('noLogin', "Login Required") unless user
    throw new Meteor.Error('noLogin', "No Issue?") unless issueId
    
    check(issueId, String)

    select =
      _id: issueId

    if not BugMe._adminOk(user)
      select.username = user.username

    MyIssues.remove(select)

