
DEBUG = false

emailIsValid = (email) ->
  email.match(/.+@(.+){2,}\.(.+){2,}/)


Template.bugMeForm.onCreated ->
  @emailError = new ReactiveVar(false)


Template.bugMeForm.onRendered ->
  console.log("History", BugMe.history) if DEBUG
  @$('select').formSelect()


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


  emailError: ->
    Template.instance().emailError.get()

    
  emailOk: ->
    not Template.instance().emailError.get() and $('#email')?.val?()?.trim?().length > 0


  

Template.bugMeForm.events
  'keyup #email': (e, tmpl) ->
    tmpl.emailError.set(not emailIsValid(tmpl.$('#email').val()))