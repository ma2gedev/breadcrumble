module Breadcrumble
  module ActionController
    def self.included klass
      klass.extend ClassMethods
      klass.helper_method :add_breadcrumb, :breadcrumbs
    end

    module ClassMethods
      def add_breadcrumb name, url = nil
        before_filter do |controller|
          controller.send :add_breadcrumb, name, url
        end
      end

      def add_crumb name, url = nil
        warn "[DEPRECATION] 'add_crumb' is deprecated. Please use 'add_breadcrumb' instead."
        add_breadcrumb name, url
      end
    end

    protected

    def add_breadcrumb name, url = nil
      @breadcrumbs ||= []
      @breadcrumbs << { name: name, url: url ? url_for(url) : nil }
    end

    def add_crumb name, url = nil
      warn "[DEPRECATION] 'add_crumb' is deprecated. Please use 'add_breadcrumb' instead."
      add_breadcrumb name, url
    end

    def breadcrumbs
      @breadcrumbs
    end
  end
end
