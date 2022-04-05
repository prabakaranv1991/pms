Cypress.Commands.add('login', (username, password) => {
    cy.visit('login')
    cy.get('input[name=username]').clear().type('admin')
    cy.get('input[name=password]').clear().type('Praniya143')
    cy.get('button[type=submit]').click()
    cy.url().then(url => {
        cy.url().should('include', '/home')
    })
})

Cypress.Commands.overwrite('visit', (originalFn, url, options) => {
    url = Cypress.env('BASEURL') + url
    return originalFn(url, options)
  })
