// vite.config.js
// update this as needed
import { defineConfig } from "vite";
import path from 'path';

export default defineConfig({
  root: "./src",
  build: {
    outDir: "../wwwroot/js",
    emptyOutDir: true,
    rollupOptions: {
      input: {
        main: path.resolve(__dirname, "src/thirdscript.js"),
        // template2: "src/template2/main2.js",
      },
      output: {
        entryFileNames: "[name].js", // output names of scripts - [hash] will generate the hash, but YOU NEED TO UPDATE MANUALLY in the cfm files to match if using this feature.
        chunkFileNames: "[name].[hash].js", // Add hash for chunk files
        // assetFileNames: "[name]/[name].[ext]", // Add hash for assets // in cfm file:  <!-- Include the bundled JavaScript file with cache busting --> <script type="module" src="dist/template1/main1.[hash].js"></script>
      },
    },
  }
});
