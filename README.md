# Adding Vitest to the vanilla app

## Prerequisites

- Docker Desktop
- (optional for testbox) [Command Box](https://www.ortussolutions.com/products/commandbox) if using TestBox and running tests
- Node.js - LTS (to install and run vitest)

## Run the App

- `docker compose up`
- Go to http://localhost:8080

## Run the tests

- `npm run test`

## Installation steps (for reference)

- `npm init -y`
- `npm install vitest -D`
- create `vitest.config.js` at root and enable globals to use expect, etc. without having to import them manually in tests
- create test files with `.test.js` extension
