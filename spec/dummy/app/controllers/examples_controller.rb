class ExamplesController < ApplicationController
  protect_from_forgery

  def index
    render text: 'test'
  end

  def show
    render text: 'test'
  end
end
