console.log("Hello from firstscript.js");

window.someGlobal = {}; // This is a global variable used by other scripts listed underneath it in script tags in the original app.

export const afunction = function (someArg) {
  return "This is what was passed into firstcripts afunction: " + someArg;
};
