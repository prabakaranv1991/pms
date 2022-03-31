describe('Login', () => {
    beforeEach(() => {
        cy.login('admin', 'admin')
    })
    it('Valid Credential', () => {
        cy.url().then(url => {
            cy.url().should('include', '/home')
        })
    })
})