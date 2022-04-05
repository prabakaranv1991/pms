describe('Finance', () => {
    beforeEach(() => {
        cy.login(Cypress.env('USERNAME'), Cypress.env('PASSWORD'))
    })
    it('Change Month', () => {
        cy.visit(Cypress.config('baseUrl') + 'finance')
    })
})