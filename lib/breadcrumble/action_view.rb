module Breadcrumble
  module ActionView
    # Render breadcrumbs.
    def render_breadcrumbs(options = nil)
      render partial: 'breadcrumble/breadcrumb', locals: options
    end

    # Render breadcrumb trails.
    def render_breadcrumb_trails(options = nil)
      render partial: 'breadcrumble/breadcrumb_trails', locals: options
    end
  end
end
