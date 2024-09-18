# (Branch) Adding Wirebox to a Base CFML Application (no frameworks)

This is an experimental project meant to explore how to add tooling to a basic application using CFML/Lucee.

The app on the master branch simulates a legacy application with global variables, script tags (no module management/import export syntax), storing and including libraries at a static version (such as jQuery), no automated testing or tests and general older ways of designing a web application (no frameworks or modern tooling).

This Branch is experimenting with how to add WireBox to the base CFML application.
WireBox is a DI tool for managing object dependencies more easily.

## Prerequisites

- Docker Desktop
- [Command Box](https://www.ortussolutions.com/products/commandbox)

## Run the App

### Install Dependencies

- run `box install` to install dependencies for WireBox if pulling the repo for the first time

### Start the app in development:

- `docker compose up`
- Go to http://localhost:8080

# WIREBOX

- A tool for auto managing object dependencies.
- [WireBox Docs](https://wirebox.ortusbooks.com/getting-started/overview)
- [Talk by Grant Copley on CFCasts](https://cfcasts.com/series/webinars/videos/grant-on-injecting-dependencies-with-wirebox)
  - Demo starts at timestamp 33:33

### Installing WireBox

- `box install wirebox`

## Using WireBox

- Create an Injector, use the injector to instantiate an instance of a component/object:

```java
// Need to create an Injector instance with wirebox
wirebox = new wirebox.system.ioc.Injector();
// Get the component with the injector which will wire it up with dependencies automatically and return
myComponent = wirebox.getInstance("MyComponent");
```

## Configuring WireBox

- Use the Configuration Binder: a single .cfc file that controls WireBox's behavior.
  - Set up aliases
  - Set up scan locations to tell WireBox where to look for objects to wire up

```java
// WireBoxConfig.cfc
component extends="wirebox.system.ioc.config.Binder" {
  function configure() {
    // config goes here
  }
}

// USAGE - pass the name of the file that is the binder to the Injector
wirebox = new wirebox.system.ioc.Injector("WireBoxConfig");
```

### Using Aliases, Mapping Directories in the Binder

- You can use the Binder to map aliases to components
- Mapping Directories: if you want to move all your objects to a new folder, you can tell WireBox where the folder is and give it a namespace

```java
// WireBoxConfig.cfc
component extends="wirebox.system.ioc.config.Binder" {
  function configure() {
    // create a alias mapping (alias mapped to the component)
    map("TimeMachine").to("DeLorean");

    // map to directory and you can namespace the objects in the folder:
    mapDirectory(
      packagePath="models", //the folder where your components are
      namespace="@BTTF"
    );
  }
}

wirebox = new wirebox.system.ioc.Injector("WireBoxConfig");
// Use the alias to get the object
deLorean = wirebox.getInstance("TimeMachine@BTTF"); // get the alias with the namespace created in map directory (this tells wirebox to go to the folder mapped to this namespace to get the object)
```

## Injecting Dependencies

### Property Injection (Recommended)

- This method is less boilerplate and cleaner to implement
- Add a property line in your component with an inject annotation:

```java
component name="MyComponent" accessors="true" {
  // add a property with an inject annotation:
  property name="someDependency" inject="SomeDependency";
}
```

### Constructor Injection

- Add an `@` pointer above the constructor in the component

```java
// MyComponent.cfc

// The @someDependency.inject line tells WireBox to inject something into the argument named "someDependency"
// The thing to inject is the following component/object after that ("SomeDependency")
component name="MyComponent" accessors="true" {
  /**
   * Constructor annotations
   * @someDependency.inject SomeDependency
   */
  function init( required someDependency ) {
    variables.someDependency = arguments.someDependency;
    return this;
  }
}
```

### Setter Injection

- use a setter method in your component

```java
component name="MyComponent" accessors="true" {
  // inject something with a setter method in your component:
  function setSomeDependency( required someDependency )
    inject="SomeDepency" {
      variables.someDependency = arguments.someDependency;
    }

}
```

## WireBox Lifecycle Events Hooks

- You can hook into events that fire for the injection lifecycle and do things when they occur

### On DI Complete

```java
component name="DeLorean" {
  function onDIComplete() {
    // some operations that you want to happen automatically when this component is instantiated and wired up
    powerOn();
  }

  function powerOn() {
     fluxCapacitor.powerOn();
  }
}

// fires after calling getInstance and all injections are complete:
deLorean = wirebox.getInstance("DeLorean");
// deLorean is powered on
```

### Other Events

- Instance Creation
- Instance Inspection
- Injector AutoWire
- Injector Shutdown

## Object Populator

- Quickly populate objects from various sources
  - structs, JSON, Queries, XML
- Useful for quickly populating object with form data, or third party API data pulled in.
  - Otherwise, you normally would have to manually populate it with setters, etc.

```java
// get instance of component you want to populate
deLorean = wirebox.getInstance("DeLorean");

// get a populator instance:
populator = wirebox.getObjectPopulator();

// use the populator
populator.populateFromStruct(
  target=deLorean,
  memento={ // pass a struct to populate the target with
    year: 1985 // this will look for a setter (setYear()) on the target, and if it finds it, will pass the value to it
  },
  trustedSetter = false, // instructs to call the setter even if one isn't found (special use cases)
  include="", // tell it what keys to include explicitly
  exclude="", // tell it what keys to exclude
  ignoreEmpty= true // if this is true, if the data is empty it won't call the setter
)
```

## Scopes

- `NOSCOPE` - default scope for objects used by Wirebox. Gives back a new instance everytime getInstance() is called.
- `SINGLETON` - Wirebox will only create one instance for the lifetime of the application
  - useful for service objects that query the db, etc.
- `REQUEST` - Creates one instance for the duration of the current Request.
- `SESSION` - Creats an instance for the duration of the current Session.
  - Be careful with these - it will create a new instance for every single session active in your application. Can snowball into lots of objects and memory usage
- `APPLICATION` - Store the instance for the lifetime of the application
- `SERVER` - Single instance for the lifetime of the Server.

```java
// NOSCOPE (default)
component name="MyComponent" {

}

// REQUEST
component name="MyComponent" scope="REQUEST" {

}

// SESSION
component name="MyComponent" scope="SESSION" {

}

// SINGLETON, can also use scope="SINGLETON"
component name="MyComponent" singleton {

}
```

## Considerations and Gotchas

- Careful about the cost of autoinjection - it can take a lot of memory with a lot of objects and deep graphs
- **Scope Widening**: Injecting different scoped objects into another differently scoped object
  - If you inject a NOSCOPE object into a Singleton, BOTH OBJETS BECOME A SINGLETON!
  - If you inject a SESSION scoped object into a Singleton scoped obj, the session object could timeout and cause errors. The reference the singleton has to that obj is gone if it times out.
    **Avoid scope widening with the help of Providers**

### Providers

- Delays the creation and assembly of dependencies until needed
  - Instead of injecting the actual dependencies, a lightweight instance of a Provider.cfc is injected
  - You call `provider.get()` to get the actual dependency at a later time.
- Useful for preventing Scope Widening
- helps with memory space saved
- Reduces auto-wiring time of large objects
  - For instance if you don't need some dependencies always but only in certain cases.

```java
component name="DeLorean" accessors="true" singleton {
  // one way of using a provider is in the property and prepending it to the name of the instantiated dependency
  property name="fluxCapacitor" inject="provider:fluxCapacitor";

  // An alternative way is to make a getter method and add a provider annotation pointing to the dependency
  function getFluxCapacitor() provider="fluxCapacitor" {

  }
}

// USAGE
deLorean = wirebox.getInstance("DeLorean");
deLorean.getFluxCapacitor(); // returns an instance of Provider.cfc
deLorean.getFluxCapacitor().get(); // finds the dependency and returns it
```
