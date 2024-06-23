console.log("Hello from firstscript.js");

var someGlobal = {}; // This is a global variable used by other scripts listed underneath it in script tags in the original app.

$.when($.ready).then(function () {
  console.log("JQuery recognized in firstscript.js. Document is ready.");
});

// appManager is a global set in a script tag in mainTemplate.cfm
appManager.updateDisplay = function() {
  console.log('I am updating the display - app manager.');
}
