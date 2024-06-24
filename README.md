# Modernize a Multi-Page Vanilla JS Application with Tooling

This is an experimental project meant to explore how to add tooling and bundlers such as Vite, Parcel, ESBuild or Webpack to a multi-page app using vanilla JavaScript and Lucee (serving CFML .CFM pages) without any tooling to start with.

The app on the master branch simulates a legacy application with global variables, script tags (no module management/import export syntax), storing and including libraries at a static version (such as jQuery), no automated testing or tests and general older ways of designing a web application (no frameworks or modern tooling).

#### The app consists of:

- A Lucee server
- A MySQL database
- JavaScript (vanilla and using JQuery)

### Goal and Purpose of the Project

The goal is to try to experiment with ways to modernize the application by adding tooling such as bundlers, a node.js environment for package management, and adding regression resilience via unit and integration tests.

(See [Branches](#branches) which list iterations using various tooling and approaches to modernizing the application.)

## Prerequisites

- Docker Desktop
- [Command Box](https://www.ortussolutions.com/products/commandbox) if using TestBox and running tests

### Install Dependencies

- (Optional) If using tests, run `box install` to install dependencies for TestBox

## Run the App

- `docker compose up`
- Go to http://localhost:8080

## Branches

- Each branch is an iteration of the app trying out different tooling and setup.
  - `master`: Basic application without any tooling or bundlers added
  - `vite`: adding [Vite](https://vitejs.dev/) toolchain
  - `parcel`: adding [Parcel](https://parceljs.org/) bundler
- Consult the README in the branch for prerequisites and documentation.
