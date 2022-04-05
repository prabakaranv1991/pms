describe('Finance', () => {
    beforeEach(() => {
        cy.login(Cypress.env('USERNAME'), Cypress.env('PASSWORD'))
    })
    it('Change Month', () => {
        cy.visit('finance')
    })
})