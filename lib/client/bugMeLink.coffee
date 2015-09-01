
DEBUG = false

Template.bugMeLink.onCreated ->
  @visible = false


Template.bugMeLink.onRendered ->
  location = @data?.location or BugMe?.location
  console.log("bugMeLink", BugMe, @, location) if DEBUG
  offset = @data?.offset or BugMe.offset

  switch location
    when 'top-left'
      BugMe.top = '15%'
      BugMe.left = offset
    when 'bottom-left'
      BugMe.bottom = '15%'
      BugMe.left = offset
    when 'top-right'
      BugMe.top = '15%'
      BugMe.right = offset
    when 'bottom-right'
      BugMe.bottom = '15%'
      BugMe.right = offset


  for key in ['left', 'right', 'top', 'bottom']
    if BugMe?[key]?
      @$('.bug-me-link').css(key, BugMe[key])

  @$('.bug-me-link').css('display', 'block')



Template.bugMeLink.onDestroyed ->
  # ...


Template.bugMeLink.helpers
  foo: ->
    # ...


Template.bugMeLink.events
  'click #bug-me-link': (event, tmpl) ->
    event.preventDefault()
    event.stopPropagation()
    console.log("show bug me form") if DEBUG
    MaterializeModal.form
      'title': 'Report Issue'
      bodyTemplate: 'bugMeForm'
      fixedFooter: true
      callback: (yesNo, issue) ->
        if yesNo
          console.log("New Issue", issue) if DEBUG
          if not issue.title
            Materialize.toast("Error on creating issue: title is required", 3000, 'toast-error')
          else
            console.log("New Issue", issue) if DEBUG
            issue.history = BugMe.history
            Meteor.call "insertIssue", issue, (error, rtn) ->
              if error
                Materialize.toast("Error on creating issue: #{error.reason}", 3000, 'toast-error')
              else
                Materialize.toast("Issue created and sent to support", 3000, 'toast-success')


  'mouseleave #bug-me-link': (event, tmpl) ->
    console.log("hide bug") if DEBUG
    tmpl.$(".bug-me-link").velocity
      right: @offset or BugMe.offset
      padding: '0em 0.4em'
    ,
      duration: 250
      queue: false
      ease: "easeOutCubic"

    tmpl.visible = false


  'mouseenter #bug-me-link': (event, tmpl) ->
    console.log("show bug") if DEBUG
    tmpl.$(".bug-me-link").velocity
      right: '-0em'
      padding: '0em 3em'
    ,
      duration: 250
      queue: false
      ease: "easeOutCubic"

    tmpl.visible = true


