module Breadcrumble
  module ActionController
    extend ActiveSupport::Concern

    included do
      helper_method :add_breadcrumb, :breadcrumbs
    end

    module ClassMethods
      def add_breadcrumb name, url = nil
        before_filter do |controller|
          controller.send :add_breadcrumb, name, url
        end
      end
    end

    protected

    def add_breadcrumb name, url = nil
      @breadcrumbs ||= []
      @breadcrumbs << {
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

    def breadcrumbs
      @breadcrumbs
    end
  end
end
