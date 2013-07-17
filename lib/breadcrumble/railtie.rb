module Breadcrumble
  class Railtie < ::Rails::Railtie
    initializer 'breadcrumble.initialize' do
      ActiveSupport.on_load(:action_controller) do
        include Breadcrumble::ActionController
      end

      ActiveSupport.on_load(:action_view) do
        include Breadcrumble::ActionView
      end
    end
  end
end
