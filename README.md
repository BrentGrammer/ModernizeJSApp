# Modernize using Parcel

- Adding the tool [Parcel](https://parceljs.org/) to the app.

## Issues

- Docker containers do not shut down gracefully on CTRL-C due to concurrently setup.

## Prerequisites

- Docker Desktop
- Node.js
- [Command Box](https://www.ortussolutions.com/products/commandbox) (Optional, only needed if using tests)

## Run the app

### Install Dependencies

- in a terminal: `npm install`
- (Optional) If using tests, run `box install` to install dependencies for TestBox
  - Requires installing command box on your local machine.

### Start the server

- `npm start`
  - starts bundling js with parcel in watch mode.
  - Go to http://localhost:8080

### Stop the server

- CTRL/CMD-C in the terminal running the app
- run `docker compose down`

## Branches

- Each branch is an iteration of the app trying out different tooling and setup.
- Consult the README in the branch for prerequisites and documentation.

## Notes on Parcel (Pros)

- splitting your js files into folders in the src folder will do the same when they are bundled in case you want to separate main bundles for different pages.
- Comes with auto hot reload working in the browser out of the box
- Minifies and does not include unused code or comments in production build files.
  - Auto removes dead code!
