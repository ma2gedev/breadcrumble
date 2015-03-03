# Breadcrumble

[![Gem Version](https://badge.fury.io/rb/breadcrumble.png)](http://badge.fury.io/rb/breadcrumble)
[![Build Status](https://secure.travis-ci.org/ma2gedev/breadcrumble.png?branch=master)](http://travis-ci.org/ma2gedev/breadcrumble)
[![Dependency Status](https://gemnasium.com/ma2gedev/breadcrumble.png)](https://gemnasium.com/ma2gedev/breadcrumble)
[![Code Climate](https://codeclimate.com/github/ma2gedev/breadcrumble.png)](https://codeclimate.com/github/ma2gedev/breadcrumble)
[![Coverage Status](https://coveralls.io/repos/ma2gedev/breadcrumble/badge.png)](https://coveralls.io/r/ma2gedev/breadcrumble)

![Breadcrumble Logo](http://ma2gedev.github.io/breadcrumble/images/logo_s.png)
logo designed by [@524shoutz_nika](https://twitter.com/524shoutz_nika)

Breadcrumble is a simple breadcrumb navigation plugin for Ruby on Rails 3, 4.0, 4.1 and 4.2.

Support rich snippets mark up using microdata format as default.

And also support multiple breadcrumb trails.

See also about rich snippets -> <http://support.google.com/webmasters/bin/answer.py?hl=en&answer=185417>

## Installation

Add this line to your application's Gemfile:

    gem 'breadcrumble'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install breadcrumble

## Usage

### Controller

In your controller, call `add_breadcrumb` to push a new crumb on the breadcrumb stack.

    class SampleController
    
      add_breadcrumb("home", home_url)
      add_breadcrumb(-> context { context.title }, -> context { context.sample_path })
      
      def index
        add_breadcrumb("index", controller: 'sample', action: 'index')
        add_breadcrumb("show", show_path(123))
        add_breadcrumbs(["book", "/book"], ["page", "/book/page"])
      end
    
    end

Second arugment passed url_for method for convenient use, except specify nil.

You can use Proc object for arguments, the library calls proc with controller context as argument.

If you would like to use multiple breadcrumb, call `add_breadcrumb_to` method with breadcrumb trail index.

    class SampleController
    
      add_breadcrumb_to("level 1", "level 1 url", 0) # same as -> add_breadcrumb("level 1", "level 1 url")
      add_breadcrumb_to("level 2", "level 2 url", 1)
    
      def index
        add_breadcrumb_to("level 1 second item", "level 1 second url", 0)
        add_breadcrumb_to("level 2 second item", "level 2 second url", 1)
    end

### View

In your view, you can render the breadcrumb navigation with the `render_breadcrumbs` helper.

    <body>
      <%= render_breadcrumbs %>
    </body>

You can render multiple breadcrumb by `render_breadcrumb_trails` helper.

    <body>
      <%= render_breadcrumb_trails %>
    </body>

### Customizing layout

Breadcrumble generates default partial template for your app.

Generate template. Run the follwoing.

    $ rails g breadcrumble:views

then edit the partials in your app's `app/views/breadcrumble/` directory.

### Theme

You can choose template themes in a single application. Create a directory with theme name in your app's `app/views/breadcrumble/` and create custom template files.

```
$ rails g breadcrumble:views
$ cd app/views/breadcrumble
$ mkdir my_custom_theme
$ cp _*.erb my_custom_theme/
```

And then calling `render_breadcrumbs` or `render_breadcrumb_trails` method with theme option.

```
<%= render_breadcrumbs(theme: 'my_custom_theme') %>
<%= render_breadcrumb_trails(theme: 'my_custom_theme') %>
```

## Live Demo

<http://breadcrumble.herokuapp.com/>

## Contributing

### Easy way

It's easy to contribute. You only push the star button!

### The other way

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
