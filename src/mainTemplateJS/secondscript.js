import * as stuff from './firstscript.js';

console.log({stuff}); // this is an empty object - why can't I import contents from firstscript.js?

stuff.someGlobal.run = function () {
  return "hello from someGlobal.run in second script.";
};
