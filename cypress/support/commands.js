Cypress.Commands.add('login', (username, password) => {
    cy.visit(Cypress.config('baseUrl') + 'login')
    cy.get('input[name=username]').clear().type('admin')
    cy.get('input[name=password]').clear().type('Praniya_143')
    cy.get('button[type=submit]').click()
    cy.url().then(url => {
        cy.url().should('include', '/home')
    })
})
