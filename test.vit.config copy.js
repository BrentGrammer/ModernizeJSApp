// vite.config.js
// update this as needed
import { defineConfig } from "vite";

export default defineConfig({
  root: "./src",
  build: {
    outDir: "../dist",
    rollupOptions: {
      input: {
        template1: "src/template1/main1.js",
        template2: "src/template2/main2.js",
      },
      output: {
        entryFileNames: "[name]/[name].[hash].js", // output names of scripts - [hash] will generate the hash, but YOU NEED TO UPDATE MANUALLY in the cfm files to match if using this feature.
        chunkFileNames: "[name]/[name].[hash].js", // Add hash for chunk files
        assetFileNames: "[name]/[name].[hash].[ext]", // Add hash for assets // in cfm file:  <!-- Include the bundled JavaScript file with cache busting --> <script type="module" src="dist/template1/main1.[hash].js"></script>
      },
    },
  },
});
