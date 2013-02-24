$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'post_file'

require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper.rb"))

describe PostFile do
  describe '.path' do
    let(:path) { File.dirname(__FILE__) + '/fixture/2012-10-20-all-my-old-posts.markdown' }
    subject { PostFile.new(path) }
    
    it { subject.path.should == path }
  end
end
