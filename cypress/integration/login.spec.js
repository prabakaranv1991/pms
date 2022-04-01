describe('Login', () => {
    beforeEach(() => {
        cy.login('admin', 'Praniya_143')
    })
    it('Valid Credential', () => {
        cy.url().then(url => {
            cy.url().should('include', '/home')
        })
    })
})