class Event < ActiveRecord::Base
  belongs_to :status
  has_many :comments, :dependent => :destroy

  accepts_nested_attributes_for :comments

  validates_presence_of :title, :content, :status

  def active?
    scheduled_at < Time.now && !resolved?
  end

  def resolved?
    resolved_at?
  end

end
