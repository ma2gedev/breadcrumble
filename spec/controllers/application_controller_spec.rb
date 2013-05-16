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
        assigns(:breadcrumbs)[0].should eq({name: 'root', url: '/'})
      end

      it 'url has nil value' do
        should be_success
        assigns(:breadcrumbs)[1].should eq({name: 'nil', url: nil})
      end
    end

    context '.add_breadcrumb' do
      it 'execute lambda in controller instance context' do
        should be_success
        assigns(:breadcrumbs)[2].should eq({name: 'http://test.host/examples', url: '/examples'})
      end
    end

    context '#add_breadcrumb' do
      it 'url options' do
        should be_success
        assigns(:breadcrumbs)[3].should eq({name: 'examples', url: '/examples'})
      end

      it 'example_path' do
        should be_success
        assigns(:breadcrumbs)[4].should eq({name: 'example', url: '/examples/123'})
      end
    end

    context '#add_breadcrumbs' do
      it 'sequence is starting from first argument' do
        should be_success
        assigns(:breadcrumbs)[5].should eq({name: 'crumb1', url: nil})
        assigns(:breadcrumbs)[6].should eq({name: 'crumb2', url: '/examples/1234'})
      end
    end
  end
end
