# Breadcrumble

Breadcrumble is a simple breadcrumb navigation plugin for Ruby on Rails 3.

## Installation

Add this line to your application's Gemfile:

    gem 'breadcrumble'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install breadcrumble

## Usage
In your controller, call `add_crumb` to push a new crumb on the breadcrumb stack.

    class SampleController
    
      add_crumb "home", home_url
      add_crumb "sample", sample_url
      
      def index
        add_crumb "index", index_url
      end
    
    end

In your view, you can render the breadcrumb navigation with the `render_breadcrumbs` helper.

    <body>
      <%= render_breadcrumbs %>
    </body>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
