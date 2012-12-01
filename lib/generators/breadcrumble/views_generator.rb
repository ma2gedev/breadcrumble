module Breadcrumble
  module Generators
    class ViewsGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../../../../app/views/breadcrumble',  __FILE__)
      desc 'This generator generates breadcrumbs partial template.'

      def generate_views
        name = '_breadcrumb.html.erb'
        copy_file "#{name}", "app/views/breadcrumble/#{name}"
      end
    end
  end
end
