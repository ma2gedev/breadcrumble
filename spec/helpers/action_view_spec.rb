require 'spec_helper'

describe 'Breadcrumble::ActionView' do
  context '#render_breadcrumbs' do
    before do
      helper.stub!(:breadcrumbs).and_return([
        { name: 'root_name', url: '/root_url' },
        { name: 'test_name', url: '/test_url' }
      ])
    end
    subject { helper.render_breadcrumbs }
    it { should match('root_name') }
    it { should match('root_url') }
    it { should match('test_name') }
    it { should match('test_url') }
  end
end
