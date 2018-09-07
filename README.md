# Tester Of ActiveRecord/ActiveModel

This is tester for ActiveRecord/ActiveModel without **Rails**.

## License

MIT

## Get Started

```sh
gem install bundler
bundle install --path=vendor/bundle
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec pry
```

## Tester Example

```ruby
parent = Parent.create!(body: '')
child = parent.children.create!(body: '')
grandchild = child.grandchildren.create!(body: '')

parent.reload
parent.children.first.mark_for_destruction
parent.save # child and grandchildren is not delete.

parent_id = parent.id
parent = Parent.includes(:chidren).find(parent_id)
parent.children.first.mark_for_destruction
parent.save # child and grandchildren is delete. Wow!
```
