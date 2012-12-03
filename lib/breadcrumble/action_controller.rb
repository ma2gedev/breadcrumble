module Breadcrumble
  module ActionController
    def self.included(klass)
      klass.extend(ClassMethods)
      klass.helper_method :add_crumb, :breadcrumbs
    end

    module ClassMethods
      def add_crumb name, url = nil
        before_filter do |controller|
          controller.send :add_crumb, name, url
        end
      end
    end

    protected

    def add_crumb name, url = nil
      @breadcrumbs ||= []
      @breadcrumbs << { name: name, url: url ? url_for(url) : nil }
    end

    def breadcrumbs
      @breadcrumbs
    end
  end
end
