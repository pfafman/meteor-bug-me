Package.describe({
  name: "pfafman:bug-me",
  summary: "Package that enables users to report bugs with browser data included",
  version: "0.0.8",
  git: "https://github.com/pfafman/meteor-bug-me.git"
});

Package.on_use(function(api, where) {
  api.versionsFrom("METEOR@1.0.4");

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
    'softwarerero:accounts-t9n@1.1.3',
    'awatson1978:browser-detection@1.0.3',
    'pfafman:materialize-modal@0.3.6',
    'iron:router@1.0.9'
  ], ["client", "server"]);

  api.add_files([
    'lib/client/bugMe.css',
    'lib/client/bugMeLink.html',
    'lib/client/bugMeLink.coffee',
    'lib/client/bugMeForm.html',
    'lib/client/bugMeForm.coffee'
  ], 'client');

  api.add_files([
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


Package.on_test(function(api) {
  api.use("pfafman:materialize-modal", 'client');
});
