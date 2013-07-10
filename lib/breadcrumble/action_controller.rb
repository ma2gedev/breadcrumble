module Breadcrumble
  module ActionController
    extend ActiveSupport::Concern

    included do
      helper_method :add_breadcrumb, :breadcrumbs, :breadcrumb_trails
    end

    module ClassMethods
      # Add a breadcrumb.
      # @example
      #   add_breadcrumb("home", home_url)
      #   add_breadcrumb(-> context { context.title }, -> context { context.sample_path })
      def add_breadcrumb(name, url = nil, filter_options = {})
        before_filter(filter_options) do |controller|
          controller.send(:add_breadcrumb, name, url)
        end
      end

      def add_breadcrumb_to(name, url, trail_index, filter_options = {})
        before_filter(filter_options) do |controller|
          controller.send(:add_breadcrumb_to, name, url, trail_index)
        end
      end

      def add_breadcrumbs(*args)
        before_filter do |controller|
          args.each do |arg|
            controller.send(:add_breadcrumb, arg[0], arg[1])
          end
        end
      end
    end

    protected

    # Add a breadcrumb.
    # @example
    #   add_breadcrumb("index", controller: 'sample', action: 'index')
    #   add_breadcrumb("show", show_path(123))
    def add_breadcrumb(name, url = nil)
      add_breadcrumb_to(name, url, 0)
    end

    def add_breadcrumb_to(name, url, trail_index)
      self.breadcrumb_trails
      @breadcrumb_trails[trail_index] ||= []
      @breadcrumb_trails[trail_index] << {
        name: case name
              when Proc then name.call(self)
              else name
              end,
        url:  case url
              when Proc then url.call(self)
              else url ? url_for(url) : nil
              end
      }
    end

    def add_breadcrumbs(*args)
      args.each do |arg|
        add_breadcrumb(arg[0], arg[1])
      end
    end

    def breadcrumb_trails
      @breadcrumb_trails ||= []
    end

    # Array of the breadcrumbs.
    def breadcrumbs
      self.breadcrumb_trails.first || []
    end
  end
end
