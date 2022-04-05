describe('Finance', () => {
    beforeEach(() => {
        cy.login(Cypress.env('USERNAME'), Cypress.env('PASSWORD'))
    })
    it('Change Month', () => {
        cy.visit('finance')
        var now = new Date();
        if (now.getMonth() == 11) {
            var current = new Date(now.getFullYear() + 1, 0, 1);
        } else {
            var current = new Date(now.getFullYear(), now.getMonth() + 1, 1);
        }
        var next_month = current.toLocaleString('default', { month: 'long' }) + "' " + now.getFullYear().toString().substr(-2)
        console.log(current)
        cy.get('[name="month"]').select(next_month)
        cy.url().then(url => {
            cy.url().should('include', '?month=' + String(current.getFullYear()) + '-' + String(current.getMonth()) + '-01' )
        })
    })
})