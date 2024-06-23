console.log("Hello from firstscript.js");

window.someGlobal = {};

console.log("loading jquery?", $);
$.when($.ready).then(function () {
  console.log("JQuery recognized in firstscript.js. Document is ready.");
});

// appManager is a global set in a script tag in mainTemplate.cfm
appManager.updateDisplay = function () {
  console.log("I am updating the display - app manager.");
};
