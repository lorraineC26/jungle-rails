// run `rails server -e test` in ruby test server mode
describe("visit the homepage", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000");
  });

  it("There is nav bar on top", () => {
    cy.get(".navbar").should("be.visible");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("The cart button changes when adding products to it", () => {
    cy.get(".products article .btn").first().click({ force: true });
    cy.get(".end-0 > .nav-link").contains("My Cart (1)");
  });
  
});
