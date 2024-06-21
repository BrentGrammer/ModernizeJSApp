# Modernize using Parcel

- This is an experimental project meant to explore how to add tooling and bundlers such as Vite, Parcel, ESBuild or Webpack to a app using vanilla JavaScript, Lucee and no tooling.

## Issues
- how to automate npm run start after docker container starts serving Lucee server?

## Prerequisites

- Docker Desktop
- Node.js

## Run the app

- in a terminal: `npm install`
- `docker compose up`
- in a terminal: `npm run start` to bundle js with parcel in watch mode.
- Go to http://localhost:8080
  - To visit the other page, go to http://localhost:8080/?page=page2

## Branches

- Each branch is an iteration of the app trying out different tooling and setup.
- Consult the README in the branch for prerequisites and documentation.

## Notes on Parcel

- splitting your js files into folders in the src folder will do the same when they are bundled in case you want to separate main bundles for different pages.
