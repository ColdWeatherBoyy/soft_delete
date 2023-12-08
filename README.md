# README

## Description

This is a completion of Pacer Pro's coding challenge, built on top of a base Rails application. It builds functionality for a model, Item, with two methods, soft_delete and restore, complete with testing to confirm their success.

## Summary of Methods

The soft_delete method updates a given rows deleted_at column to the current time (with timezone reflected) that the method was called. The restore method updates the deleted_at column to nil. This is necessary because the default_scope is configured such that items with a non-nil (and specifically datetime) deleted_at column are not returned in queries.

## Testing

To set up and run this code and tests, first clone the repo. Next, you'll need to set up the database. First, run bundle install. Then, run the database migration with `rails db:migrate`.

The best way to run and check this code is within the `irb` console. To do so, run `rails console` from the command line. You can then create new items with `test_item = Item.create(name: "test item")`. You can then soft delete this item with `test_item.soft_delete`. Use `Item.all` to see that it no longer is found. Next, you can restore this item with `test_item.restore`. Again, use `Item.all` to now see that that item is found.

To ensure the `default_scope` is working correctly, now add a second item,`test_item2 = Item.create(name: "test item2")`. Re-run `test_item.soft_delete`, and then run `Item.all`. You should only see `test_item2` returned.

Finally, run the RSpec tests with `rake spec`. You should see 3 passing tests.

Thanks!
