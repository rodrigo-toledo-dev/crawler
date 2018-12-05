```
rails new crawler --api --skip-test-unit -–skip-active-record
```

gem 'mongoid', '~> 6.0'
gem 'bson_ext'

on mac
brew services start mongodb

rails g mongoid:config