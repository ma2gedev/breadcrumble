require "spec_helper"

describe ApplicationController do
  controller do
    add_crumb 'root', '/'
    add_crumb 'nil', nil

    def index
      add_crumb 'examples', controller: 'examples', action: 'index', only_path: true
      render text: 'test'
    end
  end

  describe '#index' do
    subject do
      get :index
    end

    context '.add_crumb' do
      it 'having breadcrumbs' do
        should be_success
        assigns(:breadcrumbs)[0][:name].should eq('root')
        assigns(:breadcrumbs)[0][:url].should eq('/')
      end

      it 'url has nil value' do
        should be_success
        assigns(:breadcrumbs)[1][:name].should eq('nil')
        assigns(:breadcrumbs)[1][:url].should be_nil
      end
    end

    context '#add_crumb' do
      it 'url options' do
        should be_success
        assigns(:breadcrumbs)[2][:name].should eq('examples')
        assigns(:breadcrumbs)[2][:url].should eq('/examples')
      end
    end
  end
end
