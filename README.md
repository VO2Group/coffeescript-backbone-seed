coffeescript-backbone-seed
==========================

Backbone.js application written in CoffeeScript

# Build requirements:

* coffee-script
* bower
* hogan.js

## To install, use:

```ksh
npm install -g coffee-script
npm isntall -g bower
npm install -g hogan.js
```

## To build, use:

```ksh
bower install
cake compile
```

The Cakefile also provides a `watch` task to auto-rebuild the application:

```ksh
cake compile
```

# Server

The server which hosts this application must respond to the following routes:

```
POST /login {login: "john", pass: "Doe"}
 -> HTTP 200 if the logging is successful
 -> HTTP 400 otherwize

GET /logout
 -> HTTP 200

The next routes must have a middleware which returns HTTP 401 if the user is not logged:

GET /items
 -> HTTP 200 [{id: 0, name: 'foo'}, {id: 1, name: 'bar'}, {id: 2, name: 'baz'}, ...]

POST /items {name: 'foo'}
 -> HTTP 200 {id: 42, name: 'foo'}

GET /items/:id
 -> HTTP 200 {id: 42, name: 'foo'}

PUT /items/:id {id: 42, name: 'bar'}
 -> HTTP 200 {id: 42, name: 'bar'}

DELETE /items/:id
 -> HTTP 200
```