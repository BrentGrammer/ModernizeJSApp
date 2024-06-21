# Modernizing with Vite

- Attempting to add Vite tooling.

## Goals/Issues

- Bundles are produced, but source maps are lost which are vital during development for debugging.

## Start the server

- `docker compose up`
- Go to http://localhost:8080
- in a terminal run, `npm run watch`
  - starts bundling script files into the /wwwroot/js folder and watches changes.
  - After making a change to the JS files, refresh the page in the browser to see updates with the CFM page served.
