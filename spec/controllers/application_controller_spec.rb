require "spec_helper"

describe ApplicationController do
  controller do
    add_breadcrumb 'root', '/'
    add_breadcrumb 'nil', nil
    add_breadcrumb -> c { c.examples_url }, -> c { c.examples_path }

    def index
      add_breadcrumb 'examples', controller: 'examples', action: 'index', only_path: true
      render text: 'test'
    end
  end

  describe '#index' do
    subject do
      get :index
    end

    context '.add_breadcrumb' do
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

      it 'execute lambda in controller instance context' do
        should be_success
        assigns(:breadcrumbs)[2][:name].should eq('http://test.host/examples')
        assigns(:breadcrumbs)[2][:url].should eq('/examples')
      end
    end

    context '#add_breadcrumb' do
      it 'url options' do
        should be_success
        assigns(:breadcrumbs)[3][:name].should eq('examples')
        assigns(:breadcrumbs)[3][:url].should eq('/examples')
      end
    end
  end
end
