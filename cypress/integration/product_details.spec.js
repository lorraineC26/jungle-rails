// run `rails server -e test` in ruby test server mode
describe("visit the homepage", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000");
  });

  it("There are products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("should navigate from the home page to the product detail page by clicking on a product", () => {
    cy.get(".products article").first().click();
    cy.location("pathname").should("include", "products");
    cy.get(".product-detail").should("be.visible");
  });

});
