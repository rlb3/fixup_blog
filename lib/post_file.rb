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
  end

  def parsed?
    true if self.headers && self.body
  end

  def title
    self.headers['title']
  end

  def layout
    self.headers['layout']
  end

  def date=(new_date)
    self.headers['date'] = new_date
  end

  def date
    self.headers['date']
  end

  def comments
    self.headers['comments']
  end

  def categories
    self.headers['categories']
  end

  def to_text
    text = <<TEXT
---
layout: #{self.layout}
title: "#{self.title}"
date: #{self.date}
comments: #{self.comments}
categories: #{self.categories}
---
#{self.body}
TEXT
  end
end
