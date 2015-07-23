require 'spec_helper'

describe 'Breadcrumble::ActionView' do
  context '#render_breadcrumbs' do
    before do
      stub(helper).breadcrumbs {[
        { name: 'root_name', url: '/root_url' },
        { name: 'test_name', url: '/test_url' }
      ]}
    end
    context 'schema.org' do
      subject { helper.render_breadcrumbs }
      it { is_expected.to match('root_name') }
      it { is_expected.to match('root_url') }
      it { is_expected.to match('test_name') }
      it { is_expected.to match('test_url') }
      it { is_expected.to match(' itemscope ') }
    end
    context 'data-vocabulary.org' do
      subject { helper.render_breadcrumbs(theme: 'data_vocabulary') }
      it { is_expected.to match('root_name') }
      it { is_expected.to match('root_url') }
      it { is_expected.to match('test_name') }
      it { is_expected.to match('test_url') }
      it { is_expected.to match(' itemscope ') }
    end
  end
  context '#render_breadcrumb_trails' do
    before do
      stub(helper).breadcrumb_trails {[
        [
          { name: 'trail1_level1', url: '/trail1_level1_url' },
          { name: 'trail1_level2', url: '/trail1_level2_url' }
        ],
        [
          { name: 'trail2_level1', url: '/trail2_level1_url' },
          { name: 'trail2_level2', url: '/trail2_level2_url' }
        ]
      ]}
    end
    context 'schema.org' do
      subject { helper.render_breadcrumb_trails }
      it { is_expected.to match('trail1_level1') }
      it { is_expected.to match('trail1_level1_url') }
      it { is_expected.to match('trail1_level2') }
      it { is_expected.to match('trail1_level2_url') }
      it { is_expected.to match('trail2_level1') }
      it { is_expected.to match('trail2_level1_url') }
      it { is_expected.to match('trail2_level2') }
      it { is_expected.to match('trail2_level2_url') }
      it { is_expected.to match('itemscope itemtype="http://schema.org/BreadcrumbList"') }
      it { is_expected.to match('itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem"') }
    end
    context 'data-vocabulary.org' do
      subject { helper.render_breadcrumb_trails(theme: 'data_vocabulary') }
      it { is_expected.to match('trail1_level1') }
      it { is_expected.to match('trail1_level1_url') }
      it { is_expected.to match('trail1_level2') }
      it { is_expected.to match('trail1_level2_url') }
      it { is_expected.to match('trail2_level1') }
      it { is_expected.to match('trail2_level1_url') }
      it { is_expected.to match('trail2_level2') }
      it { is_expected.to match('trail2_level2_url') }
      it { is_expected.to match('itemprop="child" itemscope itemtype="http://data-vocabulary.org/Breadcrumb"') }
    end
  end
  context '#render_breadcrumbs with theme' do
    before do
      stub(helper).breadcrumbs {[
        { name: 'root_name', url: '/root_url' },
        { name: 'test_name', url: '/test_url' }
      ]}
    end
    subject { helper.render_breadcrumbs(theme: 'test') }
    it { is_expected.to match('test breadcrumb theme') }
    it { is_expected.to match(' itemscope ') }
  end
  context '#render_breadcrumb_trails with theme' do
    before do
      stub(helper).breadcrumb_trails {[
        [
          { name: 'trail1_level1', url: '/trail1_level1_url' },
          { name: 'trail1_level2', url: '/trail1_level2_url' }
        ],
        [
          { name: 'trail2_level1', url: '/trail2_level1_url' },
          { name: 'trail2_level2', url: '/trail2_level2_url' }
        ]
      ]}
    end
    subject { helper.render_breadcrumb_trails(theme: 'test') }
    it { is_expected.to match('test breadcrumb_trails theme') }
  end
end
