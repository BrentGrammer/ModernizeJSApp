import { afunction } from "./firstscript";
// This comment should not appear in the build files.
console.log("Do we have someGlobal? ", someGlobal.run());
console.log("hello from thirdscript.js");

console.log(afunction('I come from thirdscript.js'));

