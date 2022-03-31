describe('Finance', () => {
    beforeEach(() => {
        cy.login('admin', 'admin')
    })
    it('Change Month', () => {
        cy.visit(Cypress.config('baseUrl') + 'finance')
        print(date)
    })
})