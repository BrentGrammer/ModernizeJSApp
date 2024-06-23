# Modernizing with Vite

- Attempting to add Vite tooling.

## Prerequisites

- Docker Desktop
- Node.js
- [Command Box](https://www.ortussolutions.com/products/commandbox) (if using tests)

## Run the app

### Install dependencies

- `npm install`
- `box install`

### Start the server with Docker and run Vite bundler

- `npm start`
  - starts docker lucee server
  - starts vite in watch mode to produce updated bundles when JS src files change
    - starts bundling script files into the /wwwroot/js folder and watches changes.
    - After making a change to the JS files, refresh the page in the browser to see updates with the CFM page served.

## Notes

- Vite auto empties the out directory when building.
