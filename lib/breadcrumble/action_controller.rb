module Breadcrumble
  module ActionController
    def self.included(klass)
      klass.extend(ClassMethods)
      klass.helper_method :add_crumb, :breadcrumbs
    end

    module ClassMethods
      def add_crumb name, url
        before_filter do |controller|
          controller.send :add_crumb, name, url
        end
      end
    end

    protected

    def add_crumb(name, url = '')
      @breadcrumbs ||= []
      @breadcrumbs << { name: name, url: url }
      puts @breadcrumbs
    end

    def breadcrumbs
      @breadcrumbs
    end
  end
end
