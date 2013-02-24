require 'rubygems'
require 'active_record'

ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.establish_connection(:adapter  => "postgresql",
                                        :host => "localhost",
                                        :database => "mt",
                                        :username => "robert",
                                        :password => "" )
