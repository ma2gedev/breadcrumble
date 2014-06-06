module Breadcrumble
  module ActionView
    # Render breadcrumbs.
    def render_breadcrumbs(options = {})
      _render_breadcrumb('breadcrumb', options)
    end

    # Render breadcrumb trails.
    def render_breadcrumb_trails(options = {})
      _render_breadcrumb('breadcrumb_trails', options)
    end

    private

    def _render_breadcrumb(path, options)
      theme = options[:theme] ? "#{options[:theme]}/" : ''
      render partial: "breadcrumble/#{theme}#{path}", locals: options
    end
  end
end
