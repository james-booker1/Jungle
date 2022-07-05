

describe('Home page', () => {
  it('opens homepage',() => {
    cy.visit('/')
  })

 
  it("Should add one item to the cart", () => {
    cy.get(".btn").first().click({force: true})
  })
  

  it("should confirm item was added to cart", () => {
    cy.get(".nav-link").contains("My Cart").contains("1")
  })
})