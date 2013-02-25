require 'data_mapper'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'postgres://robert@localhost/mt')

class Entry
  include DataMapper::Resource

  storage_names[:default] = 'mt_entry'

  property :id, Serial, :field => 'entry_id'
  property :title, String, :field => 'entry_title'
  property :date, DateTime, :field => 'entry_authored_on'
end
