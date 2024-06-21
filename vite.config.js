import { defineConfig } from "vite";
import { resolve } from "path";

export default defineConfig({
  root: "./src",
  build: {
    outDir: "../wwwroot/js",
    emptyOutDir: true,
    sourcemap: true, // set this to get source files in devtools
    rollupOptions: {
      input: {
        main: resolve(__dirname, "src/thirdscript.js"),
        page2script: resolve(__dirname, "src/page2script.js"),
      },
      output: {
        entryFileNames: "[name].js", // output names of scripts - [hash] will generate the hash, but YOU NEED TO UPDATE MANUALLY in the cfm files to match if using this feature.
        chunkFileNames: "[name].[hash].js", // Add hash for chunk files
        // assetFileNames: "[name]/[name].[ext]", // Add hash for assets // in cfm file:  <!-- Include the bundled JavaScript file with cache busting --> <script type="module" src="dist/template1/main1.[hash].js"></script>
      },
    },
  },
});
