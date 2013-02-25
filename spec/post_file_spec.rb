$:.unshift(File.dirname(__FILE__) + '/../lib')
require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper.rb"))
require 'post_file'

describe PostFile do

  let(:path) { File.dirname(__FILE__) + '/fixtures/2012-10-20-all-my-old-posts.markdown' }
  subject { PostFile.new(path) }

  describe '.path' do
    it { subject.path.should == path }
  end

  describe '.parse' do
    it { subject.parse.should be_true }
  end

  describe '.correct_date' do
    let(:new_date) { '2012-12-25 00:00' }
    it do
      subject.parse
      subject.correct_date(new_date)
      subject.headers['date'].should == new_date
    end
  end

  describe 'to_text' do
    let(:text) { IO.read path }
    it do
      subject.parse
      subject.to_text.gsub(/[\s\n]+/,'').should == text.gsub(/[\s\n]+/,'')
    end
  end
end
