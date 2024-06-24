# Modernizing with Vite

- Attempting to add Vite tooling.

## Issues

- Docker containers do not shut down gracefully on CTRL-C due to concurrently setup in npm scripts.

## Prerequisites

- Docker Desktop
- Node.js
- [Command Box](https://www.ortussolutions.com/products/commandbox) (Optional - only neede if using tests with TestBox)

## Run the app

### Install dependencies

- `npm install`
- (Optional) If using tests, run `box install` to install dependencies for TestBox
  - Note: requires installing Command Box on your local machine.

### Start the server with Docker and run Vite bundler

- `npm start`
  - starts docker lucee server
  - starts vite in watch mode to produce updated bundles when JS src files change
    - starts bundling script files into the /wwwroot/js folder and watches changes.
    - After making a change to the JS files, refresh the page in the browser to see updates with the CFM page served.
    - Note: the /libs directory is preserved when bundles are rebuilt to retain legacy libraries if needed.

## Notes

- Vite auto empties the out directory when building.
