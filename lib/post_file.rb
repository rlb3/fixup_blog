require 'yaml'
require 'stringex'

class PostFile
  attr_accessor :path
  attr_accessor :headers
  attr_accessor :body

  def initialize(path)
    @path = path
  end

  def write
    IO.write(path, to_text)
  end

  def parse
    text    = IO.read(self.path)
    matcher = %r{---(.*?)---(.*)}m.match(text)
    yaml    = matcher[1]
    body    = matcher[2]

    @headers = YAML.load(yaml)
    @body    = body.strip
  end

  def parsed?
    true if self.headers && self.body
  end

  def title=(new_title)
    self.headers['title'] = new_title
  end

  def title
    self.headers['title'].gsub(/^"|"$/, '')
  end

  def layout
    self.headers['layout']
  end

  def date=(new_date)
    self.headers['date'] = new_date
    update_path
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

  def update_path
    base_dir = File.dirname(self.path)
    datetime = DateTime.parse(self.date)
    self.path = "#{base_dir}/#{datetime.strftime('%Y-%m-%d')}-#{self.title.to_url}.markdown"
  end

  def to_text

    clean_title = "\"#{self.title.gsub(/"/,'')}\"".inspect
    text = <<TEXT
---
layout: #{self.layout}
title: #{clean_title}
date: #{self.date}
comments: #{self.comments}
categories: #{self.categories}
---
#{self.body}
TEXT
  end

  def to_s
    self.path
  end
end
