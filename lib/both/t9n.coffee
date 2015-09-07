
DEBUG = false

console.log("Modal T9n", T9n) if DEBUG

en =
  'Report Issue': 'Report Issue'
  'Title': 'Title'
  'Details': 'Details'
  "Enviroment": "Enviroment"
  'Mobile App': 'Mobile App'
  'Version': 'Version'
  'Browser': 'Browser'
  "Login Required": "Login Required"
  "Email Required": "Email Required"
  "Email Invalid": "Email Invalid"
  "Name Required": "Name Required"
  "No Issue?": "No Issue?"
  "No Issue Updates?": "No Issue Updates?"
  'Type': 'Type'
  'bug': 'bug'
  'enhancement': 'enhancement'
  'comment': 'comment'
  'Issues': 'Issues'
  'Do not change unless the report is from a different system':'Do not change unless the report is from a different system'
  "OS": "Operating System"
  'Add details of problem and steps to reproduce it.': 'Add details of problem and steps to reproduce it.'

T9n?.map?("en", en)


sk =
  'Report Issue': 'Potrebujete poradiť?'
  "Details": "Popíšte ho"
  "Title": "Pomenujte problém"
  "Title Required": "Pomenujte problém Povinné"
  "Enviroment": "Životné prostredie"
  "Mobile App": "Mobilná App"
  "Version": "Verzia"
  "Browser": "Prehliadač"
  "Type": "Druh"
  "Login Required": "Prihlásenie Povinné"
  "Email Required": "Email Povinné"
  "Email Invalid": "Email Neplatná"
  "Name Required": "Meno Povinné"
  "No Issue Updates?": "No vydanie aktualizácie?"
  "No Issue?": "Žiadny problém?"
  "bug": "ploštice"
  "enhancement": "zvýšenie"
  "comment": "komentár"
  "Issues": "Problémy"
  "Do not change unless the report is from a different system": "Nemeňte, ak je správa z iného systému"
  "OS": "Operačný systém"
  'Add details of problem and steps to reproduce it.': 'Pridajte podrobnosti o probléme a kroky pre reprodukciu ju.'
  
T9n?.map?("sk", sk)