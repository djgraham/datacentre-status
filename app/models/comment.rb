class Comment < ActiveRecord::Base

  belongs_to :event, :touch => true

  accepts_nested_attributes_for :event

end
