# Flatiron Store on Rails

## Overview
We're going to build an e-commerce site! We're going to make an online store where users can browse items, put items in their carts, and buy items, which changes our inventory.

## Instructions

### Users
1. Have just an email and password
2. Should be able to log in and log out
3. Also sign up
4. Note: You must use the Devise gem to set up user for tests to pass.
5. You may find that you're missing some seed data. Look at the error messages you get carefully and don't be surprised if you have to [add some seed data](http://edgeguides.rubyonrails.org/active_record_migrations.html#migrations-and-seed-data)

### Items
1. List of available items whether you are logged in or not
2. If logged in, each item should have an "Add to Cart" button
3. When the user adds an item to the cart it should show them their current cart

### Cart/Checkout
1. Users should be able to checkout from their cart
2. This shows them their cart afterwards, and deducts inventory from each item
3. Prices should be in the `$XX.XX` format
4. The Checkout process should set that current cart to a status of "submitted"

### Headers/Nav
1. Users should know who they are logged in as
2. Users should be able to sign in/out from the navigation bar
3. Users should always be able to go "home"
4. If the user has a current cart, there should be a "Cart" link to their current cart

## Specifying custom class names and foreign keys
Imagine a simple dating app that tracks relationships between its users. In order to retrieve a user's current relationship from the database, it would make sense to call something like `user.current_relationship`. However, Active Record doesn't intuitively understand that it should map the `belongs_to :current_relationship` association to the `Relationship` model (or the corresponding `relationship_id` column in the database). To explicitly point it at the correct model, we can use the `:class_name` and `:foreign_key` attributes like so:
```ruby
class User < ActiveRecord::Base
  belongs_to :current_relationship, class_name: 'Relationship', foreign_key: 'relationship_id'
end
```

For more information, check out [`:class_name`][class_name] and [`:foreign_key`][foreign_key] in the RailsGuides entry on [Active Record Associations][RailsGuides], this [StackOverflow post][StackOverflow], and the `models/post.rb` section in this [SitePoint refresher][SitePoint].

## Resources
* [RailsGuides — Active Record Associations][RailsGuides]
  - [`:class_name`][class_name]
  - [`:foreign_key`][foreign_key]
* [StackOverflow — class_name foreign_key in Rails model][StackOverflow]
* [SitePoint — Brush up your knowledge of Rails associations][SitePoint]
* [Lab Review](https://www.youtube.com/watch?v=x_qQCnYPyBk)

[RailsGuides]: http://guides.rubyonrails.org/association_basics.html
[class_name]: http://guides.rubyonrails.org/association_basics.html#options-for-belongs-to-class-name
[foreign_key]: http://guides.rubyonrails.org/association_basics.html#options-for-belongs-to-foreign-key
[StackOverflow]: https://stackoverflow.com/a/41135173
[SitePoint]: https://www.sitepoint.com/brush-up-your-knowledge-of-rails-associations/

<p class='util--hide'>View <a href='https://learn.co/lessons/flatiron-store-project'>Flatiron Store Project</a> on Learn.co and start learning to code for free.</p>
