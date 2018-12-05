# if you want start one application

## create rails app with rvm

```
rvm use 2.5.1@crawler --create
rails new crawler --api --skip-spring -–skip-active-record -T
cd crawler
echo "crawler" > .ruby-gemset; cd .; echo 'gem "mongoid", "~> 6.0"' >> Gemfile; echo 'gem "bson_ext"' >> Gemfile
bundle install
```

## start mongodb on macos

### install mongodb
```
brew install mongodb
```

### start the service of mongodb
```
brew services start mongodb
```

```
rails g mongoid:config
```

# if want the project

## start mongodb on macos

### install mongodb
```
brew install mongodb
```

### start the service of mongodb
```
brew services start mongodb
```

## start the project

```
rails s
```

## find some tag

Search tag **love**

```
http://localhost:3000/quotes/love
```