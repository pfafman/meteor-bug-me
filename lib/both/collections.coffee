
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
    user = Meteor.user()
    throw new Meteor.Error('noLogin', "Login Required") unless user
    throw new Meteor.Error('badData', "No Issue?") unless issue

    check(issue, Object)

    issue.username = user.username
    issue.date = new Date()

    MyIssues.insert(issue)


  updateIssue: (issueId, updates) ->
    user = Meteor.user()
    throw new Meteor.Error('noLogin', "Login Required") unless user
    throw new Meteor.Error('noLogin', "No Issue?") unless issueId
    throw new Meteor.Error('badData', "No Issue Updates?") unless updates

    check(updates, Object)
    check(issueId, String)

    issue.updater = user.username
    issue.updated = new Date()

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

