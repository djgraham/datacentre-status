class Comment < ActiveRecord::Base

  belongs_to :event, :autosave => true

end
