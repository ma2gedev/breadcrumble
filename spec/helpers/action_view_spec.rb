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
  context '#render_breadcrumb_trails' do
    before do
      helper.stub!(:breadcrumb_trails).and_return([
        [
          { name: 'trail1_level1', url: '/trail1_level1_url' },
          { name: 'trail1_level2', url: '/trail1_level2_url' }
        ],
        [
          { name: 'trail2_level1', url: '/trail2_level1_url' },
          { name: 'trail2_level2', url: '/trail2_level2_url' }
        ]
      ])
    end
    subject { helper.render_breadcrumb_trails }
    it { should match('trail1_level1') }
    it { should match('trail1_level1_url') }
    it { should match('trail1_level2') }
    it { should match('trail1_level2_url') }
    it { should match('trail2_level1') }
    it { should match('trail2_level1_url') }
    it { should match('trail2_level2') }
    it { should match('trail2_level2_url') }
  end
end
