
DEBUG = false


#@T9n = require('meteor-accounts-t9n').T9n
#import { T9n } from 'meteor-accounts-t9n'

console.log("Bug Me T9n", T9n) if DEBUG

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
  "Title": "Názov problém"
  "Title Required": "Názov je povinný"
  "Enviroment": "Rozhranie"
  "Mobile App": "Mobilná App"
  "Version": "Verzia"
  "Browser": "Prehliadač"
  "Type": "Typ"
  "Login Required": "Prihlásenie je povinné"
  "Email Required": "Email je povinný"
  "Email Invalid": "Email je neplatný"
  "Name Required": "Meno je povinné"
  "No Issue Updates?": "Žiadne aktualizácie?"
  "No Issue?": "Žiadny problém?"
  "bug": "chyba"
  "enhancement": "vylepšenie"
  "comment": "komentár"
  "Issues": "Problémy"
  "Do not change unless the report is from a different system": "Zmeňte, ak správa pochádza z iného operačného systému"
  "OS": "Operačný systém"
  'Add details of problem and steps to reproduce it.': 'Pridajte podrobný popis problému.'

T9n?.map?("sk", sk)


hu =
  'Report Issue': 'Hiba jelentése'
  "Details": "részletezze"
  "Title": "Cím"
  "Title Required": "Cím szükséges"
  "Enviroment": "Környezet"
  "Mobile App": "Mobil alkalmazás"
  "Version": "Verzió"
  "Browser": "Böngésző"
  "Type": "Típus"
  "Login Required": "Bejelentkezés szükséges"
  "Email Required": "E-mail cím szükséges"
  "Email Invalid": "Helytelen e-mail cím"
  "Name Required": "Név szükséges"
  "No Issue Updates?": "Nincs frissítés?"
  "No Issue?": "Nincs gond?"
  "bug": "hiba"
  "enhancement": "javaslat"
  "comment": "hozzászólás"
  "Issues": "Hibák"
  "Do not change unless the report is from a different system": "Változtassa meg, ha a jelentés más operációs rendszerről szól"
  "OS": "Operációs rendszer"
  'Add details of problem and steps to reproduce it.': 'Részletes leírása a hibának.'

T9n?.map?("hu", hu)


de =
  'Report Issue': 'Rückkopplung'
  "Details": "Details"
  "Title": "Titel"
  "Title Required": "Titel ist erforderlich"
  "Enviroment": "Umgebung"
  "Mobile App": "Mobile App"
  "Version": "Version"
  "Browser": "Webbrowser"
  "Type": "Typ"
  "Login Required": "Anmeldung erforderlich"
  "Email Required": "Email ist erforderlich"
  "Email Invalid": "Email ist ungültig"
  "Name Required": "Name ist erforderlich"
  "No Issue Updates?": "Keine Updates?"
  "No Issue?": "Kein Fehler?"
  "bug": "Fehler"
  "enhancement": "Vorschlag"
  "comment": "Kommentar"
  "Issues": "Fehler"
  "Do not change unless the report is from a different system": "Ändern Sie nur wenn es sich um ein anderes Betriebssystem handelt"
  "OS": "Betriebssystem"
  'Add details of problem and steps to reproduce it.': 'Beschreiben sie den Fehler und sein Auftreten.'

T9n?.map?("de", de)


