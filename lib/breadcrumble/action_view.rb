module Breadcrumble
  module ActionView
    def render_breadcrumbs options=nil
      render partial: 'breadcrumble/breadcrumb', locals: options
    end

    def render_breadcrumb_trails options=nil
      render partial: 'breadcrumble/breadcrumb_trails', locals: options
    end
  end
end
