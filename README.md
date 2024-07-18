# Vitest without a Bundler (using Native ES Modules)

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

## Native import/export usage

### ES Modules

- `import` and `export` syntax is now [widely supported](https://caniuse.com/?search=es6%20modules) natively without the need for adding a bundler.
- There was no need to rename files to `.mjs` extensions - importing and exporting worked with just `.js` extensions.
- Optionally you can also try to use the `.mjs` extension on your files. This helps flag to various tooling (NodeJS, web servers, etc.) that this file uses ECMAScript Modules (ESM) syntax. With this, no module bundlers are needed when serving to a browser, as ESM Imports are now well-supported
  - [In depth guide to ESM](https://gils-blog.tayar.org/posts/using-jsm-esm-in-nodejs-a-practical-guide-part-1/)
- You can name your test files simply with `.test.js`
  - These files are only executed in a node.js runtime environment and use it's native import/export module capability

### script defer

- why no “document.addEventListener” for DOMContentLoaded? As it turns out, in browsers, you can load with `<script defer>` and get the same effect.
