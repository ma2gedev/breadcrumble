module Breadcrumble
  module ActionView
    def render_breadcrumbs options=nil
      render partial: 'breadcrumble/breadcrumb', locals: options
    end
  end
end
