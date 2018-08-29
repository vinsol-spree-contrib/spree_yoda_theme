SpreeYodaTheme
==============

Enable spree users to apply a theme on their store.

####For admin:

Admin can select a theme from the list of available themes and update it. This would start reflecting the new theme on the customer end.

Installation
------------

Add spree_yoda_theme to your Gemfile:

```ruby
gem 'spree_yoda_theme', github: 'vinsol-spree-contrib/spree_yoda_theme', branch: 'master'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_yoda_theme:install
```

Configuration
--------

1. To apply a new theme on the customer end, follow the below steps:

  ```
  1. Go on the url `/admin/theme` .
  2. Select the theme you want to apply from the `Choose a new theme` drop down.
  3. Click on apply.
  ```

2. To apply the default spree theme on the customer end, follow the below steps:

  ```
  1. Go on the url `/admin/theme` .
  2. Select the theme `default` from the `Choose a new theme` drop down.
  3. Click on apply.
  ```

Creating a new theme
--------

1. To create a new theme , follow the below steps:

  ```
  1. Run the command `bundle exec rake generate_theme name=theme_name`
  2. Customize the CS and JS files generated inside `vendor/themes/theme_name` according to your requirement.
  ```

  ```
  You have to restart the server to make this newly generated theme available in `Choose a new theme` drop down on the admin end.
  ```

Testing
-------

You need to do a quick one-time creation of a test application and then you can use it to run the tests.

    bundle exec rake test_app

Then run the rspec tests with:

    bundle exec rspec .


Credits
-------

[![vinsol.com: Ruby on Rails, iOS and Android developers](http://vinsol.com/vin_logo.png "Ruby on Rails, iOS and Android developers")](http://vinsol.com)

Copyright (c) 2016 [vinsol.com](http://vinsol.com "Ruby on Rails, iOS and Android developers"), released under the New MIT License
