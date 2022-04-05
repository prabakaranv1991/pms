// ***********************************************************
// This example support/index.js is processed and
// loaded automatically before your test files.
//
// This is a great place to put global configuration and
// behavior that modifies Cypress.
//
// You can change the location of this file or turn off
// automatically serving support files with the
// 'supportFile' configuration option.
//
// You can read more here:
// https://on.cypress.io/configuration
// ***********************************************************

// Import commands.js using ES2015 syntax:
import './commands'

require('dotenv').config()

module.exports = (on, config) => {
  // copy any needed variables from process.env to config.env
  config.env.username = process.env.USER_NAME

  // do not forget to return the changed config object!
  return config
}

// integration/spec.js
it('has username to use', () => {
  expect(Cypress.env('username')).to.be.a('string')
})

// Alternatively you can use CommonJS syntax:
// require('./commands')
