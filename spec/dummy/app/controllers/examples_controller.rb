class ExamplesController < ApplicationController
  protect_from_forgery

  def index
    render plain: 'test'
  end

  def show
    render plain: 'test'
  end
end
