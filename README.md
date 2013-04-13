# Highlander

> There can be only one

## Intent

Highlanders goal is to encourage and promote awesome work through points and badges.  Focusing on rewarding great work through positive point allocation instead of negative point deduction is a major goal of the project.

## Getting started

1. Clone it
2. `bundle install`
3. `bundle exec rake db:create db:migrate db:data_migrate`
4. `rails s`
5. Hit `http://localhost:3000`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Development notes:

**We use the data_migrations gem for seed data**

To keep our data migrations seperate from the schema migrations*, we use [@ashmckenzie's](https://github.com/ashmckenzie) [data_migrations](https://github.com/ashmckenzie/data_migration) gem.

To create a new migration (e.g. add a new metric):

    $ rails g data_migration:new <name of migration>  # similar to rails g migration <name of migration>
    $ rake db:data_migrate                            # similar to rake db:migrate

Please see the [data_migrations docs](https://github.com/ashmckenzie/data_migration) for further info.

_*Please note this means the Rails migrations are for schema changes only_

