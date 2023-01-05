Package.describe({
  name: "pfafman:bug-me",
  summary: "Package that enables users to report bugs with browser data included",
  version: "0.1.12",
  git: "https://github.com/pfafman/meteor-bug-me.git"
});

// Npm.depends({
//   'meteor-accounts-t9n' : '2.3.1'
// });

Package.onUse(function(api, where) {
  //api.versionsFrom("METEOR@1.5");

  api.use([
    'templating',
    'ui',
    'jquery',
    'reactive-var'
  ], 'client');

  api.use([
    'coffeescript',
    'underscore',
    'mongo',
    'softwarerero:accounts-t9n@2.1.0_2',
    'pfafman:browser-detection',
    'meteorstuff:materialize-modal',
    'iron:router'
  ], ["client", "server"]);

  api.addFiles([
    'lib/client/bugMe.css',
    'lib/client/bugMeLink.html',
    'lib/client/bugMeLink.coffee',
    'lib/client/bugMeForm.html',
    'lib/client/bugMeForm.coffee'
  ], 'client');

  api.addFiles([
    'lib/both/bugMe.coffee',
    'lib/both/t9n.coffee',
    'lib/both/collections.coffee'
  ], ['client', 'server']);

  // api.add_files([
  //   'lib/server/ensureIndexes.coffee'
  // ], ['server']);


  if (api.export) {
    //api.export('BugMe')
  }

});


Package.onTest(function(api) {
  api.use("meteorstuff:materialize-modal", 'client');
});
