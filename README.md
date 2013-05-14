# Breadcrumble [![Build Status](https://secure.travis-ci.org/ma2gedev/breadcrumble.png?branch=master)](http://travis-ci.org/ma2gedev/breadcrumble)

Breadcrumble is a simple breadcrumb navigation plugin for Ruby on Rails 3 and Rails 4.0.

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
    
      add_breadcrumb "home", home_url
      add_breadcrumb -> context { context.title }, -> context { context.sample_path }
      
      def index
        add_breadcrumb "index", index_url
      end
    
    end

Second arugment passed url_for method for convenient use, except specify nil.
You can use Proc object for arguments, the library calls proc with controller context as argument.

### View
In your view, you can render the breadcrumb navigation with the `render_breadcrumbs` helper.

    <body>
      <%= render_breadcrumbs %>
    </body>

### Customizing layout
Breadcrumble generates default partial template for your app.

Generate template. Run the follwoing.

    $ rails g breadcrumble:views

then edit the partials in your app's `app/views/breadcrumble/` directory.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
