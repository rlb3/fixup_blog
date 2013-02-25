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
    @body    = body.gsub(/^\n|\n$/, '')

    true if @headers && @body
  end

  def correct_date(new_date)
    self.headers['date'] = new_date
  end

  def title
    self.headers['title']
  end

  def to_text
    text = <<TEXT
---
layout: #{self.headers['layout']}
title: "#{self.headers['title']}"
date: #{self.headers['date']}
comments: #{self.headers['comments']}
categories: #{self.headers['categories']}
---
#{self.body}
TEXT
  end

end
