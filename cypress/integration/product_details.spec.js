describe('Home page', () => {
  it('opens homepage',() => {
    cy.visit('/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Should select one of the products and direct to its info page", () => {
    cy.get(".products article").first().click()
    cy.get(".products-show").should("exist")
  })
})