describe('Login', () => {
    beforeEach(() => {
        cy.login(Cypress.env('USERNAME'), Cypress.env('PASSWORD'))
    })
    it('Valid Credential', () => {
        cy.url().then(url => {
            cy.url().should('include', '/home')
        })
    })
})