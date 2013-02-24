$:.unshift(File.dirname(__FILE__) + '/../lib')
require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper.rb"))
require 'post_file'

describe PostFile do

  context 'with a correctly formatted file' do
    let(:path) { File.dirname(__FILE__) + '/fixtures/2012-10-20-all-my-old-posts.markdown' }
    subject { PostFile.new(path) }

    describe '.path' do
      it { subject.path.should == path }
    end

    describe '.parse' do
      it { subject.parse.should be_true }
    end
  end
end
