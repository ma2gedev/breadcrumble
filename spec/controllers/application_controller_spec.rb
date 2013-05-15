require "spec_helper"

describe ApplicationController do
  controller do
    add_breadcrumbs ['root', '/'], ['nil', nil]
    add_breadcrumb -> c { c.examples_url }, -> c { c.examples_path }

    def index
      add_breadcrumb 'examples', controller: 'examples', action: 'index', only_path: true
      add_breadcrumb 'example', example_path(123)
      add_breadcrumbs ['crumb1'], ['crumb2', -> c { example_path(1234) }]
      render text: 'test'
    end
  end

  describe '#index' do
    subject do
      get :index
    end

    context '.add_breadcrumbs' do
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

    context '.add_breadcrumb' do
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

      it 'example_path' do
        should be_success
        assigns(:breadcrumbs)[4][:name].should eq('example')
        assigns(:breadcrumbs)[4][:url].should eq('/examples/123')
      end
    end

    context '#add_breadcrumbs' do
      it 'sequence is starting from first argument' do
        should be_success
        assigns(:breadcrumbs)[5][:name].should eq('crumb1')
        assigns(:breadcrumbs)[5][:url].should be_nil
        assigns(:breadcrumbs)[6][:name].should eq('crumb2')
        assigns(:breadcrumbs)[6][:url].should eq('/examples/1234')
      end
    end
  end
end
