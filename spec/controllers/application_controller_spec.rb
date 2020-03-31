require "spec_helper"

describe ApplicationController do
  controller do
    add_breadcrumbs(['root', '/'], ['nil', nil])
    add_breadcrumb(-> c { c.examples_url }, -> c { c.examples_path })
    add_breadcrumb_to(-> c { c.examples_url }, -> c { c.examples_path }, 1, only: :show)
    add_breadcrumb_to('multi third 1', 'multi third url 1', 2, only: :show)

    def index
      add_breadcrumb('examples', controller: 'examples', action: 'index', only_path: true)
      add_breadcrumb('example', example_path(123))
      add_breadcrumbs(['crumb1'], ['crumb2', -> c { example_path(1234) }])
      render plain: 'test'
    end

    def show
      add_breadcrumb_to('examples', {controller: 'examples', action: 'index', only_path: true}, 1)
      add_breadcrumb_to('example', example_path(123), 1)
      add_breadcrumb_to('multi third 2', 'multi third url 2', 2)
      add_breadcrumb_to('multi third 3', 'multi third url 3', 2)
      render plain: 'test'
    end
  end

  describe '#index' do
    subject do
      get :index
    end

    context '.add_breadcrumbs' do
      it 'having breadcrumbs' do
        is_expected.to be_success
        expect(assigns(:breadcrumb_trails)[0][0]).to eq({name: 'root', url: '/'})
      end

      it 'url has nil value' do
        is_expected.to be_success
        expect(assigns(:breadcrumb_trails)[0][1]).to eq({name: 'nil', url: nil})
      end
    end

    context '.add_breadcrumb' do
      it 'execute lambda in controller instance context' do
        is_expected.to be_success
        expect(assigns(:breadcrumb_trails)[0][2]).to eq({name: 'http://test.host/examples', url: '/examples'})
      end
    end

    context '#add_breadcrumb' do
      it 'url options' do
        is_expected.to be_success
        expect(assigns(:breadcrumb_trails)[0][3]).to eq({name: 'examples', url: '/examples'})
      end

      it 'example_path' do
        is_expected.to be_success
        expect(assigns(:breadcrumb_trails)[0][4]).to eq({name: 'example', url: '/examples/123'})
      end
    end

    context '#add_breadcrumbs' do
      it 'sequence is starting from first argument' do
        is_expected.to be_success
        expect(assigns(:breadcrumb_trails)[0][5]).to eq({name: 'crumb1', url: nil})
        expect(assigns(:breadcrumb_trails)[0][6]).to eq({name: 'crumb2', url: '/examples/1234'})
      end
    end
  end

  describe '#show' do
    subject do
      get :show, params: { id: 1 }
    end

    context 'multiple breadcrumbs' do
      it 'having breadcrumbs in second trail' do
        is_expected.to be_success
        expect(assigns(:breadcrumb_trails)[1][0]).to eq({name: 'http://test.host/examples', url: '/examples'})
        expect(assigns(:breadcrumb_trails)[1][1]).to eq({name: 'examples', url: '/examples'})
        expect(assigns(:breadcrumb_trails)[1][2]).to eq({name: 'example', url: '/examples/123'})
      end

      it 'having breadcrumbs in third trail' do
        is_expected.to be_success
        expect(assigns(:breadcrumb_trails)[2][0]).to eq({name: 'multi third 1', url: 'multi third url 1'})
        expect(assigns(:breadcrumb_trails)[2][1]).to eq({name: 'multi third 2', url: 'multi third url 2'})
        expect(assigns(:breadcrumb_trails)[2][2]).to eq({name: 'multi third 3', url: 'multi third url 3'})
      end
    end
  end
end
