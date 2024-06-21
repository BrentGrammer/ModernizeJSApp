console.log("Hello from firstscript.js");
someGlobal.run = function () {
  return "hello from someGlobal.run in second script.";
};
console.log("running someGlobal.run from thirdscript...");
console.log(someGlobal.run());