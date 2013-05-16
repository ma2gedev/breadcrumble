module Breadcrumble
  module Generators
    class ViewsGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../../../../app/views/breadcrumble',  __FILE__)
      desc 'This generator generates breadcrumbs partial template.'

      def generate_views
        names = ['_breadcrumb.html.erb', '_breadcrumb_trails.html.erb', '_breadcrumb_trail.html.erb']
        names.each do |name|
          copy_file "#{name}", "app/views/breadcrumble/#{name}"
        end
      end
    end
  end
end
