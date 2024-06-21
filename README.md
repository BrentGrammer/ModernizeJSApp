# Modernizing with Vite

- Attempting to add Vite tooling.

## Run the app

### Install dependencies

- `npm install`

### Start the server with Docker and run Vite bundler

- `docker compose up`
- Go to http://localhost:8080
  - To visit page 2: http://localhost:8080/?page=page2
- in a terminal run, `npm run watch`
  - starts bundling script files into the /wwwroot/js folder and watches changes.
  - After making a change to the JS files, refresh the page in the browser to see updates with the CFM page served.
