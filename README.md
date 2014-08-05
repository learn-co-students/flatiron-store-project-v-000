---
tags: full-application, associations, sessions, intermediate
language: ruby
resources: 0
---

# Flatiron Store on Rails

We're going to build a bookstore e-commerce site! We're going to make an online store where users can browse items, put items in their carts, and buy items, which changes our inventory. Users can log in using Github. We're eventually going to integrate the Stripe API to handle payments, and then integrate Segment.io to analyze user events.

Before anything, note that when you generate models, controllers, etc, be sure to include this option, so that it skips tests (which we already have): `--no-test-framework`

## First iteration

### Tasks:

1. Models and Associations
  * Use the unit tests to guide your model associations
  * We're going to treat our shopping cart like a session

2. Functionality through class and instance methods
  * Use the integration tests to guide functionality
  * A user can buy an item that they put in their cart, which changes the inventory

## Second iteration

1. OmniAuth 
2. Stripe API integration
3. The act of checking out creates a user, their order (turning the LineItems in carts into an order that belongs to a user)

## Third iteration

1. Segment.io analysis of user events / behavior

## Resources