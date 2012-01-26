class Status < ActiveRecord::Base

  validates_presence_of :name, :colour
  validates_uniqueness_of :name

end
