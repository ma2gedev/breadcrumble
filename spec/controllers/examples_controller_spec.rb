require "spec_helper"

describe ExamplesController do
  describe '#index' do
    subject do
      get :index
    end

    it 'breadcrumbs' do
      should be_success
      controller.send(:breadcrumbs).should eq([])
    end

    it 'breadcrumb_trails' do
      should be_success
      controller.send(:breadcrumb_trails).should eq([])
    end
  end
end
