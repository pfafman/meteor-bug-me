
DEBUG = false

console.log("Modal T9n", T9n) if DEBUG

en =
  'Title': 'Title'
  'Details': 'Details'
  "Enviroment": "Enviroment"
  'Mobile App': 'Mobile App'
  'Version': 'Version'
  'Browser': 'Browser'
  "Login Required": "Login Required"
  "No Issue?": "No Issue?"
  "No Issue Updates?": "No Issue Updates?"
  'Type': 'Type'
  'bug': 'bug'
  'enhancement': 'enhancement'
  'comment': 'comment'
  'Do not change unless the report is from a different system':'Do not change unless the report is from a different system'

  
T9n?.map?("en", en)