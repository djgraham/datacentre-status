class Event < ActiveRecord::Base
  belongs_to :status

  validates_presence_of :title, :content, :status
  

  def active?
    scheduled_at < Time.now && !resolved?
  end

  def resolved?
    resolved_at?
  end

end
