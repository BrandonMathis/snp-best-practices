# Salt & Pepper Best Practices
> for Ruby on Rails applications

## Features

* Deployment
  - Capistrano integration
  - configuration and stages generator
  - custom tasks
  - puma integration
  - rbenv support
  - predefined default [settings](lib/capistrano/snp/defaults.rb)
* Project settings
  - .editorconfig

## Requirements

It is tested and works with:

* MRI >= 2.1
* Rails >= 4.1

Other versions are untested but might work fine.

## Installation

Add this line to your application's Gemfile into `development` group:

    gem 'snp-best-practices', git: 'git@git.snpdev.ru:saltpepper/snp-best-practices.git'

And then execute:

    $ bundle

## Usage

### Add settings to your project

    $ rails g snp:settings

### Add deployment configuration

    $ rails g snp:deploy

This creates the following files, you can edit them for your choice.

```
├── Capfile
└── config
    ├── deploy
    │   ├── production.rb
    │   └── testing.rb
    ├── environments
    │   └── testing.rb
    └── deploy.rb
```

## Advanced usage

### Custom stages

`production` and `testing` stages are generated by default, but you can easily
add any another:

    $ rails g snp:deploy staging local sandbox qa etc

## License

This project rocks and uses MIT License (MIT).

Copyright (c) 2014 Salt & Pepper
