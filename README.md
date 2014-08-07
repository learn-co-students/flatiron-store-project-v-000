---
tags: full-application, associations, sessions, intermediate
language: ruby
resources: 0
---

# Flatiron Store on Rails

We're going to build an e-commerce site! We're going to make an online store where users can browse items, put items in their carts, and buy items, which changes our inventory. Users can log in using Github. We're eventually going to integrate the Stripe API to handle payments, and then integrate Segment.io to analyze user events.

Before anything, note that when you generate models, controllers, etc, be sure to include this option, so that it skips tests (which we already have): `--no-test-framework`

## First iteration

### Tasks:

1. Models and Associations
* Use the unit tests to guide your model associations
* Some hints:
  * We're going to treat our shopping cart like a session; a cart is instantiated and marked as a session when we add our first item to our cart.
  * line_items are like join tabls between items and carts. They come into existance when we add an item to our cart.

2. Functionality through class and instance methods and controller actions
  * Use the integration tests to guide functionality
  * Our Cart should be able to:
    * adding the same item more than once; the line_item's quantity should change in this event
    * display a total given the price/quantity of all line_items.
  * A user can buy items that they put in their cart, which changes the inventory of the item
  * When a user checks out, an order object should be created. Orders will be replaced by carts, as carts should be deleted after some time (in a Raketask). A user will be able to view their order history when they log in.

3. Views for Program Flow
  * Add to cart buttons for each item
  * Navigation bare for visiting store home page and cart
  * Cart link should only be visible if user has added items to the cart
  * Checkour link

## Second iteration

1. User functionality through OmniAuth 
2. Stripe API integration
3. The act of checking out creates a user, their order (turning the LineItems in carts into an order that belongs to a user)

## Third iteration

1. Segment.io analysis of user events / behavior

## Resources