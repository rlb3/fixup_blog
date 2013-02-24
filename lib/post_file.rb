require 'yaml'

class PostFile
  attr_accessor :path
  attr_accessor :headers
  attr_accessor :body

  def initialize(path)
    @path = path
  end

  def parse
    text    = IO.read(self.path)
    matcher = %r{---(.*?)---(.*)}m.match(text)
    yaml    = matcher[1]
    body    = matcher[2]

    @headers = YAML.load(yaml)
    @body    = body

    true if @headers && @body
  end

end
