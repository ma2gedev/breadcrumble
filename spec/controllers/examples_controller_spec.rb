require "spec_helper"

describe ExamplesController do
  describe '#index' do
    subject do
      get :index
    end

    it 'breadcrumbs' do
      is_expected.to be_success
      expect(controller.send(:breadcrumbs)).to eq([])
    end

    it 'breadcrumb_trails' do
      is_expected.to be_success
      expect(controller.send(:breadcrumb_trails)).to eq([])
    end
  end
end
