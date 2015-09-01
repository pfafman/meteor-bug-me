
DEBUG = true

Template.bugMeForm.onCreated ->
  # ...


Template.bugMeForm.onRendered ->
  console.log("History", BugMe.history)
  @$('select').material_select();


Template.bugMeForm.onDestroyed ->
  # ...


Template.bugMeForm.helpers

  browser: ->
    BrowserDetect.browser
    

  version: ->
    BrowserDetect.version


  os: ->
    BrowserDetect.OS

  
  mobile: ->
    Meteor.isCordova


  

Template.bugMeForm.events
  'click': (event, tmpl) ->
    # ...